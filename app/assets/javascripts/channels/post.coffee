$(document).ready ->
  if `$("#comment_area").data("postId")`
    App.post = App.cable.subscriptions.create {channel: "PostChannel", id: `$("#comment_area").data("postId")`},
      connected: ->
# Called when the subscription is ready for use on the server

      disconnected: ->
# Called when the subscription has been terminated by the server

      received: (data) ->
        $('#comments').append data['comment']

      speak: (comment) ->
        @perform 'speak', comment: comment, post: `$("#comment_area").data("postId")`, user: `$("#comment_area").data("userId")`

    $(document).on 'keypress', '[data-behavior~=post_speaker]', (event) ->
      if event.keyCode is 13
        if event.target.value.trim() != ''
          App.post.speak event.target.value
          event.target.value = ''
        event.preventDefault()