package IPSB;

use strict;
use warnings;
use HTTP::Tiny;
use JSON::PP;

sub new {
    my $self = {
        api => "https://api.ip.sb",
        headers => {
            "user-agent" => "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36",
            "accept" => "application/json"
        }
    };
    $self->{http} = HTTP::Tiny->new(
        agent => "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36",
        verify_SSL => 0,
        timeout => 30
    );
    
    bless $self;
    return $self;
}

sub my_ip {
    my ($self) = @_;
    
    my $res = $self->{http}->get(
        "$self->{api}/jsonip",
        {headers => $self->{headers}}
    );
    
    return decode_json($res->{content});
}

sub get_ip {
    my ($self, $ip) = @_;
    
    my $res = $self->{http}->get(
        "$self->{api}/geoip/$ip",
        {headers => $self->{headers}}
    );
    
    return decode_json($res->{content});
}

1;
