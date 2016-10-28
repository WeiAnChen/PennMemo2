class Admin::AdminController < ApplicationController
  before_filter :authorize
  layout "admin"

  def index
  end

  def send_mail
  	count = Category.count
    if count % 2 == 0
      @categories_first = Category.first(count/2)
      @categories_second = Category.last(count/2)
    else
      @categories_first = Category.first(count/2 + 1)
      @categories_second = Category.last(count/2)
    end
  end

  def statistics
  end

  def panel
  end

end
