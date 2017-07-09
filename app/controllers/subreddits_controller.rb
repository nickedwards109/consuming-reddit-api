class SubredditsController < ApplicationController
  def show
    @title = params[:title]
    @subscriber_count = params[:subscriber_count]
    @description = params[:description]
  end
end
