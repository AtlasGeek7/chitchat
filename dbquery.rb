require 'mysql2'
require 'terminal-table'

def connect_to_db
  $client = Mysql2::Client.new(:host => "sql9.freemysqlhosting.net", :username => "sql9323521", :password => "WgmexVI9VE", :database => "sql9323521", :port => "3306")
end

def close_db
  $client.close
end

connect_to_db

results = $client.query("DELETE FROM users WHERE id=7")


def disp_users
  results = $client.query("SELECT * FROM users")
  rows = []
  results.each_with_index { |row,idx|
    rows << [ row['id'], row['username'], row['password'], row['status'] ]
    rows << :separator if idx < results.size-1
    if row["dne"]
      puts row["dne"]
    end
  }
  table = Terminal::Table.new :headings => ['ID:', 'Username:', 'Password:', 'Status:'], :rows => rows
  puts table
end

disp_users

#results = $client.query("UPDATE users SET message='Welcome, f.i. mates !!!~' WHERE username='ADMIN'")
#results = $client.query("UPDATE users SET message='testing...~' WHERE username='ADMIN'")




=begin
$message = []
results = $client.query("SELECT * FROM users WHERE username='ADMIN'")
rows = []
results.each_with_index { |row,idx|
  $message << row['message']
  if row["dne"]
    puts row["dne"]
  end
}
$msg_cnt = $message.size
#print $message[0].split('.')
puts $message.size
message = $message[0].split('~')
#print message
 #message.each { |msg| puts msg }
 puts message[-15..-1]
=end





close_db
