$(document).ready(function () {

});

var ready = function () {

    const minDate = moment(moment().format('YYYY-MM-DD'), 'YYYY-MM-DD');
    const minDateForEndsAt = typeof (gon.starts_at) === 'undefined' ? minDate : moment(gon.starts_at, 'YYYY-MM-DD');
    const maxDateForStartsAt = typeof (gon.ends_at) === 'undefined' ? moment().add(100, 'years') : moment(gon.ends_at, 'YYYY-MM-DD');

    $('#datetimepickerStartsAt').datetimepicker({
        minDate: minDate,
        maxDate: maxDateForStartsAt,
        format: 'YYYY-MM-DD',
        showClear: true,
        useCurrent: true,
        locale: 'es'
    });

    $('#datetimepickerEndsAt').datetimepicker({
        minDate: minDateForEndsAt,
        format: 'YYYY-MM-DD',
        showClear: true,
        useCurrent: false,
        locale: 'es'
    });

    $('#datetimepickerStartsAt').on('dp.change', function (e) {
        $('#datetimepickerEndsAt').data('DateTimePicker').minDate(e.date);
    });

    $('#datetimepickerEndsAt').on('dp.change', function (e) {
        $('#datetimepickerStartsAt').data('DateTimePicker').maxDate(e.date);
    });

    $('.datetimepicker-hour').datetimepicker({
        format: 'LT',
        showClear: true
    });

};

function remove_fields(link) {
    $(link).closest('.removable').remove();
}

function add_fields(link, association, content) {
    let new_id = new Date().getTime();

    if (association === 'schedules') {
        const remove_schedule = '<span class="glyphicon glyphicon-remove remove-schedule" data-identifier="' + new_id + '"></span>';
        content = content.replace('<span class="schedule-to-be-replaced"></span>', remove_schedule);
    } else if (association === 'schedule_details') {

        const remove_detail = '<span class="glyphicon glyphicon-remove remove-detail" data-identifier="' + new_id + '"></span>';
        content = content.replace('<span class="detail-to-be-replaced"></span>', remove_detail)
    }

    let regexp = new RegExp("new_" + association, "g");

    $(link).parent().before(content.replace(regexp, new_id));

    $('.datetimepicker-hour').datetimepicker({
        format: 'LT',
        showClear: true

    });

}


$(document).on('turbolinks:load', ready);
$(document).on('turbolinks:load', remove_fields());
$(document).on('turbolinks:load', add_fields());
