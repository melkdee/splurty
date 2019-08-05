class QuotesController < ApplicationController
  def index
    @quote = Quote.order("RANDOM()").first
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] = "<strong>Not good enough dude. Quote not saved</strong><br><p style='subtext'>Hint: Make sure your submission is between (2-140 characters)</p>"
    end
    redirect_to root_path
  end

  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end

  # creates a controller action ('go to about')
  def about
  end
end
