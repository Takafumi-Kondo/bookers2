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
    #ログインユーザのみedit
    if @user.id != current_user.id
     redirect_to user_path(@user.id)
    end
  end

  def index
  	@users = User.all
    @user = current_user#ユーザ詳細
    @book = Book.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'You have updated user successfully.'
      redirect_to user_path(@user.id)
    else
      render "/users/edit"
    end
  end



  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
