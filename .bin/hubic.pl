#!/usr/bin/perl
#
# $Id: hubic.pl 6 2012-02-08 17:46:06Z gomor $
#
package Hubic;
use strict;
use warnings;

use LWP::UserAgent;

sub new {
   my $self  = shift;
   my $class = ref($self) || $self;

   my %h     = (
      host => 'ws.ovh.com',
      @_,
   );

   my $ua = LWP::UserAgent->new;
   $ua->agent("hubiC/1.0.9 (Windows NT 6.1; fr_FR)");
   $h{_ua} = $ua;

   return bless(\%h, $class);
}

sub getWebdavInfo {
   my $self = shift;

   my $id                 = $self->_postNasLogin;
   my $url                = $self->_postGetNas($id);
   my ($login, $password) = $self->_postGetCredentials($id);

   return ($url, $login, $password);
}

sub _postNasLogin {
   my $self = shift;

   my $ua       = $self->{_ua};
   my $host     = $self->{host};
   my $login    = $self->{login};
   my $password = $self->{password};

   my $params = '{"email":"'.$login.'","password":"'.$password.'"}';

   # Encode characters if URI::Escape is available
   eval("use URI::Escape;");
   if (!$@) {
      print "[DEBUG] URI::Escape available\n" if $self->{debug};
      $params = uri_escape($params);
   }

   # 'POST /cloudnas/r0/ws.dispatcher/nasLogin HTTP/1.1'."\r\n".
   # 'Content-Type: application/x-www-form-urlencoded'."\r\n".
   # 'User-Agent: hubiC/1.0.9 (Windows NT 6.1; fr_FR)'."\r\n".
   # 'Content-Length: 126'."\r\n".
   # 'Connection: Keep-Alive'."\r\n".
   # 'Accept-Encoding: gzip'."\r\n".
   # 'Accept-Language: fr-FR,en,*'."\r\n".
   # 'Host: ws.ovh.com'."\r\n".
   # ''."\r\n".
   # 'session=&params=%7B%20%22email%22%20%3A%20%22<login>%22%2C%20%22password%22%20%3A%20%22<password>%22%20%7D'."\r\n".
   # "\r\n";
   my $req = HTTP::Request->new(
      POST => "https://$host/cloudnas/r0/ws.dispatcher/nasLogin",
   );
   $req->content_type('application/x-www-form-urlencoded');
   $req->content('session=&params='.$params);

   my $res = $ua->request($req);
   if (! $res->is_success) {
      die("FATAL: postNasLogin() failed:\n[", $res->content, "]\n");
   }

   my $reply = $res->content;
   print "[DEBUG] $reply\n" if $self->{debug};

   (my $id = $reply) =~ s/^.*"\s*id\s*?"\s*?:\s*?"\s*(.*?)\s*".*$/$1/;
   print "[DEBUG] Got ID [$id]\n" if $self->{debug};

   return $id;
}

sub _postGetNas {
   my $self = shift;
   my ($id) = @_;

   my $ua   = $self->{_ua};
   my $host = $self->{host};

   # 'POST /cloudnas/r0/ws.dispatcher/getNas HTTP/1.1'."\r\n".
   # 'Content-Type: application/x-www-form-urlencoded'."\r\n".
   # 'User-Agent: hubiC/1.0.9 (Windows NT 6.1; fr_FR)'."\r\n".
   # 'Content-Length: 54'."\r\n".
   # 'Connection: Keep-Alive'."\r\n".
   # 'Accept-Encoding:gzip'."\r\n".
   # 'Accept-Language: fr-FR,en,*'."\r\n".
   # 'Host: ws.ovh.com'."\r\n".
   # ''."\r\n".
   # 'session=<id>'."\r\n".
   # "\r\n";
   my $req = HTTP::Request->new(
      POST => "https://$host/cloudnas/r0/ws.dispatcher/getNas",
   );
   $req->content_type('application/x-www-form-urlencoded');
   $req->content("session=$id");

   my $res = $ua->request($req);
   if (! $res->is_success) {
      die("FATAL: postGetNas() failed:\n[", $res->content, "]\n");
   }

   my $reply = $res->content;
   print "[DEBUG] $reply\n" if $self->{debug};

   (my $url = $reply) =~ s/^.*"\s*url\s*?"\s*?:\s*?"\s*(.*?)\s*".*$/$1/;
   print "[DEBUG] Got URL [$url]\n" if $self->{debug};

   return $url;
}

sub _postGetCredentials {
   my $self = shift;
   my ($id) = @_;

   my $ua   = $self->{_ua};
   my $host = $self->{host};

   # 'POST /cloudnas/r0/ws.dispatcher/getCredentials HTTP/1.1'."\r\n".
   # 'Content-Type: application/x-www-form-urlencoded'."\r\n".
   # 'User-Agent: hubiC/1.0.9 (Windows NT 6.1; fr_FR)'."\r\n".
   # 'Content-Length: 54'."\r\n".
   # 'Connection: Keep-Alive'."\r\n".
   # 'Accept-Encoding: gzip'."\r\n".
   # 'Accept-Language: fr-FR,en,*'."\r\n".
   # 'Host: ws.ovh.com'."\r\n".
   # ''."\r\n".
   # 'session=<id>'."\r\n".
   # "\r\n";
   my $req = HTTP::Request->new(
      POST => "https://$host/cloudnas/r0/ws.dispatcher/getCredentials",
   );
   $req->content_type('application/x-www-form-urlencoded');
   $req->content("session=$id");

   my $res = $ua->request($req);
   if (! $res->is_success) {
      die("FATAL: postGetCredentials() failed:\n[", $res->content, "]\n");
   }

   my $reply = $res->content;
   print "[DEBUG] $reply\n" if $self->{debug};

   (my $username = $reply) =~ s/^.*"\s*username\s*?"\s*?:\s*?"\s*(.*?)\s*".*$/$1/;
   print "[DEBUG] Got username [$username]\n" if $self->{debug};

   (my $secret = $reply) =~ s/^.*"\s*secret\s*?"\s*?:\s*?"\s*(.*?)\s*".*$/$1/;
   print "[DEBUG] Got secret [$secret]\n" if $self->{debug};

   return ($username, $secret);
}

1;

package main;

use Getopt::Std;
my %opts;
getopts('l:dh', \%opts);

if (!$opts{l} || $opts{h}) {
   die("Usage: $0 -l login [-d] [-h]\n");
}

eval("use Term::ReadKey;");
my $password = '';
print "Password:";
if (!$@) {
   print "[DEBUG] Term::ReadKey available\n" if $opts{d};
   ReadMode('noecho');
}
$password = <>;
chomp($password);
print "\n";

my $hubic = Hubic->new(
   login    => $opts{l},
   password => $password,
   debug    => $opts{d},
);
my ($hubicUrl, $hubicLogin, $hubicPassword) = $hubic->getWebdavInfo;

print "URL:      $hubicUrl\n";
print "Nom d'utilisateur:    $hubicLogin\n";
print "Mot de passe: $hubicPassword\n\n";
print "mount -t davfs $hubicUrl /mnt\n";

exit(0);
