class User < ApplicationRecord

    # A user has may posts, 
    # A user can like many posts 
    # A user can make many comments 

    has_many :posts, foreign_key: :author_id
    has_many :likes, foreign_key: :author_id
    has_many :comments, foreign_key: :author_id

    def return_top_3
        Post.order(created_at: :desc).limit(3)
    end
end