class BooksController < ApplicationController
  def new
    
  end

  def index
    @books = Book.all
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      puts @book.errors.full_messages
      @books = Book.all
      render :index
    end
  end
    
  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  def change
    add_column :books, :description, :text
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body, :author, :description)
  end

end