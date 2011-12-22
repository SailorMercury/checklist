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
    
    redirect_to answer_session_path(@answer.task.hashcard.permalink), notice: 'Answer was successfully created.'
    
  end

  # PUT /answers/1
  # PUT /answers/1.json
  def update
    initial = Answer.find(params[:id])
    @answer = initial.task.hashcard
    @answer.tasks.each do |t|
      t.answers.find_by_column_name(initial.column_name).update_attributes(:column_name => params[:answer][:column_name])
    end
    redirect_to answer_session_path(initial.task.hashcard.permalink), notice: 'Answer was successfully updated.'
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
