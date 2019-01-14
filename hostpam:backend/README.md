# PAM
## @edt Raul Baena Nocea ASIX M06-ASO Curs 2018-2019

# Execució de la maquina 

docker run --privileged --rm --name host --hostname host --network sambanet  -it raulbaena/hostpam:backend

## Configuracio del client

Hem de configurar l'arxiu pam_mount i afegir una line que permeti muntar sistemas de fitxers cifs.

<volume user="*" fstype="cifs" server="172.20.0.3" path="%(USER)" mountpoint="~/%(USER)"
/>

## Exemple del funcionament
```
[root@host docker]# su - pere
Creating directory '/tmp/home/pere'.
reenter password for pam_mount:
[pere@host ~]$ mount -t cifs
//172.19.0.3/pere on /tmp/home/pere/pere type cifs (rw,relatime,vers=default,cache=strict,username=pere,domain=,uid=5001,forceuid,gid=100,forcegid,addr=172.19.0.3,file_mode=0755,dir_mode=0755,soft,nounix,serverino,mapposix,rsize=1048576,wsize=1048576,echo_interval=60,actimeo=1)

```
