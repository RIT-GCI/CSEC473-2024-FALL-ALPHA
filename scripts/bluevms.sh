OPENSTACKENV=./cdt-alpha-openrc.sh
PLAYER_SIZE=medium-large
PLAYER_IMAGE=c12d43a5-3125-413d-b988-c74697f0f6ac  
PLAYER_SECGROUP=player-sec
GRAY_SSH=pitboss
SSHJUMPNET=e721ed5e-fefc-48d9-ad0f-7b9022a81b56
BLUE_NIC=e83380ed-1ed8-41d4-89f0-06ded98440c2

# add enviornment variables, authenticate to openstack
source $OPENSTACKENV


openstack server stop blue_1
openstack server delete blue_1 
openstack server stop blue_2
openstack server delete blue_2
openstack server stop blue_3
openstack server delete blue_3 
openstack server stop blue_4
openstack server delete blue_4
openstack server stop blue_5
openstack server delete blue_5
openstack server stop blue_6
openstack server delete blue_6
openstack server stop blue_7
openstack server delete blue_7
openstack server stop blue_8
openstack server delete blue_8
openstack server stop blue_9
openstack server delete blue_9
openstack server stop blue_10
openstack server delete blue_10

openstack server create  --flavor $PLAYER_SIZE --boot-from-volume 90 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$BLUE_NIC,v4-fixed-ip=10.21.13.11 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute02 blue_1 
openstack server create  --flavor $PLAYER_SIZE --boot-from-volume 90 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$BLUE_NIC,v4-fixed-ip=10.21.13.12 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute03 blue_2
openstack server create  --flavor $PLAYER_SIZE --boot-from-volume 90 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$BLUE_NIC,v4-fixed-ip=10.21.13.13 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute04 blue_3
openstack server create  --flavor $PLAYER_SIZE --boot-from-volume 90 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$BLUE_NIC,v4-fixed-ip=10.21.13.14 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute05 blue_4
openstack server create  --flavor $PLAYER_SIZE --boot-from-volume 90 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$BLUE_NIC,v4-fixed-ip=10.21.13.15 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute06 blue_5
openstack server create  --flavor $PLAYER_SIZE --boot-from-volume 90 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$BLUE_NIC,v4-fixed-ip=10.21.13.16 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute02 blue_6   
openstack server create  --flavor $PLAYER_SIZE --boot-from-volume 90 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$BLUE_NIC,v4-fixed-ip=10.21.13.17 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute03 blue_7
openstack server create  --flavor $PLAYER_SIZE --boot-from-volume 90 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$BLUE_NIC,v4-fixed-ip=10.21.13.18 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute04 blue_8
openstack server create --flavor $PLAYER_SIZE --boot-from-volume 90 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$BLUE_NIC,v4-fixed-ip=10.21.13.19 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute05 blue_9
openstack server create  --flavor $PLAYER_SIZE --boot-from-volume 90 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$BLUE_NIC,v4-fixed-ip=10.21.13.20 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute06 blue_10
