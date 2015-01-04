class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :checking

  def checking
  	@last_post = Post.last(5)
  	@ads = Advertise.order("created_at DESC")
    @showads = Advertise.order("RANDOM()")
  	@type = Inout.all
  	@most_view = Post.order(viewer: :desc).first(5)
  end

   protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:username, :email, :password, :password_confirmation )}
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation,:current_password)}
        devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email, :password, :remember_me) }
      end

      # def self.random
      #   ids = connection.select_all("SELECT id FROM adtvertises")
      #   find(ids[rand(ids.length)]["id"].to_i) unless ids.blank?
      # end



end
