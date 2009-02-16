# set user that can write to /u/apps and has sudo privs.
set :user, "rails"

# set your github clone url
set :shadow_repository, "git://github.com/goodchildmusic/shadow_rails.git"

namespace :deploy do
  desc <<-DESC
  Bootstrap the system with Git, Ruby, Gems, ShadowPuppet, and ShadowFacter. Setup cap directories.
  DESC
  task :bootstrap do
    sudo "apt-get install -q -y git-core"
    run "git clone #{shadow_repository}"
    sudo '~/shadow_rails/bin/bootstrap'
  end

  desc <<-DESC
  Pull latest manifest and apply.
  DESC
  task :apply_manifest do
   	run "cd shadow_rails;git pull"
    sudo 'shadow_puppet shadow_rails/application_manifest.rb'
  end

  before :deploy do
    apply_manifest
  end

  before 'deploy:migrations' do
    apply_manifest
  end

  desc <<-DESC
  Restart the Passenger processes on the app server by touching tmp/restart.txt.
  DESC
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
end
