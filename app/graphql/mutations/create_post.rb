module Mutations
  class CreatePost < GraphQL::Schema::Mutation
    null true
    # TODO: define return fields
    # field :post, Types::PostType, null: false
    field :post, Types::PostType, null: true
    field :errors, [String], null: false

    # TODO: define arguments
    # argument :name, String, required: true
    argument :title, String, required: true
    argument :rating, Int, required: true
    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end
    def resolve(title:, rating:)
      post = Post.new(title: title, rating: rating)
      if post.save
        {
          post: post,
          errors: [],
        }
      else
        {
          post: nil,
          errors: post.errors.full_messages
        }
      end
    end
  end
end
