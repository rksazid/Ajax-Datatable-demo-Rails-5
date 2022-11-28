class BookDatatable < ApplicationDatatable
  delegate :book_path, to: :@view
  delegate :edit_book_path, to: :@view

  private

  def data
    books.map.with_index do |book, idx|
      [].tap do |column|
        column << @serials[book.id]
        column << sanitize_text(book.title)
        column << book.author

        links = []
          links << link_to("show", book_path(book), title: "show")

        links << link_to("edit", edit_book_path(book), title: "edit")

        links << link_to("destroy", book_path(book),
                           title: "delete",
                           method: :delete,
                           data: {confirm: "Are you sure?" })


        column << links.join(' ')
      end
    end
  end

  def count
    Book.count
  end

  def total_entries
    books.count
  end

  def books
    @books ||= fetch_books
  end

  def fetch_books
    search_string = []
    columns[1..-1].each do |term|
      search_string << "#{term} like :search"
    end

    @books = Book.all

    @serials = {}
    book_ids = @books.pluck(:id)
    book_ids&.sort&.each_with_index do |id, sl|
      @serials[id] = sl + 1
    end

    books = @books.except(:order).order("#{sort_column} #{sort_direction}")
    books = books.page(page).per_page(per_page)
    books = books.where(search_string.join(' or '), search: "%#{squish_text(params[:search][:value])}%")

    books
  end

  def columns
    %w[id title author]
  end
end
