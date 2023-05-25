module ApplicationHelper
  def active?(path)
    current_page?(path) ? 'nav-link active' : 'nav-link'
  end
end
