class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.is_a?(Host)
      events_path
    elsif resource.is_a?(Participant)
      genres_path  # or any participant dashboard/genre selection
    else
      root_path
    end
  end
end
