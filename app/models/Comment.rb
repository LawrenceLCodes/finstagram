class Comment < ActiveRecord::Base
    # Each comment belongs to a specific user
    belongs_to :user
    # Each comment belongs to a specific finstagram post
    belongs_to :finstagram_post
end