class HashcardsController < ApplicationController
  # GET /hashcards
  # GET /hashcards.json
  def index
    @hashcards = Hashcard.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hashcards }
    end
  end

  # GET /hashcards/1
  # GET /hashcards/1.json
  def show
    @hashcard = Hashcard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hashcard }
    end
  end

  # GET /hashcards/new
  # GET /hashcards/new.json
  def new
    @hashcard = Hashcard.new
    @hashcard.user = current_user
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hashcard }
    end
  end

  # GET /hashcards/1/edit
  def edit
    @hashcard = Hashcard.find(params[:id])
    redirect_to root_path if !(@hashcard.user_id == current_user.id)
  end

  # POST /hashcards
  # POST /hashcards.json
  def create
    @hashcard = Hashcard.new(params[:hashcard])
    @hashcard.user = current_user
    respond_to do |format|
      if @hashcard.save
        format.html { redirect_to @hashcard, notice: 'Hashcard was successfully created.' }
        format.json { render json: @hashcard, status: :created, location: @hashcard }
      else
        format.html { render action: "new" }
        format.json { render json: @hashcard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hashcards/1
  # PUT /hashcards/1.json
  def update
    @hashcard = Hashcard.find(params[:id])
    @hashcard.user = current_user
    respond_to do |format|
      if @hashcard.update_attributes(params[:hashcard])
        format.html { redirect_to @hashcard, notice: 'Hashcard was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @hashcard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hashcards/1
  # DELETE /hashcards/1.json
  def destroy
    @hashcard = Hashcard.find(params[:id])
    @hashcard.destroy

    respond_to do |format|
      format.html { redirect_to hashcards_url }
      format.json { head :ok }
    end
  end
end
