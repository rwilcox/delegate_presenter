
# This module adds a method so DelegatePresenter::Base can access your Rails helpers
# You'll need to extend your ApplicationController with this module name
#
# Earlier versions of the gem extended ApplicationController for you, but introduced bugs
# (possibly dealing with load order???) WD-rpw 10-20-2011
module DelegatePresenter::ApplicationController
  # Provide access to helper methods from outside controllers and views,
  # such as in Presenter objects. Rails provides ActionController::Base.helpers,
  # but this does not include any of our application helpers.
  def all_helpers
    @all_helpers_proxy ||= begin
      # Start with just the rails helpers. This is the same method used
      # by ActionController::Base.helpers
      proxy = ActionView::Base.new.extend(_helpers)

      # url_for depends on _routes method being defined
      proxy.instance_eval do
        def _routes
          Rails.application.routes
        end
      end

      # Import all named path methods
      proxy.extend(Rails.application.routes.named_routes.module)

      # Load all our application helpers to extend
      modules_for_helpers([:all]).each do |mod|
        proxy.extend(mod)
      end

      proxy
    end
  end
end

