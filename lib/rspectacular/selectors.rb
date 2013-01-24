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
  string   = args.shift
  selector = RSpectacular::Selectors.find { |regex, selector| string.match regex }

  if selector.present?
    if selector.respond_to? :call
      selector.call(*args)
    else
      selector
    end
  end
end

require File.expand_path('../selectors/defaults', __FILE__)
