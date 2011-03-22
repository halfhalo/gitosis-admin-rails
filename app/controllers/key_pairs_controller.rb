class KeyPairsController < ApplicationController
  # GET /key_pairs
  # GET /key_pairs.xml
  def index
    @key_pairs = KeyPair.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @key_pairs }
    end
  end

  # GET /key_pairs/1
  # GET /key_pairs/1.xml
  def show
    @key_pair = KeyPair.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @key_pair }
    end
  end

  # GET /key_pairs/new
  # GET /key_pairs/new.xml
  def new
    @key_pair = KeyPair.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @key_pair }
    end
  end

  # GET /key_pairs/1/edit
  def edit
    @key_pair = KeyPair.find(params[:id])
  end

  # POST /key_pairs
  # POST /key_pairs.xml
  def create
    @key_pair = KeyPair.new(params[:key_pair])

    respond_to do |format|
      if @key_pair.save
        format.html { redirect_to(@key_pair, :notice => 'Key pair was successfully created.') }
        format.xml  { render :xml => @key_pair, :status => :created, :location => @key_pair }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @key_pair.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /key_pairs/1
  # PUT /key_pairs/1.xml
  def update
    @key_pair = KeyPair.find(params[:id])

    respond_to do |format|
      if @key_pair.update_attributes(params[:key_pair])
        format.html { redirect_to(@key_pair, :notice => 'Key pair was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @key_pair.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /key_pairs/1
  # DELETE /key_pairs/1.xml
  def destroy
    @key_pair = KeyPair.find(params[:id])
    @key_pair.destroy

    respond_to do |format|
      format.html { redirect_to(key_pairs_url) }
      format.xml  { head :ok }
    end
  end
end
