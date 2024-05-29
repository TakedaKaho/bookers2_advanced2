class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    current_user.follow(user) #現在のログインユーザーがそのユーザーをフォローっっていう意味
    redirect_to request.referer #元のページ
  end
  
  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(user)
    redirect_to  request.referer
  end
  
  #特定のユーザーがフォローしているユーザーの一覧を表示するためのアクション
  def followings
    user = User.find(params[:user_id])
    @users = user.followings #そのユーザーがフォローしているユーザー（user.followings）を@usersに代入
  end
  
  #特定のユーザーをフォローしているユーザーの一覧を表示するためのアクション
  def followers
    user = User.find(params[:user_id])
    @users = user.followers #そのユーザーをフォローしているユーザー（user.followers）を@usersに代入
  end
  
end
