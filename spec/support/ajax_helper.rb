module AjaxHelper

  def wait_for_css(selector)
    until has_css?(selector); end
    yield(find(selector))
  end

end
