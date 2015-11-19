class ForumThreads::ForumPostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_forum_thread

  def create
    @forum_post = @forum_thread.forum_posts.new forum_post_params
    @forum_post.user = current_user

    if @forum_post.save
      redirect_to forum_thread_path(@forum_thread, anchor: "forum_post_#{@forum_post.id}"), notice: "Successfully posted!"
    else
      redirect_to @forum_thread, alert: "Unable to save your post"
    end
  end

  def edit
    @forum_thread = ForumThread.friendly.find(params[:forum_thread_id])
    @forum_post = ForumPost.find(params[:id])
    @forum_post = current_user.forum_posts.find(params[:id])
  end

  def update
    @forum_post = ForumPost.find(params[:id])
    if @forum_post.update(forum_post_params)
      redirect_to @forum_thread
    else
      render 'edit'
    end
  end

  def destroy
    @forum_post = ForumPost.find(params[:id])
    @forum_post.destroy
    redirect_to @forum_thread
  end
  
  private

    def set_forum_thread
      @forum_thread = ForumThread.friendly.find(params[:forum_thread_id])
    end

    def forum_post_params
      params.require(:forum_post).permit(:body)
    end
end
