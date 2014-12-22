class Advertise < ActiveRecord::Base
	mount_uploader :text, ImageUploader
end
