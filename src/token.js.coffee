Conekta.token = {}

Conekta.token.create = (token_form, success_callback, failure_callback)->
  if typeof success_callback != 'function'
    success_callback = Conekta._helpers.log

  if typeof failure_callback != 'function'
    failure_callback = Conekta._helpers.log

  token = Conekta._helpers.parseForm(token_form)
  token.card.device_fingerprint = Conekta._helpers.getSessionId()

  if typeof token == 'object'
    #charge.capture = false
    Conekta._helpers.xDomainPost(
      jsonp_url:'tokens/create'#'https://api.conekta.io'
      url:'tokens'#'https://api.conekta.io'
      data:token
      success:success_callback
      error:failure_callback
    )
  else
    failure_callback(
      'object':'error'
      'type':'invalid_request_error'
      'message':"Supplied parameter 'token' is not a javascript object"
    )
