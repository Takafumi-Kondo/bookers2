class UsersController < ApplicationController
#マイページ
  def show
  	@user = User.find(params[:id])
    #@booksにその@userに紐づいたbooksのみを渡す(pageはkaminariメソッド)
  	@books = @user.books.page(params[:page]).reverse_order
    @book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def index
  	@users = User.all
    # @user = @users.find(params[:id])
    @book = Book.new
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end



  protected
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
