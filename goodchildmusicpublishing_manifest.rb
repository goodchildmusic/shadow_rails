require File.dirname(__FILE__) + '/lib/rails_manifest.rb'

# This class is for a *single* application. This could be easily implemented to load json/yaml.
class GoodchildmusicpublishingManifest < RailsManifest

  # name your app
  name "goodchildmusicpublishing"
  domain "goodchildmusicpublishing.com"
  database_password "secret"

  # add your gems and other good stuff here
  def application_packages
    # package "some_awesome_gem", :ensure => :installed, :provider => :gem
    # package "some_awesome_native_package", :ensure => :installed
  end
end