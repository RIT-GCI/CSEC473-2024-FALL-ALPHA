OPENSTACKENV=./cdt-alpha-openrc.sh
PLAYER_SIZE=medium-large
PLAYER_IMAGE=Kali2024.2
PLAYER_SECGROUP=player-sec
GRAY_SSH=pitboss
SSHJUMPNET=e721ed5e-fefc-48d9-ad0f-7b9022a81b56
BLUE_NIC=e83380ed-1ed8-41d4-89f0-06ded98440c2

# add enviornment variables, authenticate to openstack
source $OPENSTACKENV


openstack server create --wait --flavor $PLAYER_SIZE --boot-from-volume 100 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$BLUE_NIC,v4-fixed-ip=10.21.13.1 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute02 blue_1 
openstack server create --wait --flavor $PLAYER_SIZE --boot-from-volume 100 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$BLUE_NIC,v4-fixed-ip=10.21.13.2 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute03 blue_2
openstack server create --wait --flavor $PLAYER_SIZE --boot-from-volume 100 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$BLUE_NIC,v4-fixed-ip=10.21.13.3 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute04 blue_3
openstack server create --wait --flavor $PLAYER_SIZE --boot-from-volume 100 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$BLUE_NIC,v4-fixed-ip=10.21.13.4 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute05 blue_4
openstack server create --wait --flavor $PLAYER_SIZE --boot-from-volume 100 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$BLUE_NIC,v4-fixed-ip=10.21.13.5 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute06 blue_5
openstack server create --wait --flavor $PLAYER_SIZE --boot-from-volume 100 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$BLUE_NIC,v4-fixed-ip=10.21.13.6 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute02 blue_6   
openstack server create --wait --flavor $PLAYER_SIZE --boot-from-volume 100 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$BLUE_NIC,v4-fixed-ip=10.21.13.7 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute03 blue_7
openstack server create --wait --flavor $PLAYER_SIZE --boot-from-volume 100 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$BLUE_NIC,v4-fixed-ip=10.21.13.8 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute04 blue_8
openstack server create --wait --flavor $PLAYER_SIZE --boot-from-volume 100 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$BLUE_NIC,v4-fixed-ip=10.21.13.9 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute05 blue_9
openstack server create --wait --flavor $PLAYER_SIZE --boot-from-volume 100 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$BLUE_NIC,v4-fixed-ip=10.21.13.10 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute06 blue_10
