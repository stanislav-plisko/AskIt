module Authentication
    extend ActiveSupport::Concern
    
    included do
      private
      def current_user
        @current_user ||= User.find_by(id: session[:user_id])&.decorate if session[:user_id].present?
      end
    
      def user_sing_in?
        current_user.present?
      end
    
      helper_method :current_user, :user_sing_in?
    end
end
