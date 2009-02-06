module ApacheRecipes

  def apache
    package "apache2-mpm-worker", :ensure => :installed 
    package "apache2-threaded-dev", :ensure => :installed
    service :apache2, :require => package("apache2-mpm-worker")
  end

end