require 'httparty'
class ReplyService
	def initialize(room, room_message)
		@room = room
    @message = room_message.message
  end

  def call
  	resp = HTTParty.post('http://localhost.:5005/model/parse', :body => {"text": @message}.to_json)
  	if resp.dig('intent', 'confidence') > 0.2
  		respond = "Rasa understands you. ^^"
  	else
  		respond = "What do you mean?"
  	end
  	@room_message = RoomMessage.create user: User.find(2),
                                       room: @room,
                                       message: respond
		RoomChannel.broadcast_to @room, @room_message                                       
  end
end