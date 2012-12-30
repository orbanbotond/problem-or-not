class CommentsController < ApplicationController
  respond_to :html, :xml, :json, :js

  load_and_authorize_resource :problem
  load_and_authorize_resource :through => :problem

  # POST /comments
  # POST /comments.json
  def create
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.problem }
        format.js
        # format.js { render action: "create" }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end
end
