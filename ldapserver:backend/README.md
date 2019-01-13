# ldapserver:samba

## @edt ASIX M06-ASO 2018-2019

## Maquina

raulbaena/ldapserver:samba --> Maquina servidor ldap amb base de dades dc=edt,dc=org

ldapserver 2018-2019 edt.org cn

Comandes per execució

 * **server** docker run --rm --network sambanet -h ldap --name ldap -p 389:389 -d ldapserver:samba


## Hem de implementar l'equema samba al servidor ldap per poder fer el populate y poder 

Per fer aixo hem de editar l'arxiu de configuració slapd.conf y incluir l'schema

include         /etc/openldap/schema/samba.schema

Y tambe hem de tenir l'arxiu samba.shema



