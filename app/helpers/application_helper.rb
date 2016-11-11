module ApplicationHelper

  def photo_path photo
    if photo
      cl_image_path photo.path, height: 300, width: 400, crop: :thumb, :effect=>"blur:100"
    else
      cl_image_path("http://res.cloudinary.com/dbiuujogd/image/upload/v1478883903/cocktails_tlhl0g.png", height: 150, width: 200, crop: :fit, :effect=>"blur:100")
    end
  end
end

