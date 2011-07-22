class PostsController < ApplicationController
  # GET /posts
  # GET /posts.xml

before_filter :authenticate

  def index
    @posts = Post.all

    respond_to do |any_var|
      any_var.html # index.html.erb
      any_var.xml  { render :xml => @posts }
      any_var.json { render :json => @posts } 	
      any_var.atom 	 
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])

    respond_to do |any_var|
      any_var.html # show.html.erb
      any_var.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new

    respond_to do |any_var|
      any_var.html # new.html.erb
      any_var.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])

    respond_to do |any_var|
      if @post.save
        any_var.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        any_var.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        any_var.html { render :action => "new" }
        any_var.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |any_var|
      if @post.update_attributes(params[:post])
        any_var.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        any_var.xml  { head :ok }
      else
        any_var.html { render :action => "edit" }
        any_var.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |temp|
      temp.html { redirect_to(posts_url) }
      temp.xml  { head :ok }
    end
  end

  private
  
  def authenticate
	authenticate_or_request_with_http_basic do |name, password|
	 name == "vishal" && password == "rubyonrails"
  end
end
end
