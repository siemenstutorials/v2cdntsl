#!/bin/bash
# ====================================================================================================================================================================================
# config
# ====================================================================================================================================================================================

# DOCKER_NODE 

# Cloudflare API 令牌
CFAPI_KEY=e5bbfc76190108f37b57ff0f91b9df9401b8a
# WAN IP
WAN_IP=$(curl -s ipv4.icanhazip.com)
# Record type, A(IPv4) AAAA(IPv6) CNAME
CFRECORD_TYPE=A

# 后台网址
PANEL_URL=
# 后台LicenseBox授权客户名称
PANEL_CST=
# 后台LicenseBox授权客户秘钥
PANEL_LIC=
# 后台后端对接秘钥
PANEL_KEY=

# 根域名
DOMAIN_ZONE=
DOMAIN_MAIL=

# 节点IP地址数组
DOMAIN_NAME[0]=
DOMAIN_CDNS[0]=
DOCKER_NAME[0]=
DOCKER_PORT[0]=
DOCKER_NODE[0]=


# ====================================================================================================================================================================================
# 执行安装
# ====================================================================================================================================================================================

wget -q https://raw.githubusercontent.com/siemenstutorials/v2cdntsl/master/table.sh -O table.sh
wget -q https://raw.githubusercontent.com/siemenstutorials/v2cdntsl/master/v2tls.sh -O v2tls.sh

. ./v2tls.sh

identify_system
identify_operate

output_title

install_base
install_swap

install_nginx
install_dns
install_cert
install_conf
install_cron
install_docker

systemctl restart nginx

output_result

rm -rf ./table.sh
rm -rf $0
