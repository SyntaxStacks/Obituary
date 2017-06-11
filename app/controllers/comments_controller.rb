class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @obituary = Obituary.find(params[:comment][:obituary_id])
    @comment = @obituary.comments.create(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @obituary, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @obituary }
      else
        format.html { redirect_to @obituary, alert: 'Unable to create comment' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @obituary = Obituary.find(@comment.obituary_id)

    @comment_creator = User.find(@comment.user_id)
    @obituary_creator = User.find(@obituary.user_id)

    unless @obituary_creator.id == current_user.id || @comment_creator.id == current_user.id
      redirect_to :root
    end

    @comment.destroy
    respond_to do |format|
      format.html { redirect_to obituaries_url, notice: 'Comment was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:title, :comment, :obituary_id)
    end
end
