jQuery(document).on 'turbolinks:load', ->
  App.room = App.cable.subscriptions.create {channel: "AppearanceChannel"},
    connected: ->

    disconnected: ->

    received: (data) ->
