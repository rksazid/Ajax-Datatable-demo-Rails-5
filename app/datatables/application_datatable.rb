class ApplicationDatatable
  delegate :params, to: :@view
  delegate :link_to, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(_options = {})
    {
      recordsTotal: count,
      recordsFiltered: total_entries,
      data: data
    }
  end

  def ellipsisize(text, len = 20)
    return nil unless text

    text = text.to_s
    text&.truncate(len, omission: "...#{text.last(10)}")
  end

  def show_datetime(datetime, offset=nil)
    datetime += offset.hours unless offset.nil?
    datetime&.strftime('%Y-%m-%d %I:%M %p')
  end

  def sanitize_text(text)
    text = ActionController::Base.helpers.sanitize(text,
                                                   tags: [],
                                                   attributes: [])
    text.gsub(/<script>/, '') if text.present?
  end

  def squish_text(text)
    if text.present?
      text.squish
    else
      text
    end
  end

  private

  def page
    params[:start].to_i / per_page + 1
  end

  def per_page
    params[:length].to_i.positive? ? params[:length].to_i : total_entries
  end

  def sort_column
    columns[params[:order]['0'][:column].to_i]
  end

  def sort_direction
    params[:order]['0'][:dir] == 'desc' ? 'desc' : 'asc'
  end
end
