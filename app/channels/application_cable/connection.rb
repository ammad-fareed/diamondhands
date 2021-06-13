module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      # self.current_user = find_verified_user
    end

    def disconnect
    end

    private

    def find_verified_user
      user = User.find_by(email: request.params[:email])
      return user if user.present?

      reject_unauthorized_connection
    end

  end
end
