class UsersController < ApplicationController
  before_action :set_user, only: [:followings, :followers, :show, :create]
  
  def index
    @q = User.search(params[:q])
    @users = @q.result(distinct: true)
    @user = current_user
  end
  
  def show
    @records = @user.records.order(date: :desc).limit(5)
    @users = @user.following_users
    @message = "フォローしているユーザーがいません"
    @sum_participation_time = @records.sum(:participation_time)
    @sum_goal = @records.sum(:goal)
    @sum_assist = @records.sum(:assist)
    @sum_redcard = @records.sum(:redcard)
    @sum_yellowcard = @records.sum(:yellowcard)
  end
    
  def new
    @user = User.new
  end

  def create
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def followings
    @title = "フォローリスト"
    @users = @user.following_users
    @message = "フォローしていません"
  end
  
  def followers
    @title = "フォロワーリスト"
    @users = @user.follower_users
    @message = "フォローされていません"
  end
  
  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :playername, :age, :area, :position, :team)
  end
  
  def set_user
    @user = User.find(params[:id])
  end

end