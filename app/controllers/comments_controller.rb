class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to item_path(@comment.item.id), notice: "コメントが投稿されました"
    else
      redirect_to item_path(@comment.item.id), notice: "コメントを入力してください"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to item_path(@comment.item.id), notice: "コメントが削除されました"
    else
      redirect_to item_path(@comment.item.id), notice: "コメント削除に失敗しました"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content,:item_id).merge(user_id: current_user.id)
  end
  
end