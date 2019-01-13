#! /bin/bash
# @edt ASIX M06 2018-2019
# instal.lacio
#  - samba
# -------------------------------------

cp /opt/docker/nslcd.conf /etc/nslcd.conf
cp /opt/docker/ldap.conf /etc/openldap/ldap.conf
cp /opt/docker/nsswitch.conf /etc/nsswitch.conf
cp /opt/docker/pam_mount.conf.xml /etc/security/pam_mount.conf.xml
cp /opt/docker/system-auth /etc/pam.d/system-auth
cp /opt/docker/smbldap_bind.conf /etc/smbldap-tools/smbldap_bind.conf
cp /opt/docker/smbldap.conf /etc/smbldap-tools/smbldap.conf




echo -e "jupiter\njupiter" | smbldap-populate

