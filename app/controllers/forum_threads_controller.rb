class ForumThreadsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_forum_thread, except: [:index, :new, :create]

  def index
    @q = ForumThread.search(params[:q])
    @forum_threads = @q.result(distinct: true)
    @forum_threads = ForumThread.paginate(:page => params[:page], :per_page => 2)
  end

  def show
    @forum_post = ForumPost.new
  end

  def new
    @forum_thread = ForumThread.new
    @forum_thread.forum_posts.new
  end

  def create
    @forum_thread = current_user.forum_threads.new forum_thread_params
    @forum_thread.forum_posts.first.user_id = current_user.id
    if @forum_thread.save
      redirect_to @forum_thread
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @forum_thread.update forum_thread_params
      redirect_to @forum_thread
    else
      render 'edit'
    end
  end

  def destroy
    @forum_thread.destroy
    redirect_to root_path
  end
  

  private

    def set_forum_thread
      @forum_thread = ForumThread.friendly.find(params[:id])
    end

    def forum_thread_params
      params.require(:forum_thread).permit(:subject, forum_posts_attributes: [:body])
    end
end
