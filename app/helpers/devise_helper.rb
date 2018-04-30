module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:h1, msg) }.join
    html = <<-HTML
    <aside class="error"
      id="message--error"
      role="alert">
      #{messages}
    </aside>
    HTML

    html.html_safe
  end
end