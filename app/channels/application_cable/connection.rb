module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
    

    def connect
      # puts current time in logs
      puts "Authenticating connection at #{Time.now.iso8601(3)}"

      current_user = find_verified_user
      logger.add_tags 'ActionCable', current_user.email
    end

    private

    def find_verified_user
      if verified_user = env['warden'].user
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
