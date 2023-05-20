# class Comment < ApplicationRecord
#   # A comment belongs to an author
#   # A comment belongs to a post

#   belongs_to :author, class_name: 'User', foreign_key: :author_id
#   belongs_to :posts

#   after_save :update_comments_counter

#   private

#   def update_comments_counter
#     posts.increment!(:comments_counter)
#   end
# end


class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post

  after_save :update_comments_counter

  private

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
