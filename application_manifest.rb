require './lib/rails_manifest.rb'

# This class is for a *single* application.
class ApplicationManifest < RailsManifest
  
  # name your app
  name :birddog
  domain "birddog.railsmachine.com"
  database_password "secret"
  
  # add your gems and other good stuff here
  def application_packages
    # package "some_awesome_gem", :ensure => :installed, :provider => :gem
    # package "some_awesome_native_package", :ensure => :installed
  end
end