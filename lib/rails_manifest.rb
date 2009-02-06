require 'shadow_puppet'
require File.dirname(__FILE__) + '/recipes.rb'

RAILS_USER = "rails"
RAILS_GROUP = "rails"
RAILS_PREFIX = "/var/rails"
PASSENGER_VERSION = "2.0.6"

class RailsManifest < ShadowPuppet::Manifest
  @name = :application
  include MySQLRecipes
  include PassengerRecipes
  include ApacheRecipes
  include RailsRecipes
  include CapistranoRecipes
  
  recipe :mysql_server, :mysql_gem
  recipe :apache_server
  recipe :passenger_gem, :passenger_apache_module
  recipe :rails_gem, :rails_user, :rails_prefix, :rails_root
  recipe :mysql_database
  recipe :application_packages
  
  def self.name(name)
    Configuration.name = name.to_s
  end
  
  # implement this in subclass
  def applications_packages
  end
  
end	