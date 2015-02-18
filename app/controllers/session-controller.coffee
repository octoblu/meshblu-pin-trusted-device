PinController = require './pin-controller'

class SessionController
  constructor: (uuid, meshblu) ->
    @pinController = new PinController uuid, meshblu: meshblu

  create: (request, response) =>
    uuid = request.params.uuid
    pin  = request.body.pin

    @pinController.getToken uuid, pin, (error, device) =>
      return response.status(500).send error: error if error?
      response.status(201).send token: device.token

module.exports = SessionController
