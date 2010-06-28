require File.expand_path( File.join( File.dirname(__FILE__), "spec_helper.rb" ) )
require File.expand_path( File.join( File.dirname(__FILE__), "common_gem_server_helpers.rb" ) )

shared_examples_for "modern gemserver indexes" do

  it_should_behave_like "common gem server before after"

  MODERN_URLS = [
  "/specs.#{Gem.marshal_version}",
  "/specs.#{Gem.marshal_version}.gz",
  "/latest_specs.#{Gem.marshal_version}",
  "/latest_specs.#{Gem.marshal_version}.gz",
  ]

  MODERN_URLS.each do |url|
    it "serves a modern gemserver index item from #{url}" do
      should_match_webrick_behavior url
    end
  end
end