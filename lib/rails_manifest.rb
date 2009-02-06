require 'shadow_puppet'
require File.dirname(__FILE__) + '/recipes.rb'

RAILS_USER = "rails"
RAILS_GROUP = "rails"
RAILS_PREFIX = "/var/rails"
PASSENGER_VERSION = "2.0.6"

class RailsManifest < ShadowPuppet::Manifest
  include MySQLRecipes
  include PassengerRecipes
  include ApacheRecipes
  include RailsRecipes
  include CapistranoRecipes
  
  class << self
    def name(name)
      Configuration.name = name.to_s
    end
    
    def domain(name)
      Configuration.domain = name
    end
    
    def database_password(password)
      Configuration.database_password = password
    end
  end
  
  recipe :mysql_server, :mysql_gem
  recipe :apache_server
  recipe :passenger_gem, :passenger_apache_module
  recipe :rails_gem, :rails_user, :rails_prefix, :rails_root
  recipe :mysql_database
  recipe :application_packages
  recipe :passenger_site, :domain => Configuration.domain
  recipe :mysql_user, :password => Configuration.database_password
  
  # implement this in subclass if you want
  def applications_packages
  end
  
end	