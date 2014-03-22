Conekta.charge = {}

Conekta.charge.create = (charge_form, success_callback, failure_callback)->
  if typeof success_callback != 'function'
    success_callback = Conekta._helpers.log

  if typeof failure_callback != 'function'
    failure_callback = Conekta._helpers.log

  charge = Conekta._helpers.parseForm(charge_form)

  if typeof charge == 'object'
    if Conekta._helpers.objectKeys(charge).length > 0
      charge.session_id = Conekta._helpers.getSessionId()
      if charge.card and charge.card.address and !(charge.card.address.street1 or charge.card.address.street2 or charge.card.address.street3 or charge.card.address.city or charge.card.address.state or charge.card.address.country or charge.card.address.zip)
        delete(charge.card.address)

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
        'message':"supplied parameter 'charge' is usable object but has no values (e.g. amount, description) associated with it"
      )
  else
    failure_callback(
      'object':'error'
      'type':'invalid_request_error'
      'message':"supplied parameter 'charge' is not a javascript object"
    )
