class KeypathsController < ApplicationController
  # GET /keypaths
  # GET /keypaths.json
  def index
    @keypaths = Keypath.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @keypaths }
    end
  end

  # GET /keypaths/1
  # GET /keypaths/1.json
  def show
    @keypath = Keypath.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @keypath }
    end
  end

  # GET /keypaths/new
  # GET /keypaths/new.json
  def new
    @keypath = Keypath.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @keypath }
    end
  end

  # GET /keypaths/1/edit
  def edit
    @keypath = Keypath.find(params[:id])
  end

  # POST /keypaths
  # POST /keypaths.json
  def create
    @keypath = Keypath.new(params[:keypath])

    respond_to do |format|
      if @keypath.save
        format.html { redirect_to @keypath, :notice => 'Keypath was successfully created.' }
        format.json { render :json => @keypath, :status => :created, :location => @keypath }
      else
        format.html { render :action => "new" }
        format.json { render :json => @keypath.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /keypaths/1
  # PUT /keypaths/1.json
  def update
    @keypath = Keypath.find(params[:id])

    respond_to do |format|
      if @keypath.update_attributes(params[:keypath])
        format.html { redirect_to @keypath, :notice => 'Keypath was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @keypath.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /keypaths/1
  # DELETE /keypaths/1.json
  def destroy
    @keypath = Keypath.find(params[:id])
    @keypath.destroy

    respond_to do |format|
      format.html { redirect_to keypaths_url }
      format.json { head :no_content }
    end
  end
end
