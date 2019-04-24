class BooksController < ApplicationController
  def new
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	if @book.save
      flash[:success] = 'Book was successfully created.'
      redirect_to book_path(@book.id)
    else
#renderでindex飛んでもここの変数を使うので@books持ってくる
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user#ユーザ詳細ページ
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find_by(id: @book.user)
#findはidのみなので
  end

  def edit
    @book = Book.find(params[:id])
#ログインユーザではないならURLからも編集不可
    if @book.user_id != current_user.id
      redirect_to book_path(@book.id)
    end
  end


  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:success] = 'Book was successfully updated.'
      redirect_to book_path(book.id)
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end


  private

  def book_params
  	params.require(:book).permit(:user_id, :title, :body)
  end
end