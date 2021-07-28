class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = @prototype.comments.new(prototype_params)
    if @comment.save
      redirect_to prototype_path(@prototype.id)
    else
      @comments = @prototype.comments
      render "prototypes/show"
    end
  end

  private

  def prototype_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
