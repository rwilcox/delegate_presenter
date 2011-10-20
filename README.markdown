Introduction
=================================

This gem includes a base class, `DelegatePresenter::Base` which all your presenter classes should inherit from.

So, creating a new presenter class:

	class TodoPresenter < DelegatePresenter::Base
	  def todo_name
	    s("<br>", self.description)
	  end
	end

Wait, *what* did you just do?
=================================

You mean that little s hack? That's a way to keep yourself from going sane having to `.html_escape` everything.

[See my blog article on this subject](http://rwilcox.tumblr.com/post/10546160404/presenter-pattern-rails-3-and-html-safe)

So, what is DelegatePresenter, really?
================================

DelegatePresenter does two things:

  1. Inherits from Ruby Standard Library's SimpleDelegator. This simple class solves many of the problems I've seen with decorators in the past. (calling object.method everywhere)

  2. Makes Rails helpers available to you via the helpers method, gives you s (above) and h (your old Rails 2 friend)


Installation
================================

TODO: write me
