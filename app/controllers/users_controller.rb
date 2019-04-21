class UsersController < ApplicationController
#マイページ
  def show
  	@user = User.find(params[:id])
    #@booksにその@userに紐づいたbooksのみを渡す(pageはkaminariメソッド)
  	@books = @user.books.page(params[:page]).reverse_order
  end

  def edit
  	@user = User.find(params[:id])
  end

  def index
  	@users = User.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end



  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end