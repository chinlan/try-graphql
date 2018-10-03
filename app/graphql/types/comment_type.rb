module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :body, String, null: true
    field :post, [Types::PostType], null: true
  end
end
