require "delegate_presenter/version"
require 'delegate_presenter/application_controller'
require 'delegate_presenter/present'

module DelegatePresenter
  class Base < SimpleDelegator

    def initialize( object_to_delegate_to )
      super(object_to_delegate_to)
    end


    def record_id
      self.__getobj__.id
    end


    def helpers
      ApplicationController.all_helpers
    end

    def s(*args)
      output = "".html_safe
      args.each {|current_arg|
        output << current_arg.html_safe
      }
      output
    end

    def h(str)
      helpers.send(:h, str)
    end

  end
end
