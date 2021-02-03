class HomeController < ApplicationController


  def top
	if logged_in?
	   @post  = current_user.posts.build
	end
  end

  def about
  end
end
