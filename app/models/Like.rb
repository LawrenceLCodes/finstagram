class Like < ActiveRecord::Base
    # one to one relationship between the class and the table: user
    # a finstagram post belongs to one user, the author or creater of the post
    # each like belongs to only one user
    belongs_to :user
    # each like belongs to only one finstagram post
    belongs_to :finstagram_post
end