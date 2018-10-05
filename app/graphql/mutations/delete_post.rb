module Mutations
  class DeletePost < GraphQL::Schema::Mutation
    null false

    argument :id, ID, required: true

    field :id, ID, null: false

    def resolve(id:)
      post = Post.find(id)
      post.destroy
      { id: id }
    end
  end
end
