class BooksController < ApplicationController
  def new
  end
  def create
    @book = Book.new(book_params)
    if @book.save
    	redirect_to @book
    else
    	render 'new'
    end
#	render json: params[:book].inspect
  end
    def show
    	@book = Book.find(params[:id])
    end

	def index
		@books = Book.all
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			redirect_to books_path
		else
			render 'edit'
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy

		redirect_to books_path
	end
    private
	def book_params
		params.require(:book).permit(:title, :isbn, :author, :description)
	end
end
