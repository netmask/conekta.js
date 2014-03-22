base_url = 'https://api.conekta.io/'
publishable_key = null
session_id = ""

useable_characters = "abcdefghijklmnopqrstuvwxyz0123456789"
for i in [0..30]
  session_id += useable_characters.charAt(Math.floor(Math.random() * 36))

fingerprint = ->
  if typeof document != 'undefined' and typeof document.body != 'undefined' and document.body and (document.readyState == 'interactive' or document.readyState == 'complete')
    body = document.getElementsByTagName('body')[0]

    #fingerprinting png
    fingerprint_png_p = document.createElement('p')
    fingerprint_png_p.setAttribute("style", "background:url(https://h.online-metrix.net/fp/clear.png?org_id=k8vif92e&session_id=banorteixe_conekta" + session_id + "&m=1) ! important; display:none ! important;")
    body.appendChild(fingerprint_png_p)

    fingerprint_png_img = document.createElement('img')
    fingerprint_png_img.setAttribute('style', 'display:none ! important;')
    fingerprint_png_img.src = "https://h.online-metrix.net/fp/clear.png?org_id=k8vif92e&session_id=banorteixe_conekta" + session_id + "&m=2"
    body.appendChild(fingerprint_png_img)

    #fingerprinting swf
    add_swf = ->
      fingerprint_swf_object = document.createElement('object')
      fingerprint_swf_object.type = 'application/x-shockwave-flash'
      fingerprint_swf_object.data = "https://h.online-metrix.net/fp/fp.swf?org_id=k8vif92e&session_id=banorteixe_conekta" + session_id
      fingerprint_swf_object.width = '1'
      fingerprint_swf_object.setAttribute('style', 'display:none ! important;')
      body.appendChild(fingerprint_swf_object)

      fingerprint_swf_param = document.createElement('param')
      fingerprint_swf_param.name = 'movie'
      fingerprint_swf_param.setAttribute('style', 'display:none ! important;')
      fingerprint_swf_param.value = 'https://h.online-metrix.net/fp/fp.swf?org_id=k8vif92e&session_id=merchant' + session_id
      if typeof fingerprint_swf_param.appendChild == 'function'
        fingerprint_swf_param.appendChild(document.createElement('div'))
      body.appendChild(fingerprint_swf_param)

      return

    if navigator.userAgent.match(/MSIE [5-9]+/) and document.readyState != 'complete'
      window.attachEvent("onload", add_swf)
    else
      add_swf()


    #fingerprinting script
    fingerprint_script = document.createElement('script')
    fingerprint_script.type = 'text/javascript'
    fingerprint_script.src = 'https://h.online-metrix.net/fp/check.js?org_id=k8vif92e&session_id=banorteixe_conekta' + session_id
    body.appendChild(fingerprint_script)
  else
    setTimeout(fingerprint, 150)
  return

fingerprint()

Base64 =
  # private property
  _keyStr: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/="

  # public method for encoding
  encode: (input) ->
    output = ""
    chr1 = undefined
    chr2 = undefined
    chr3 = undefined
    enc1 = undefined
    enc2 = undefined
    enc3 = undefined
    enc4 = undefined
    i = 0
    input = Base64._utf8_encode(input)
    while i < input.length
      chr1 = input.charCodeAt(i++)
      chr2 = input.charCodeAt(i++)
      chr3 = input.charCodeAt(i++)
      enc1 = chr1 >> 2
      enc2 = ((chr1 & 3) << 4) | (chr2 >> 4)
      enc3 = ((chr2 & 15) << 2) | (chr3 >> 6)
      enc4 = chr3 & 63
      if isNaN(chr2)
        enc3 = enc4 = 64
      else enc4 = 64  if isNaN(chr3)
      output = output + Base64._keyStr.charAt(enc1) + Base64._keyStr.charAt(enc2) + Base64._keyStr.charAt(enc3) + Base64._keyStr.charAt(enc4)
    output

  
  # public method for decoding
  decode: (input) ->
    output = ""
    chr1 = undefined
    chr2 = undefined
    chr3 = undefined
    enc1 = undefined
    enc2 = undefined
    enc3 = undefined
    enc4 = undefined
    i = 0
    input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "")
    while i < input.length
      enc1 = Base64._keyStr.indexOf(input.charAt(i++))
      enc2 = Base64._keyStr.indexOf(input.charAt(i++))
      enc3 = Base64._keyStr.indexOf(input.charAt(i++))
      enc4 = Base64._keyStr.indexOf(input.charAt(i++))
      chr1 = (enc1 << 2) | (enc2 >> 4)
      chr2 = ((enc2 & 15) << 4) | (enc3 >> 2)
      chr3 = ((enc3 & 3) << 6) | enc4
      output = output + String.fromCharCode(chr1)
      output = output + String.fromCharCode(chr2)  unless enc3 is 64
      output = output + String.fromCharCode(chr3)  unless enc4 is 64
    output = Base64._utf8_decode(output)
    output

  
  # private method for UTF-8 encoding
  _utf8_encode: (string) ->
    string = string.replace(/\r\n/g, "\n")
    utftext = ""
    n = 0

    while n < string.length
      c = string.charCodeAt(n)
      if c < 128
        utftext += String.fromCharCode(c)
      else if (c > 127) and (c < 2048)
        utftext += String.fromCharCode((c >> 6) | 192)
        utftext += String.fromCharCode((c & 63) | 128)
      else
        utftext += String.fromCharCode((c >> 12) | 224)
        utftext += String.fromCharCode(((c >> 6) & 63) | 128)
        utftext += String.fromCharCode((c & 63) | 128)
      n++
    utftext

  
  # private method for UTF-8 decoding
  _utf8_decode: (utftext) ->
    string = ""
    i = 0
    c = c1 = c2 = 0
    while i < utftext.length
      c = utftext.charCodeAt(i)
      if c < 128
        string += String.fromCharCode(c)
        i++
      else if (c > 191) and (c < 224)
        c2 = utftext.charCodeAt(i + 1)
        string += String.fromCharCode(((c & 31) << 6) | (c2 & 63))
        i += 2
      else
        c2 = utftext.charCodeAt(i + 1)
        c3 = utftext.charCodeAt(i + 2)
        string += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63))
        i += 3
    string

window.Conekta = 
  setPublishableKey: (key)->
    if typeof key == 'string' and key.match(/^[a-zA-Z0-9_]*$/) and key.length >= 20 and key.length < 30
      publishable_key = key
    else
      Conekta._helpers.log('Unusable public key: ' + key)
    return

  getPublishableKey: ()->
    publishable_key

  _helpers:
    objectKeys:(obj)->
      keys = []
      for p in o
        if Object.prototype.hasOwnProperty.call(o,p)
          keys.push(p)
      return keys

    parseForm:(charge_form)->
      charge = {}
      if typeof charge_form == 'object'
        if typeof jQuery != 'undefined' and (charge_form instanceof jQuery or 'jquery' of Object(charge_form))
          charge_form = charge_form.get()[0]
          #if jquery selector returned nothing
          if typeof charge_form != 'object'
            return {}


        if charge_form.nodeType
          textareas = charge_form.getElementsByTagName('textarea')
          inputs = charge_form.getElementsByTagName('input')
          selects = charge_form.getElementsByTagName('select')
          all_inputs = new Array(textareas.length + inputs.length + selects.length)

          for i in [0..textareas.length-1] by 1
            all_inputs[i] = textareas[i]

          for i in [0..inputs.length-1] by 1
            all_inputs[i+textareas.length] = inputs[i]

          for i in [0..selects.length-1] by 1
            all_inputs[i+textareas.length + inputs.length] = selects[i]

          for input in all_inputs
            if input
              attribute_name = input.getAttribute('data-conekta')
              if attribute_name
                if input.tagName == 'SELECT'
                    val = input.value
                else
                    val = input.getAttribute('value') || input.innerHTML || input.value
                attributes = attribute_name.replace(/\]/g, '').replace(/\-/g,'_').split(/\[/)

                parent_node = null
                node = charge
                last_attribute = null
                for attribute in attributes
                  if ! node[attribute]
                    node[attribute] = {}

                  parent_node = node
                  last_attribute = attribute
                  node = node[attribute]

                parent_node[last_attribute] = val
        else
          charge = charge_form

        if charge.details && charge.details.line_items && Object.prototype.toString.call( charge.details.line_items ) != '[object Array]' && typeof charge.details.line_items == 'object'
          line_items = []
          for key of charge.details.line_items
            line_items.push(charge.details.line_items[key])
          charge.details.line_items = line_items

      charge

    getSessionId:()->
      session_id

    xDomainPost:(params)->
      success_callback = (data, textStatus, jqXHR)->
        if ! data or (data.object == 'error')
          params.error(data || {
            object: 'error',
            type:'api_error',
            message:"Something went wrong on Conekta's end"
          })
        else
          params.success(data)

      error_callback = ()->
        params.error({
          object: 'error',
          type:'api_error',
          message:'Something went wrong, possibly a connectivity issue'
        })

      if document.location.protocol == 'file:'
        params.url = (params.jsonp_url || params.url) + '/create.js'
        params.data['_Version'] = "0.3.0"
        params.data['_RaiseHtmlError'] = false
        params.data['auth_token'] = Conekta.getPublishableKey()
        params.data['conekta_client_user_agent'] = '{"agent":"Conekta JavascriptBindings/0.3.0"}'

        ajax(
          url: base_url + params.url
          dataType: 'jsonp'
          data: params.data
          success: success_callback
          error: error_callback
        )
      else
        if typeof (new XMLHttpRequest()).withCredentials != 'undefined'
          ajax(
            url: base_url + params.url
            type: 'POST'
            dataType: 'json'
            data: JSON.stringify(params.data)
            contentType:'application/json'
            headers:
              'RaiseHtmlError': false
              'Accept': 'application/vnd.conekta-v0.3.0+json'
              'Conekta-Client-User-Agent':'{"agent":"Conekta JavascriptBindings/0.3.0"}'
              'Authorization':'Basic ' + Base64.encode(Conekta.getPublishableKey() + ':')
            success: success_callback
            error:error_callback
          )
        else
          rpc = new easyXDM.Rpc({
            swf:"https://conektaapi.s3.amazonaws.com/v0.3.0/flash/easyxdm.swf"
            remote: base_url + "easyxdm_cors_proxy.html"
          },{
            remote:{
              request:{}
            }
          })
          rpc.request({
            url: base_url + params.url
            method:'POST'
            headers:
              'RaiseHtmlError': false
              'Accept': 'application/vnd.conekta-v0.3.0+json'
              'Conekta-Client-User-Agent':'{"agent":"Conekta JavascriptBindings/0.3.0"}'
              'Authorization':'Basic ' + Base64.encode(Conekta.getPublishableKey() + ':')
            data:JSON.stringify(params.data)
          }, success_callback, error_callback)

    log: (data)->
      if typeof console != 'undefined' and console.log
        console.log(data)

