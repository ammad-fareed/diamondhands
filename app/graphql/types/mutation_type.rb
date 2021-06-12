module Types
  class MutationType < Types::BaseObject
    field :add_user, mutation: Mutations::AddUser
    field :update_user, mutation: Mutations::UpdateUser
    field :delete_user, mutation: Mutations::DeleteUser
  end
end
