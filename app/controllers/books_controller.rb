class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
  end

  def new
  end

   def create
    book = Book.new(book_params)
    book.save
    redirect_to books_path
    
    @book = @group.book.new(book_params)
    if @book.save
        redirect_to group_books_path(@group), notice: 'メッセージが送信されました'
    else
        flash.now[:alert] = 'メッセージを入力してください'
        render :index
        
        
        
    end
   end

   def edit
    
   end
  
   def update
    book = Blog.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
   end

   def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
   end


   private
  def book_params
    params.require(:book).permit(:title, :category, :body)
  end
end