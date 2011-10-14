class AnswersController < ApplicationController
  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @answers }
    end
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
    @answer = Answer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @answer }
    end
  end

  # GET /answers/new
  # GET /answers/new.json
  def new
    @answer = Answer.new
    @answer.user = current_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @answer }
    end
  end

  # GET /answers/1/edit
  def edit
    @answer = Answer.find(params[:id])
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.find_by_column_name(params[:answer][:name])
    if @answer
      update
    else
      @answer = Answer.new(params[:answer])
    end
    @answer.user = current_user
    @answer.save
    
    redirect_to answer_session_path(@answer.task.hashcard.user.id, @answer.task.hashcard.name), notice: 'Answer was successfully created.'
    
  end

  # PUT /answers/1
  # PUT /answers/1.json
  def update
    @answer = Answer.find(params[:id])
    
    if @answer.update_attributes(params[:answer])
      redirect_to answer_session_path(@answer.task.hashcard.user.id, @answer.task.hashcard.name), notice: 'Answer was successfully updated.'
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to answers_url }
      format.json { head :ok }
    end
  end
end
