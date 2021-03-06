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

DelegatePresenter does three things:

  1. Inherits from Ruby Standard Library's SimpleDelegator. This simple class solves many of the problems I've seen with presenter APIs in the past. (calling object.method everywhere)

  2. Makes Rails helpers available to you via the `helpers` method, gives you `s` (above) and `h` (your old Rails 2 friend).

  3. Gives you a `record_id` method, which will return the ActiveRecord ID of the database object. Because I think it should have been this way in the first place :)


Installation
================================

  1. Add me to your Gemfile
  2. In your ApplicationController `extend DelegatePresenter::ApplicationController`
  3. In your `config/application.rb`, add an autoload path for `app/presenters/`
  4. Create presenters for your classes. For example: `app/presenters/todo_presenter.rb`. These classes should subclass `DelegatePresenter::Base`


Credit where Credit Is Due
=================================

Most of this gem was inspired by (and the initial structure stolen from), [Avdi Grimm](avdi.org)'s blog posts on [Demeter](http://avdi.org/devblog/2011/07/05/demeter-its-not-just-a-good-idea-its-the-law/) and [Nil objects and Falsiness](http://avdi.org/devblog/2011/05/30/null-objects-and-falsiness/). While these articles talk about other things, they give part of a very simple Presenter strategy.

The simplest presenter strategy that could possibly work.

So I used it on a few projects, and extended the abilities were I had to. It's still *very* simple, doing only one or two things more than that original pattern. I just built on the shoulders of giants.

But what about....
==============================

I know there are a few other presenter frameworks out there for Rails. One hasn't seen any activity since 2008, and one is [Draper](https://rubygems.org/gems/draper).

I'm not a big fan of Draper's API, and it seemed too heavy to me. If Draper's your style, that's great: different strokes for different folks.


License
==============================

LICENSE:

(The MIT License)

Copyright © 2011 Ryan Wilcox

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ‘Software’), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED ‘AS IS’, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
