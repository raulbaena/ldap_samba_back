# PAM

## @edt ASIX M06-ASO Curs 2018-2019

Fitxers necesaris per la cració del servidor SAMBA amb ldap backend

## Fitxers de configuració

Fitxers

Dockerfile

README.md

install.sh

ldap.conf

nslcd.conf

nsswitch.conf

pam_mount.conf.xml

startup.sh

system-auth

dir_samba.sh

usuaris_samba.sh

# Execució de la imatge 

docker run --privileged --rm --name smb -h smb --network sambanet -it raulbaena/samba:backend

## Configuració smb.conf

```
[global]
        workgroup = MYGROUP
        server string = Samba Server Version %v
        log file = /var/log/samba/log.%m
        max log size = 50
        security = user
        passdb backend = ldapsam:ldap://172.19.0.2
          ldap suffix = dc=edt,dc=org
          ldap user suffix = ou=usuaris
          ldap group suffix = ou=grups
          ldap machine suffix = ou=hosts
          ldap idmap suffix = ou=domains
          ldap admin dn = cn=Manager,dc=edt,dc=org
          ldap ssl = no
          ldap passwd sync = yes
        load printers = yes
        cups options = raw
[homes]
        comment = Home Directories
        browseable = no
        writable = yes
;       valid users = %S
;       valid users = MYDOMAIN\%S
```

## Instalem el paquet smbldap-tools per configurar els fitxers de smbldap-tools /etc/smbldap-tools/smbldap.conf i smbldap_bind.conf. establint els noms del DIT i els passwords apropiats.

Editem l'arxiu smbldap_bind.conf i poser la seguent configuració

```
#$Id$

############################
# Credential Configuration #
############################
# Notes: you can specify two differents configuration if you use a
# master ldap for writing access and a slave ldap server for reading access
# By default, we will use the same DN (so it will work for standard Samba
# release)
slaveDN="cn=Manager,dc=edt,dc=org"
slavePw="secret"
masterDN="cn=Manager,dc=edt,dc=org"
masterPw="secret"
`´´

```

## Comprovament de la configuració
```
[root@smb docker]# net getlocalsid
SID for domain SMB is: S-1-5-21-3476053131-24837329-2394870572
[root@smb docker]# 

[root@smb docker]# pdbedit -L     
pla:1001:
rock:1003:
pere:5001:Pere Pou
patipla:1002:
lila:1000:
pau:5000:Pau Pou
marta:5003:Marta Mas
user10:7010:user10
vladimir:11011:vladimir putin


dn: cn=Domain Computers,ou=grups,dc=edt,dc=org
objectClass: top
objectClass: posixGroup
objectClass: sambaGroupMapping
cn: Domain Computers
gidNumber: 515
description: Netbios Domain Computers accounts
sambaSID: S-1-5-21-3256680068-2071967703-3521285492-515
sambaGroupType: 2
displayName: Domain Computers

dn: cn=Administrators,ou=grups,dc=edt,dc=org
objectClass: top
objectClass: posixGroup
objectClass: sambaGroupMapping
cn: Administrators
gidNumber: 544
description: Netbios Domain Members can fully administer the computer/sambaDom
 ainName
sambaSID: S-1-5-32-544
sambaGroupType: 4
displayName: Administrators

dn: cn=Account Operators,ou=grups,dc=edt,dc=org
objectClass: top
objectClass: posixGroup
objectClass: sambaGroupMapping
cn: Account Operators
gidNumber: 548
description: Netbios Domain Users to manipulate users accounts
sambaSID: S-1-5-32-548
sambaGroupType: 4
displayName: Account Operators

dn: cn=Print Operators,ou=grups,dc=edt,dc=org
objectClass: top
objectClass: posixGroup
objectClass: sambaGroupMapping
cn: Print Operators
gidNumber: 550
description: Netbios Domain Print Operators
sambaSID: S-1-5-32-550
sambaGroupType: 4
displayName: Print Operators

dn: cn=Backup Operators,ou=grups,dc=edt,dc=org
objectClass: top
objectClass: posixGroup
objectClass: sambaGroupMapping
cn: Backup Operators
gidNumber: 551
description: Netbios Domain Members can bypass file security to back up files
sambaSID: S-1-5-32-551
sambaGroupType: 4
displayName: Backup Operators

dn: cn=Replicators,ou=grups,dc=edt,dc=org
objectClass: top
objectClass: posixGroup
objectClass: sambaGroupMapping
cn: Replicators
gidNumber: 552
description: Netbios Domain Supports file replication in a sambaDomainName
sambaSID: S-1-5-32-552
sambaGroupType: 4
displayName: Replicators
```



#By Raul Baena Nocea
