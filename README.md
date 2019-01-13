# SAMBA SERVER

# RAUL BAENA NOCEA EDT ASIX 2018-2019

# Arquitectura

sambanet --> Una xarxa propia per als containers implicats.

samba:server --> Servidor SAMBA pero montar homes 

ldapserver:samba --> Un servidor ldap en funcionament amb els usuaris de xarxa.

hostpam:samba --> Host amb connexío al servidor ldap. Utilitzarem aquest host per conectarnos al samba

## Execució de les maquines

docker network create sambanet

docker run --privileged --rm -h host --name host --network sambanet -it hostpam:samba

docker run --privileged --rm --name smb -h smb --network sambanet -it samba:server

docker run --rm --network sambanet -h ldap --name ldap -p 389:389 -d ldapserver:samba
