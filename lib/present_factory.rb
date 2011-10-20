def Present(object)
  presenter_class = Object.const_get("#{object.class.name}Presenter")
  presenter_class.new(object)
end
