# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'factory_girl_rails'
require 'faker'
I18n.reload!

FG = FactoryGirl

user = FG.create :user, admin: true, email: Rails.application.secrets.admin_email, password: Rails.application.secrets.admin_password, password_confirmation: Rails.application.secrets.admin_password
user.confirm
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
