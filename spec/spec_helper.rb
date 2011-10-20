$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
require 'delegate_presenter'

require 'rubygems'
require 'bundler/setup'

Bundler.require

Dir.glob(['./spec/samples/*.rb', './spec/support/*.rb']) do |file|
  require file
end
