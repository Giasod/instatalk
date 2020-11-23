class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    Redis.new.set("№#{current_user.id}", "1")
    stream_from('appearance_channel')
    ActionCable.server.broadcast 'appearance_channel',
                                 user_id: current_user.id,
                                 online: true
  end
  
  def unsubscribed
    Redis.new.del("№#{current_user.id}")
    ActionCable.server.broadcast 'appearance_channel',
                                 user_id: current_user.id,
                                 online: false
  end
end
