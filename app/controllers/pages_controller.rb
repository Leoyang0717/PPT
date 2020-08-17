class PagesController < ApplicationController
  def index
  end

  def about
  end

  def pricing
  end

  def payment
    @plan = params[:plan]
    @price = case @plan
    when "a"
      5
    when "b"
      20
    else
      "參數錯誤"
    end
  end
end
