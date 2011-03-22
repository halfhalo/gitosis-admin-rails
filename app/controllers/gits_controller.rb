class GitsController < ApplicationController
  # GET /gits
  # GET /gits.xml
  def index
    @gits = Git.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gits }
    end
  end

  # GET /gits/1
  # GET /gits/1.xml
  def show
    @git = Git.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @git }
    end
  end

  # GET /gits/new
  # GET /gits/new.xml
  def new
    @git = Git.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @git }
    end
  end

  # GET /gits/1/edit
  def edit
    @git = Git.find(params[:id])
  end

  # POST /gits
  # POST /gits.xml
  def create
    @git = Git.new(params[:git])

    respond_to do |format|
      if @git.save
        format.html { redirect_to(@git, :notice => 'Git was successfully created.') }
        format.xml  { render :xml => @git, :status => :created, :location => @git }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @git.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gits/1
  # PUT /gits/1.xml
  def update
    @git = Git.find(params[:id])

    respond_to do |format|
      if @git.update_attributes(params[:git])
        format.html { redirect_to(@git, :notice => 'Git was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @git.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gits/1
  # DELETE /gits/1.xml
  def destroy
    @git = Git.find(params[:id])
    @git.destroy

    respond_to do |format|
      format.html { redirect_to(gits_url) }
      format.xml  { head :ok }
    end
  end
end
