App.like = App.cable.subscriptions.create("LikeChannel", {
  connected() {},
  // Called when the subscription is ready for use on the server

  disconnected() {},
  // Called when the subscription has been terminated by the server

  received(data) {
  // Called when there's incoming data on the websocket for this channel
    if (data !== undefined) {
      if (data.type === 'stats-like') {
        $("#nb-like-" + data.picture_id).text(data.likes);
      }
    }
  }
});
