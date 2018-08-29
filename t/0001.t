#!/usr/bin/env bash
expect
spawn tecoc
expect "\*"
send "\001\rHello, World!\r\001ex\027\027\r"
expect "*\$ "#!/usr/bin/env bash
expect
spawn tecoc
expect "\*"
send "\001\rHello, World!\r\001ex\027\027\r"
expect " { puts "ok # Looks like it's up and running\n"
  exit 0;
}
puts "not ok # o'dear, what' 'appenin'\n"

