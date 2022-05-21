class ApplicationController < ActionController::Base
    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :forbidden
    # rescue_from SQLite3::ConstraintException, with: :verboten

    private
    
    def forbidden
        flash[:alert] = "You are not authorized to perform that action"
        redirect_to root_path
    end

    # def verboten
    #     flash[:alert] = "You cannot Destroy this Object: It's tied to a sesson."
    #     redirect_to root_path
    # end
end
