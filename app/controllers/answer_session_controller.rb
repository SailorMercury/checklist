class AnswerSessionController < ApplicationController
  def new
    @hash_card = Hashcard.find_by_permalink(params[:hash_card]) #hash card that is pass to the url
    redirect_to root_path if @hash_card.nil?
    @card_user = @hash_card.user #owner of card
    redirect_to root_path if !@card_user
    
    initial_task = @hash_card.tasks.first
    if initial_task == nil
      @hash_card.tasks.create :name => "default"
      initial_task = @hash_card.tasks.first
    end
    
    @hash_card.tasks.each do |t|
       if current_user.nil? || !Answer.where(:task_id=>t.id,:user_id=>current_user.id).empty?
          t.answers.each do |a|
            a.value = nil
          end
       end
       if initial_task.answers.empty?
        t.answers.create :column_name => "default", :user_id => current_user.id
       elsif t.answers.empty?
         initial_task.answers.each do |a|
           t.answers.create :column_name => a.column_name, :user_id => current_user.id
         end
       elsif t.answers.count < initial_task.answers.count
         t.answers.create :column_name => initial_task.answers.last.column_name, :user_id => current_user.id
       end
    end
    
    @new_answer = Answer.new
    @new_answer.user=current_user if !current_user.nil?
    
  end
end
