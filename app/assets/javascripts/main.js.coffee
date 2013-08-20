valid = (form_data) ->
  !!form_data['name']
  
render = (form_data) ->
  ($ '#placeholder_name').html(form_data['name'])
  fields = ($ '#flyer .contacts').data()
  ($ '#placeholder_contacts').html('')
  for field_name, field_value of form_data
    if ($ '#placeholder_contacts p').length < 6
      ($ '#placeholder_contacts').append("<p>#{fields[field_name]}:&nbsp;&nbsp;&nbsp;<span>#{field_value}</span></p>") 

add_error = (field_container, message) ->
  ($ field_container).addClass 'error'
  ($ field_container).find('.controls').append("<span class='help-inline'>#{message}</span>")

remove_errors = () ->
  ($ '.control-group').removeClass('error')
  ($ '.control-group .help-inline').detach()

$ ->
  ($ '#form form').on 'submit', (e) ->
    if ($ '#form').is(":visible") 
      e.preventDefault()
      form_data = {}
      for el in ($ this).serializeArray()
        form_data[el.name.replace /person\[(\w+)\]/, "$1"] = el.value if el.name.match('person') && el.value.length > 0
      if valid(form_data)
        ($ '#form').fadeOut()
        remove_errors()
        ($ '.blurry').removeClass('blurry')
        ($ '#panel button').prop('disabled', false)
        render(form_data)
      else
        add_error ($ '.control-group').first(), 'Обязательное поле'
  
  ($ '#edit').on 'click', (e) ->
    ($ '#form').fadeIn()
    ($ '#panel, #flyer').addClass('blurry')
    ($ '#panel button').prop('disabled', true)
    
  ($ '#download').on 'click', (e) ->
    ($ '#if_download').val("1")
    ($ '#form form').trigger 'submit'

  ($ '#print').on 'click', (e) ->
    ($ '#if_download').val("0")
    ($ '#form form').trigger 'submit'  
  