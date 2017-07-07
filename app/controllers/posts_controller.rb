class PostsController < ApplicationController
  
  def index
     @posts = Post.order('created_at desc').paginate(page: params[:page], per_page: 10)
     @post = Post.new
  end
  
  def create
    @post = current_user.post.create(post_params)

      if @post.save
        flash[:success] = "Post created!"
        redirect_to :back
      end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content, :user_id)
    end
end
