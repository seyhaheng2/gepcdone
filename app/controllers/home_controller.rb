class HomeController < ApplicationController
  def index

  	search = params[:query]
    if search.present?
      @posts = Post.order("created_at DESC")
        .text_search(search)
        .paginate(:page => params[:page], :per_page => 7)
    else
      if params[:tag]
        @posts = Post.tagged_with(params[:tag])	
          .order("created_at DESC")
          .paginate(:page => params[:page], :per_page => 7)
      else
        type_id = params[:type_id]
        if type_id
          @posts = Post.in_type(type_id)
            .order("created_at DESC")
            .paginate(:page => params[:page], :per_page => 3)
        else
          @posts = Post.order("created_at DESC")
            .paginate(:page => params[:page], :per_page => 3)
        end
      end
    end

  end

  def service
  end

  def about
  end

  def contact
  end

end




