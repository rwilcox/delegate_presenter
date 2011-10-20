#-*- tab-width: 2; indent-tabs-mode: nil; x-auto-expand-tabs: true; x-counterpart: ../../app/presenters/application_presenter.rb; x-typographers-quotes: false; -*-

require 'spec_helper'

describe "DelegatePresenter::Base" do

  describe "HTML building helpers" do

    before do
      @ap = DelegatePresenter::Base.new(1)
    end

    it "handles HTML elements that should not be escaped" do
    	@ap.s("<h1>Hi</h1>") == "<h1>Hi</h1>"
    end

    it "handles an h in the middle to indicate that a particular string actually should be escaped" do
    	@ap.s("<blink>hello</blink>", " world ", @ap.h("<BAD TAG>")).should == "<blink>hello</blink> world &lt;BAD TAG&gt;"
    end
  end
end
