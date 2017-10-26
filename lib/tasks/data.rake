require 'factory_girl_rails'
require 'faker'
I18n.reload!

FG = FactoryGirl

namespace :data do
  desc "Generates fake data for testing"
  task sample: :environment do
    # always clean data before doing
    User.where(admin: false).delete_all
    users = FG.create_list :user, 10
  end

end
