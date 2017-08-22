module ApplicationHelper
 
  def login_helper(style_name = '')
    if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path, class: style_name) +
      " ".html_safe +
      (link_to "Login", new_user_session_path, class: style_name)
    else
      link_to "Logout", destroy_user_session_path, method: :delete, class: style_name
    end
  end


 def source_helper(layout_name)
  if session[:source]
    greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout" 
    content_tag(:P, greeting, class: "source_helper")
  end
 end

 def copyright_generator
  DevcampViewTool::Renderer.copyright 'Tarikulislam', 'All rights reserved'
 end

end
