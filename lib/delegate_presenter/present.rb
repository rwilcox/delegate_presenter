def Present(object, opts = {})
  klass = opts[:with] || "#{object.class.name}Presenter"
  presenter_class = Object.const_get(klass)
  presenter_class.new(object)
end
