module ApplicationHelper

  def photo_path photo
    if photo
      cl_image_path photo.path, height: 300, width: 400, crop: :thumb, :effect=>"blur:100"
    else
      cl_image_path("http://res.cloudinary.com/dbiuujogd/image/upload/v1478883903/cocktails_tlhl0g.png", height: 150, width: 200, crop: :fit, :effect=>"blur:100")
    end
  end

  def bootstrap_class_for(type)
    case type
    when :alert then "alert-error"
    when :notice then "alert-success"
    end
  end

  def yield_with_default(holder, default)
    if content_for?(holder)
      content_for(holder).squish
    else
      default
    end
  end
end

