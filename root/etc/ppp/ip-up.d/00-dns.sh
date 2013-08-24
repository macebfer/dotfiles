#!/bin/sh

if [ "$USEPEERDNS" = "1" -a -f /etc/ppp/resolv.conf ]; then
  [ -e /etc/resolv.conf ] && mv /etc/resolv.conf /etc/resolv.conf.backup.${IFNAME}
  
  touch /etc/resolv.conf
  
  if [ -e /etc/resolv.conf.head ]; then
    cat /etc/resolv.conf.head >> /etc/resolv.conf
  fi

  if [ -e /etc/ppp/resolv.conf ]; then
    cat /etc/ppp/resolv.conf >> /etc/resolv.conf
  fi
  
  if [ -e /etc/resolv.conf.tail ]; then
    cat /etc/resolv.conf.tail >> /etc/resolv.conf
  fi
  #  mv /etc/ppp/resolv.conf /etc/resolv.conf
  chmod 644 /etc/resolv.conf
fi
