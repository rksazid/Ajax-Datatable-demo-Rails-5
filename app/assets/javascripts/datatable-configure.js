$(document).ready(function() {
    $('#data-table-ajax').DataTable({
        "aLengthMenu": [[10, 20, 30, 50, 75, -1], [10, 20, 30, 50, 75, "All"]],
        "pageLength": 20,
        "order": [[ 0, "desc" ]],
        "aoColumnDefs": [{
            'bSortable': false,
            'aTargets': ['nosort']
        }],
        "dom": 'lfrtip',
        stateSave: true,
        processing: true,
        serverSide: true,
        responsive: true,
        pagingType: 'numbers',
        ajax: true
    });
});
