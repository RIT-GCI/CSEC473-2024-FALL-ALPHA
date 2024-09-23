OPENSTACKENV=./cdt-alpha-openrc.sh
PLAYER_SIZE=medium-large
PLAYER_IMAGE=Kali2024.2
PLAYER_SECGROUP=player-sec
GRAY_SSH=pitboss
SSHJUMPNET=e721ed5e-fefc-48d9-ad0f-7b9022a81b56
RED_NIC=85adecb1-043b-4762-a995-6dd0b723d4be

# add enviornment variables, authenticate to openstack
source $OPENSTACKENV


openstack server create --wait --flavor $PLAYER_SIZE --boot-from-volume 100 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$RED_NIC,v4-fixed-ip=10.21.11.1 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute02 red_1 
openstack server create --wait --flavor $PLAYER_SIZE --boot-from-volume 100 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$RED_NIC,v4-fixed-ip=10.21.11.2 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute03 red_2
openstack server create --wait --flavor $PLAYER_SIZE --boot-from-volume 100 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$RED_NIC,v4-fixed-ip=10.21.11.3 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute04 red_3
openstack server create --wait --flavor $PLAYER_SIZE --boot-from-volume 100 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$RED_NIC,v4-fixed-ip=10.21.11.4 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute05 red_4
openstack server create --wait --flavor $PLAYER_SIZE --boot-from-volume 100 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$RED_NIC,v4-fixed-ip=10.21.11.5 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute06 red_5
openstack server create --wait --flavor $PLAYER_SIZE --boot-from-volume 100 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$RED_NIC,v4-fixed-ip=10.21.11.6 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute02 red_6   
openstack server create --wait --flavor $PLAYER_SIZE --boot-from-volume 100 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$RED_NIC,v4-fixed-ip=10.21.11.7 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute03 red_7
openstack server create --wait --flavor $PLAYER_SIZE --boot-from-volume 100 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$RED_NIC,v4-fixed-ip=10.21.11.8 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute04 red_8
openstack server create --wait --flavor $PLAYER_SIZE --boot-from-volume 100 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$RED_NIC,v4-fixed-ip=10.21.11.9 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute05 red_9
openstack server create --wait --flavor $PLAYER_SIZE --boot-from-volume 100 --image $PLAYER_IMAGE --key-name $GRAY_SSH --nic net-id=$RED_NIC,v4-fixed-ip=10.21.11.10 --nic net-id=$SSHJUMPNET --security-group $PLAYER_SECGROUP --availability-zone gcicompute06 red_10
