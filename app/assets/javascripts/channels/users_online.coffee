jQuery(document).on 'turbolinks:load', ->
  App.users_online = App.cable.subscriptions.create { channel: "UsersOnlineChannel"},
    connected: ->

    disconnected: ->

    received: (data) ->

