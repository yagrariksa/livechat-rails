class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @article = @comment.article
    if @comment.destroy
      flash[:success] = 'Comment was successfully deleted.'
      redirect_to article_path(@article)
    else
      flash[:error] = 'Something went wrong'
      redirect_to article_path(@article)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
