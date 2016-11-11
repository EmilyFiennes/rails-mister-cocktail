module ApplicationHelper

  def photo_path photo
    if photo
      cl_image_path photo.path, height: 300, width: 400, crop: :fit, :effect=>"blur:100"
    else
      "http://www.magnificentbastard.com/images/pics/empty-cocktail-glass.jpg"
    end
  end
end


