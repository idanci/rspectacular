module  RSpectacular
module  NamespacedEngineControllerRouteFix
  def get(action, parameters = nil, session = nil, flash = nil)
    process_action(action, parameters, session, flash, "GET")
  end

  def post(action, parameters = nil, session = nil, flash = nil)
    process_action(action, parameters, session, flash, "POST")
  end

  def put(action, parameters = nil, session = nil, flash = nil)
    process_action(action, parameters, session, flash, "PUT")
  end

  def delete(action, parameters = nil, session = nil, flash = nil)
    process_action(action, parameters, session, flash, "DELETE")
  end

  private

  def process_action(action, parameters = nil, session = nil, flash = nil, method = "GET")
    parameters  ||= {}
    engine_name = Dir.pwd.split('/').last.to_sym

    process(action, method, parameters.merge!(:use_route => engine_name), session, flash, )
  end
end
end
