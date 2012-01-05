# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
['article'].each do |reg_widget|
  RegisteredWidget.find_or_create_by_system_name(reg_widget)
end

puts 'Languages...'
[
    {:system_name => 'english', :locale => 'en', :local_name => 'English'},
    {:system_name => 'hebrew', :locale => 'he', :local_name => 'עיברית'},
    {:system_name => 'russian', :locale => 'ru', :local_name => 'русский'},
].each { |loc|
  Language.find_or_create_by_system_name loc
}

puts 'Done.'