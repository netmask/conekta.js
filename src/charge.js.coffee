Conekta.charge = {}

Conekta.charge.create = (charge_form, success_callback, failure_callback)->
  if typeof success_callback != 'function'
    success_callback = Conekta._helpers.log

  if typeof failure_callback != 'function'
    failure_callback = Conekta._helpers.log

  charge = Conekta._helpers.parseForm(charge_form)
  charge.session_id = Conekta._helpers.getSessionId()

  if typeof charge == 'object'
    #charge.capture = false
    Conekta._helpers.xDomainPost(
      jsonp_url:'charges/create'#'https://api.conekta.io'
      url:'charges'#'https://api.conekta.io'
      data:charge
      success:success_callback
      error:failure_callback
    )
  else
    failure_callback(
      'object':'error'
      'type':'invalid_request_error'
      'message':"Supplied parameter 'charge' is not a javascript object"
    )
