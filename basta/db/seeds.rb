# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [{:first_name => 'admin', :last_name => 'admin',:user_id => 'admin', :password => 'admin', :password_confirmation => 'admin',:role => 'owner', :session_token => "af23dfa09jadfo23", :email => 'admin@email.com'},
        {:first_name => 'manage', :last_name => '1',:user_id => 'manage1', :password => 'manage1', :password_confirmation => 'manage1',:role => 'manager', :session_token => "afsefk23okj08sdf", :email => 'manager1@email.com'},
        {:first_name => 'person', :last_name => '1',:user_id => 'person1', :password => 'person1', :password_confirmation => 'person1',:role => 'staff', :session_token => "ajgieno20nnk3489kd", :email => 'person1@email.com'},
         {:first_name => 'manage', :last_name => '2',:user_id => 'manage2', :password => 'manage2', :password_confirmation => 'manage2',:role => 'manager', :session_token => "jiown3ok40ni57n", :email => 'manager2@email.com'},
          {:first_name => 'person', :last_name => '2',:user_id => 'person2', :password => 'person2', :password_confirmation => 'person2',:role => 'staff', :session_token => "joij39n39234k", :email => 'person2@email.com'},
         {:first_name => 'other', :last_name => 'admin',:user_id => 'other_admin', :password => 'other_admin', :password_confirmation => 'other_admin',:role => 'owner', :session_token => "290jk3242jk2l9234k", :email => 'other_admin@email.com'}
     ]

shift_ranks = [{name: "easy peasy", user_ranks_allowed: "1,2,3,4,5,6", applicable_shifts: "11111111111111",description: "The most basic kind of shift. It can be worked any day by anybody"},
    {name: "moderate solder it", user_ranks_allowed: "3,4,5,6", applicable_shifts: "11111111111111",description: "Moderately hard job.  Can be worked any day by non-newbies"},
    {name: "hard shard", user_ranks_allowed: "4,5,6", applicable_shifts: "11111111111111",description: "Difficult job.  Can be worked any day by experienced employees"},
    {name: "Weekend Seekin", user_ranks_allowed: "5,6", applicable_shifts: "00000000001111",description: "Difficult job.  Can be worked on weekends by experienced employees"},
    {name: "God Incarnate", user_ranks_allowed: "6", applicable_shifts: "00000000001111",description: "Only meant for the gods among us"}
]
shifts = []
today = Date.today
test_days = ((today.at_beginning_of_week-5)..(today.at_end_of_week+5)).map.each do |day|
  shifts.push({:date => DateTime.new(day.year,day.mon,day.mday,10),:section => "L1", :status => "normal"})
  shifts.push({:date => DateTime.new(day.year,day.mon,day.mday,18),:section => "D2", :status => "normal"})
end

users.each do |user|
  u = User.create!(user)
  #shifts.each do |s|
   # u.shifts.create!(s)
  #end
end

shift_ranks.each do |shift_rank|
  s = ShiftRanks.create!(shift_rank)
end
