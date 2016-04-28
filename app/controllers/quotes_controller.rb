class QuotesController < ApplicationController
	before_action :find_quote, only: [:show, :edit, :update, :destroy]
	respond_to :json, :html

  def index
  	@quotes = Quote.all.order("created_at DESC")

  	respond_to do |format|
  format.html # show.html.erb
  format.xml  { render :xml => @quotes }
  format.json { render :json => @quotes }
end
  end

  def show
  	respond_to do |format|
  format.html # show.html.erb
  format.xml  { render :xml => @quote }
  format.json { render :json => @quote }
end
  end

  def new
  	@quote = Quote.new
  end

  def create
  	@quote = Quote.new(quote_params)

  	if @quote.save
  		redirect_to @quote
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	if @quote.update(quote_params)
  		redirect_to @quote
  	else
  		render 'new'
  	end
  end

  def destroy
  	@quote.destroy
  	redirect_to root_path
  end


  private

  def quote_params
  	params.require(:quote).permit(:author, :quote, :category_id)
  end

  def find_quote
  	@quote = Quote.find(params[:id])
  end

end
