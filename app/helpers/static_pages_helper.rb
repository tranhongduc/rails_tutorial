# frozen_string_literal: true

# Helper methods for the entire StaticPages.
module StaticPagesHelper
  def full_title(page_title = "")
    base_title = "Ruby on Rails Tutorial Sample App"
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end
end
