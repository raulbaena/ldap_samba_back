# SAMBA SERVER

# RAUL BAENA NOCEA EDT ASIX 2018-2019

# Arquitectura

sambanet --> Una xarxa propia per als containers implicats.

raulbaena/samba:backend --> Servidor SAMBA per implementar el servidor ldap com backend

raulbaena/ldapserver:backend --> Un servidor ldap en funcionament amb els usuaris de xarxa.

raulbaena/hostpam:backend --> Host amb connexío al servidor ldap. Utilitzarem aquest host per conectarnos al samba

## Execució de les maquines

docker network create sambanet

docker run --privileged --rm -h host --name host --network sambanet -it raulbaena/hostpam:backend

docker run --privileged --rm --name smb -h smb --network sambanet -it raulbaena/samba:backend

docker run --rm --network sambanet -h ldap --name ldap -p 389:389 -d raulbaena/ldapserver:backend
