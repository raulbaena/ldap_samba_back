# Version: 0.0.1
# @edt M06 2018-2019
# Servidor Samba by Raul Baena Noce
# -------------------------------------
FROM fedora:27
LABEL author="Raul Baena Nocea @edt ASIX M06-ASO"
LABEL description="Servidor SAMBA 2018-2019"
RUN dnf -y install procps passwd openldap-clients nss-pam-ldapd samba samba-client smbldap-tools vim 
RUN mkdir /opt/docker
COPY * /opt/docker/
RUN chmod +x /opt/docker/install.sh /opt/docker/startup.sh /opt/docker/dir_samba.sh /opt/docker/usuaris_samba.sh
WORKDIR /opt/docker
CMD ["/opt/docker/startup.sh"]
