require File.expand_path('../selectors/defaults', __FILE__)

def fsf(*args)
  selector        = sf(*args)
  selector_format = selector.starts_with?('.//') ? :xpath : :css

  page.find(selector_format, selector)
end

def idsf(*args)
  id_selector = sf(*args)
  id_selector.starts_with?('#') ? id_selector[1..-1] : id_selector
end

def sf(*args)
  selector_description = args[0]
  selector_entry       = RSpectacular.selectors.find { |regex, selector| selector_description.match regex }

  fail "Cannot find selector for '#{selector_description}'. Please add it to the list of selectors." if selector_entry.nil?

  selector             = selector_entry[1]

    if selector.respond_to? :call
      selector.call(*args)
    else
      selector
    end
end
