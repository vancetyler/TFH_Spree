set :application, "TFH Webstore"
set :repository,  "git@github.com:vancetyler/TFH_Spree.git"
set :scm, "git"
set :user, "spree"
set :scm_passphrase, "tRMCMvl6uvop"
set :branch, "master"
set :deploy_via, :checkout
set :git_shallow_clone, 1
set :use_sudo, false
set :deploy_to, "/home//apps/store"
# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "http://tfh.spreeworks.com/"
role :web, "http://tfh.spreeworks.com/"
role :db,  "http://tfh.spreeworks.com/", :primary => true