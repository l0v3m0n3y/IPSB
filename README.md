# IPSB
api for ip.sb IP Address Lookup / IPv4 / IPv6 - IP.SB
# main
```perl
require './IPSB.pm'; 

my $client = IPSB->new();
my $ip_info = $client->my_ip();
print "Your IP: $ip_info->{ip}\n";
```

# Launch (your script)
```
perl main.pl
```
