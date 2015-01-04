class Post < ActiveRecord::Base
	mount_uploader :image, ImageUploader
  	belongs_to :inout
  	belongs_to :user
	acts_as_taggable
	include PgSearch
	pg_search_scope :search, against: [:name, :description],
				  using: {tsearch: {dictionary: "english"}}

	  def self.text_search(query)
	  	if query.present?
	  		search(query)
	  	end
	  end
     extend FriendlyId
     friendly_id :name, use: :slugged

     scope :in_type, lambda{ |type_id|
    	where("inout_id = ?", type_id)
  	 }

	  def previous
	    @post = Post.where(["id < ?", id]).order(:id).last
	  end

	  def next
	    @post = Post.where(["id > ?", id]).order(:id).first
	  end


end
