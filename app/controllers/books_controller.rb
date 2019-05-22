class BooksController < ApplicationController
	before_action :authenticate_user!
	def index
		@book = Book.new
		@user = current_user
		@books = Book.all.order(created_at: :desc)
	end

	def show
		@booker = Book.find(params[:id])
		@user = current_user
		@book = Book.new
	end

	def edit
		@book = Book.find(params[:id])
		if current_user.id != @book.user.id
			redirect_to books_path
		end
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			flash[:notice] = "You have creatad book successfully."
		    redirect_to book_path(@book)
		else
            @user = current_user
            @books = Book.all.order(created_at: :desc)
			render :index
		end
	end

	def update
		@book = Book.find(params[:id])
		@book.user_id = current_user.id
		if @book.update(book_params)
			flash[:notice] = "You have creatad book successfully."
		    redirect_to book_path
		else
			render :edit
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
    end

    private
    def book_params
    	params.require(:book).permit(:title,:body)
    end
end
