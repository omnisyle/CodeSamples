# Before destroying a record in database, always check if the user is authorize to destroy that record
# A simple way to do this is to check whether the user is the owner of the record
# For example: 
#   When user create a new 'module', there's always user_id on the module record
#   We need to check if the current_user.module.find_by(id: params[:id]) returns any record at all
#   If yes, then the current_user is the owner of the record and should be able to destroy the record

# Let's make this method reusable accross many controller by defining it in application controller

class ApplicationController < ActionController::Base
  
  protected
    def correct_user(resource)
      @resource = current_user.send(resource).find_by(id: params[:id])
      redirect_to :back if @resource.nil?
      @resource
    end

end

# In each controller that needs to verify the owner of the record, we include this hook 

before_action  only: [:destroy] do
  correct_user :modules # or any model name 
end

# It will call current_user.modules.find_by(id: params[:id])

# Why use .find_by and not .find ? 
# Because 'find_by' returns nil if no records found, while 'find' raises exception