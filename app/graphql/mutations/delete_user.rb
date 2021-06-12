module Mutations
    class DeleteUser < Mutations::BaseMutation
      argument :id, Int, required: true
  
      field :user, Types::UserType, null: false
  
      def resolve(id:)
        begin
          user = User.find(id)
          user.destroy
  
          { user: user }
        rescue ActiveRecord::RecordInvalid => e
          GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
            " #{e.record.errors.full_messages.join(', ')}")
        end
      end
    end
end
  