class SubredditsController < ApplicationController
  def show
    @subreddit_title = params[:title]
    @subscriber_count = params[:subscriber_count]
    @description = params[:description]
    user = current_user
    @posts = Post.set_all_post_attributes(@subreddit_title, user)
  end
end
