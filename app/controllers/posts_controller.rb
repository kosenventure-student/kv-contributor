class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /posts
  # GET /posts.json
  def index
	if params[:sort].nil?
		@orders = 'id'
	else
		@orders = params[:sort].to_s
	end

	if @orders == session[:sort]
		@direction = session[:direction] == 'ASC'? 'DESC':'ASC'
	else
		@direction = 'ASC'
	end
    # セッション保存
    session[:sort] = @orders
    session[:direction] = @direction
	@posts = Post.order(@orders.to_s + ' ' + @direction.to_s)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
	@comment = Post.find(set_post).comments.build
	if params[:num].nil?
		@num = "0"
	else
		@num = params[:num]
	end

	if params[:dir].nil?
		@dir = "none"
	else
		@dir = params[:dir]
	end
    # セッション保存
    session[:num] = @num
    session[:dir] = @dir
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit

  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :user_id_id, :content)
    end
end
