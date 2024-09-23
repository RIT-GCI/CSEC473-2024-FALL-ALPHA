OPENSTACKENV=./cdt-alpha-openrc.sh
PLAYER_SIZE=medium-large
PLAYER_IMAGE=2fbcc4ce-f116-430b-aa8f-63c4bc7a88d4 
PLAYER_SECGROUP=player-sec
GRAY_SSH=pitboss
SSHJUMPNET=e721ed5e-fefc-48d9-ad0f-7b9022a81b56
RED_NIC=85adecb1-043b-4762-a995-6dd0b723d4be

# add enviornment variables, authenticate to openstack
source $OPENSTACKENV


openstack server stop red_1
openstack server delete red_1 
openstack server stop red_2
openstack server delete red_2
openstack server stop red_3
openstack server delete red_3 
openstack server stop red_4
openstack server delete red_4
openstack server stop red_5
openstack server delete red_5
openstack server stop red_6
openstack server delete red_6
openstack server stop red_7
openstack server delete red_7
openstack server stop red_8
openstack server delete red_8
openstack server stop red_9
openstack server delete red_9
openstack server stop red_10
openstack server delete red_10

openstack server create  --flavor $PLAYER_SIZE --boot-from-volume 90 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$RED_NIC,v4-fixed-ip=10.21.11.11 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute02 red_1 
openstack server create  --flavor $PLAYER_SIZE --boot-from-volume 90 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$RED_NIC,v4-fixed-ip=10.21.11.12 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute03 red_2
openstack server create  --flavor $PLAYER_SIZE --boot-from-volume 90 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$RED_NIC,v4-fixed-ip=10.21.11.13 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute04 red_3
openstack server create  --flavor $PLAYER_SIZE --boot-from-volume 90 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$RED_NIC,v4-fixed-ip=10.21.11.14 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute05 red_4
openstack server create  --flavor $PLAYER_SIZE --boot-from-volume 90 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$RED_NIC,v4-fixed-ip=10.21.11.15 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute06 red_5
openstack server create  --flavor $PLAYER_SIZE --boot-from-volume 90 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$RED_NIC,v4-fixed-ip=10.21.11.16 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute02 red_6   
openstack server create  --flavor $PLAYER_SIZE --boot-from-volume 90 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$RED_NIC,v4-fixed-ip=10.21.11.17 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute03 red_7
openstack server create  --flavor $PLAYER_SIZE --boot-from-volume 90 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$RED_NIC,v4-fixed-ip=10.21.11.18 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute04 red_8
openstack server create  --flavor $PLAYER_SIZE --boot-from-volume 90 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$RED_NIC,v4-fixed-ip=10.21.11.19 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute05 red_9
openstack server create  --flavor $PLAYER_SIZE --boot-from-volume 90 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$RED_NIC,v4-fixed-ip=10.21.11.20 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute06 red_10
