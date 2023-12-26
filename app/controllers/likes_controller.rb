class LikesController < ApplicationController
  def index
    render json: {
      status: 200,
      active_likes: user.active_likes,  # 自分からのいいね
      passive_likes: user.passive_likes # 相手からのいいね
    }
  end

  def create
    @user = User.find(params[:to_user_id])
    current_user.do_like(@user)
    flash[:success] = "いいね！しました！"
    redirect_to @user
  end

  def destroy
    @user = Like.find(params[:id]).to_user
    current_user.delete_like(@user)
    redirect_to @user, status: :see_other
  end

  private

    def like_params
      params.permit(:from_user_id, :to_user_id)
    end
end
