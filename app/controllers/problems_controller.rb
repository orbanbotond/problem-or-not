class ProblemsController < ApplicationController
  load_and_authorize_resource :except => :preview
  before_filter :authenticate_user!

  def preview
    @preview = BlueCloth.new(params[:description]).to_html.html_safe
  end

  def search
    PgSearch.multisearch_options = {:using => { :tsearch => { :dictionary => "hungarian" } }, :ignoring => :accents}
    @result = PgSearch.multisearch(params[:query]).map{ |x| x.searchable }
    @result = @result.reject{|x| @result.include? x.problem rescue false}
  end

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
    request.headers
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /problems/new
  # GET /problems/new.json
  def new
    @problem.description = <<-HERE.strip_heredoc
    Your problem:
    -------------

    Items that **must** have:

    1. house
    3. table
    2. fridge

    Items to be _solved_:

    - It would be good to have a nice Ipad
    - and an Apple TV
    - an a Time capsule

    [Link to Apple](http://www.apple.com/)

    > Knowing others is intelligence; knowing yourself is true wisdom. Mastering others is strength; mastering yourself is true power. If you realize that you have enough, you are truly rich.

         This is a preformatted text1
         This is a preformatted text2
    HERE

    @preview = BlueCloth.new(@problem.description).to_html.html_safe

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @problem }
    end
  end

  def edit
    @preview = BlueCloth.new(@problem.description).to_html.html_safe
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
