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

How do I get a presenter for this object I have?
=================================

Call `Present(object)`

This will look up the name of `object`'s class, then look for a class named (that name) presenter.

So, if object is a Todo instance, DelegatePresenter will look for `TodoPresenter`. It will then instantiate an object of that class (`TodoPresenter`), passing the parameter from the Present call into the constructor.

As `DelegatePresenter::Base` subclasses are just `SimpleDelegator`s at heart, this means methods that `TodoPresenter` does not know about will be passed on to (delegated to) the `Todo` instance.

So, what is DelegatePresenter, really?
================================

DelegatePresenter does two things:

  1. Inherits from Ruby Standard Library's SimpleDelegator. This simple class solves many of the problems I've seen with decorators in the past. (calling object.method everywhere)

  2. Makes Rails helpers available to you via the helpers method, gives you s (above) and h (your old Rails 2 friend)

  3. Gives you a `record_id` method, which will return the ActiveRecord ID of the database object. Because I think it should have been this way in the first place :)


Installation
================================

  1. Add me to your Gemfile
  2. In your `config/application.rb`, add an autoload path for `app/presenters/`
  3. Create presenters for your classes. For example: `app/presenters/todo_presenter.rb`. These classes should subclass `DelegatePresenter::Base`


Credit where Credit Is Due
=================================

Most of this gem was inspired by (and the initial structure stolen from), [Avdi Grimm](avdi.org)'s blog posts on [Demeter](http://avdi.org/devblog/2011/07/05/demeter-its-not-just-a-good-idea-its-the-law/) and [Nil objects and Falsiness](http://avdi.org/devblog/2011/05/30/null-objects-and-falsiness/). While these articles talk about other things, they give part of a very simple Presenter strategy.

The simplest presenter strategy that could possibly work.

I've used this pattern on several projects, and it works **very well**. Starting yet another project where I wanted to use Presenters, I thought I'd wrap it up into a gem... plus some tricks I've learned along the way.

But what about....
==============================

I know there are a few other presenter frameworks out there for Rails. One hasn't seen any activity since 2008, and one is [Draper](https://rubygems.org/gems/draper).

I'm not a big fan of Draper's API, and it seemed too heavy to me. If Draper's your style, that's great: different strokes for different folks.
