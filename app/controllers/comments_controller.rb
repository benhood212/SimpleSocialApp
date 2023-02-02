class CommentsController < ApplicationController
    before_action :set_post
    before_action :set_comment, only: [:edit, :update, :destroy]
    before_action :authorize_comment, only: [:edit, :update, :destroy]
  
    def create
      @comment = @post.comments.build(comment_params)
      @comment.user = current_user
  
      if @comment.save
        redirect_to @post, notice: 'Comment was successfully created.'
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @comment.update(comment_params)
        redirect_to @post, notice: 'Comment was successfully updated.'
      else
         render :edit
      end
    end

    def destroy
      @comment.destroy
      redirect_to @post, notice: 'Comment was successfully destroyed.'
    end    


  
    private
  
      def set_post
        @post = Post.find(params[:post_id])
      end

      def set_comment
        @comment = @post.comments.find(params[:id])
      end
  
      def authorize_comment
        unless @comment.user == current_user
          redirect_to @post, notice: 'You are not authorized to perform this action.'
        end
      end
  
      def comment_params
        params.require(:comment).permit(:content)
      end
  end
  