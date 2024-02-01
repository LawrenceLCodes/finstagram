class FinstagramPost < ActiveRecord::Base
    # one to one relationship between the class and the table: user
    # a finstagram post belongs to one user, the author or creater of the post
    # Tells ActiveRecord to add a user_id field to a FinstagramPost record.
    # Allows ActiveRecord to associate a User with a FinstagramPost record.
    belongs_to :user
    # Each finstagram post can have many comments from many users
    has_many :comments
    # Each finstagram post can have many likes which will be coming from many users
    has_many :likes

    # Validates if a user record is present
    # If no user is present then a post cannot be created
    validates_presence_of :user

    # Time elapsed on finstagram posts function
    def humanized_time_elapsed
        time_elapsed_in_seconds = Time.now - self.created_at
        time_elapsed_in_minutes = time_elapsed_in_seconds / 60

        if time_elapsed_in_minutes >= 60
          "#{(time_elapsed_in_minutes / 60).to_i} hours ago"
        else 
          "#{time_elapsed_in_minutes.to_i} minutes ago"
        end
    end

    # Like Count function
    def like_count
        self.likes.size
    end

    # Comment count function
    def comment_count
        self.comments.size
    end
end