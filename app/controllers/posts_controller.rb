class PostsController < ApplicationController
  
  def index
     @posts = Post.includes(user:[:department]).order('created_at desc').paginate(page: params[:page], per_page: 10)
     @post = Post.new
     @maximum_length = Post.validators_on(:content).first.options[:maximum]
  end
  
  def show
     @post = Post.find(params[:id])
  end
  
  def create
    @post = current_user.posts.create(post_params)

      if @post.save
        redirect_to :back
       # flash[:notice] = "Post created!"
      else
        
        redirect_to :back
        #flash[:notice] = "Post cannot be blank!"
      end
  end
  
  def update
    respond_to do |format|
      if post.update(post_params)
        format.html { redirect_to :posts, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: :post }
      else
        format.html { render :index }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.present?
      @post.destroy
      respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully deleted.' }
      format.json { head :no_content }
    end
  end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content, :user_id, :id)
    end
  
end