class Types::MutationType < Types::BaseObject
  field :createPost, mutation: Mutations::CreatePost
  field :updatePost, mutation: Mutations::UpdatePost
  field :deletePost, mutation: Mutations::DeletePost
end
