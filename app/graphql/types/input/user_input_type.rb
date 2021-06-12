module Types
    module Input
      class UserInputType < Types::BaseInputObject
        argument :id, Int, required: false
        argument :email, String, required: true
        argument :artist_name, String, required: true
      end
    end
end
  