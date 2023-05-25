module ApplicationHelper
  def active?(action)
    params[:action] == action ? 'nav-link active' : 'nav-link'
  end
end
