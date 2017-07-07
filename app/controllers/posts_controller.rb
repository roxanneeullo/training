class PostsController < ApplicationController
  
  def index
     @posts = Post.includes(user:[:department]).order('created_at desc').paginate(page: params[:page], per_page: 10)
     @post = Post.new
  end
  
  def create
    @post = current_user.post.create(post_params)

      if @post.save
        redirect_to :back
        flash[:success] = "Post created!"
      else
        
        redirect_to :back
        flash[:fail] = "Post cannot be blank!"
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