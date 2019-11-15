class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    render "pages/home", :layout => false
  end
end
