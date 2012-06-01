class ProblemsController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!

  def version
    v = Version.find(params[:version])
    @problem = v.reify
    authorize! :manage, @problem
    flash.now[:notice] = "This is a historical element created at: #{v.created_at}"
    render :show
  end

  def resolve
    p = Problem.find params[:id]
    authorize! :manage, p
    p.resolve
    redirect_to problems_path
  end

  def index
    @existing = @problems.existing
    @resolved = @problems.resolved
  end

  # GET /problems/1
  # GET /problems/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @problem }
    end
  end

  # GET /problems/new
  # GET /problems/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @problem }
    end
  end

  def edit
  end

  # POST /problems
  # POST /problems.json
  def create
    respond_to do |format|
      if @problem.save
        format.html { redirect_to @problem, notice: 'Problem was successfully created.' }
        format.json { render json: @problem, status: :created, location: @problem }
      else
        format.html { render action: "new" }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /problems/1
  # PUT /problems/1.json
  def update
    respond_to do |format|
      if @problem.update_attributes(params[:problem])
        format.html { redirect_to @problem, notice: 'Problem was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /problems/1
  # DELETE /problems/1.json
  def destroy
    @problem.destroy

    respond_to do |format|
      format.html { redirect_to problems_url }
      format.json { head :ok }
    end
  end
end
