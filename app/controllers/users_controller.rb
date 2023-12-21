class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :active_likes, :passive_likes]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    # 性別の異なるユーザーを取得（自分以外）
    @users = User.where.not(gender: current_user.gender).order("created_at DESC")
    #.where.not(id: current_user.id)自分以外  .paginate(page: params[:page])ページネーション
    #render json: { status: 200, users: users }
  end

  def avatar
    if @user && @user.avatar.present?
     image_tag @user.avatar.url
    else
      image_tag "8d27ad3552fd86901f4976429ad22ce2.png"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      reset_session
      log_in @user
      flash[:success] = "登録完了！"
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "登録完了"
      redirect_to @user
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url, status: :see_other
  end

  def active_likes
    @title = "sent_like"
    @user  = User.find(params[:id])
    @users = @user.active_likes.paginate(page: params[:page])
    render 'show_do_like'
  end

  def passive_likes
    @title = "receive_like"
    @user  = User.find(params[:id])
    @users = @user.passive_likes.paginate(page: params[:page])
    render 'show_do_like'
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :avatar, :profile, :gender, :age,
                                   :birthday, :live, :password, :password_confirmation)
    end

    # beforeフィルタ

    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください"
        redirect_to login_url, status: :see_other
      end
    end

    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url, status: :see_other) unless current_user?(@user)
    end

    # 管理者かどうか確認
    def admin_user
      redirect_to(root_url, status: :see_other) unless current_user.admin?
    end
end
