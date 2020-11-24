class UsersOnlineChannel < ApplicationCable::Channel
  def subscribed
    stream_from('users_online_channel')
    ActionCable.server.broadcast 'users_online_channel',
                                 user_id: current_user.id,
                                 online: true
  end

  def unsubscribed
    ActionCable.server.broadcast 'users_online_channel',
                                 user_id: current_user.id,
                                 online: false
  end
end
