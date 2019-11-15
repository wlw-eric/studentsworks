module ApplicationHelper
  def project_image_for(project)
    if project.picture.present?
      cl_image_tag(project.picture, height: 300, crop: :fill)
    else
      image_tag 'defaut-project.jpg', alt: "Mon project", height: 300
    end
  end
  
  def project_imageindex_for(project)
    if project.picture.present?
      cl_image_tag(project.picture, width: 250, height: 200, crop: :fill)
    else
      image_tag 'defaut-project.jpg', alt: "Mon project", width: 250, height: 200
    end
  end
end
