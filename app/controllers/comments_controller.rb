class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.name = current_member.first_name
    if comment.save
      flash[:notice] = "コメントを投稿しました"
      redirect_to comment.tweet
    else
      flash[:comment]= comment
      flash[:notice]= comment.errors.full_messages
      redirect_back fallback_location: comment.tweet
    end
  end
  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete
    redirect_to @comment.tweet,flash: {notice: "コメントが削除されました"}
  end
  private
  def comment_params
    params.require(:comment).permit(:body, :tweet_id, :name)
  end
end
