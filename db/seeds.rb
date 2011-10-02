# encoding: UTF-8
puts 'Languages...'
[
    {:system_name => 'english', :locale => 'en', :local_name => 'English'},
    {:system_name => 'hebrew', :locale => 'he', :local_name => 'עיברית'},
    {:system_name => 'russian', :locale => 'ru', :local_name => 'русский'},
].each { |loc|
  Language.find_or_create_by_system_name loc
}

puts 'Done.'