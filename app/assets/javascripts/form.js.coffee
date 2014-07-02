class window.Form

  constructor: ->

    this.datepicker()
    this.selectFields()


  datepicker: =>

    $('input.bootstrap_datepicker').datepicker
      autoclose: true

    $(document).on 'changeDate', '.bootstrap-datepicker', (evt) ->
      rails_date = evt.date.getFullYear() + '-' + ('0' + (evt.date.getMonth() + 1)).slice(-2) + '-' + ('0' + evt.date.getDate()).slice(-2)
      $(this).next("input[type=hidden]").val(rails_date)

  selectFields: =>
    $("select").select2()