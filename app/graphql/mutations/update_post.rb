module Mutations
  class UpdatePost < GraphQL::Schema::Mutation
    null false

    argument :id, ID, required: true
    argument :title, String, required: false
    argument :rating, Int, required: false

    field :post, Types::PostType, null: false
    field :errors, [String], null: false

    def resolve(id:, title: nil, rating: nil)
      post = Post.find(id)
      post.title = title if title
      post.rating = rating if rating

      if post.save
        { post: post, errors: [] }
      else
        { post: post, errors: post.errors.full_messages }
      end
    end
  end
end
