class AnswerSessionController < ApplicationController
  def new
    @card_user = User.find(params[:user]) #owner of card
    redirect_to root_path if !@card_user
    @hash_card = @card_user.hashcards.find_by_name(params[:hash_card]) #hash card that is pass to the url
    redirect_to root_path if !@hash_card
    
    @hash_card.tasks.each do |t|
       if current_user.nil? || !Answer.where(:task_id=>t.id,:user_id=>current_user.id).empty?
          t.answers.each do |a|
            a.value = nil
          end
       else
          t.answers.create :column_name => "default", :user_id => current_user.id
       end
    end
    
  end
  
end
