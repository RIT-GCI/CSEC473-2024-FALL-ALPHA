OPENSTACKENV=./cdt-alpha-openrc.sh
SIZE=large
DEBIAN=DebianBookworm12
ROCKY=RockyLinux86
WINDOWS=WinSrv2019-2024.7 
POINTS_SEC=points-sec
GRAY_SSH=ansible
SSHJUMPNET=e721ed5e-fefc-48d9-ad0f-7b9022a81b56
ROCKYINIT=./rocky-cloud.yaml

TEAM1_NIC=1eb82fc6-37d2-4767-8eae-ab4e1cb5bca6
TEAM2_NIC=c5f4d114-28fa-402b-ba4a-69496dbbf839
# add enviornment variables, authenticate to opens  tack
source $OPENSTACKENV
# openstack server stop roulette-1
# openstack server delete roulette-1 
# openstack server stop roulette-2
# openstack server delete roulette-2
# openstack server stop blackjack-1
# openstack server delete blackjack-1
# openstack server stop blackjack-2
# openstack server delete blackjack-2
# openstack server stop slots-1
# openstack server delete slots-1
# openstack server stop slots-2
# openstack server delete slots-2
# openstack server stop baccarat-1
# openstack server delete baccarat-1
# openstack server stop baccarat-2
# openstack server delete baccarat-2
# openstack server stop poker-1
# openstack server delete poker-1
# openstack server stop poker-2
# openstack server delete poker-2

# sleep 90
# openstack server create --wait  --flavor $SIZE --boot-from-volume 30 --image $DEBIAN --key-name $GRAY_SSH --nic net-id=$TEAM1_NIC,v4-fixed-ip=10.21.1.70 --security-group $POINTS_SEC --availability-zone gcicompute03 poker-1
openstack server create --wait  --flavor $SIZE --boot-from-volume 30 --image $DEBIAN --key-name $GRAY_SSH --nic net-id=$TEAM2_NIC,v4-fixed-ip=10.21.2.70 --security-group $POINTS_SEC --availability-zone gcicompute03 poker-2
# sleep 60
#deploy VM 2
# openstack server create --wait  --flavor $SIZE --boot-from-volume 30 --image $ROCKY --key-name $GRAY_SSH --nic net-id=$TEAM1_NIC,v4-fixed-ip=10.21.1.71 --security-group $POINTS_SEC --availability-zone gcicompute02 --user-data $ROCKYINIT blackjack-1
openstack server create --wait  --flavor $SIZE --boot-from-volume 30 --image $ROCKY --key-name $GRAY_SSH --nic net-id=$TEAM2_NIC,v4-fixed-ip=10.21.2.71 --security-group $POINTS_SEC --availability-zone gcicompute02 --user-data $ROCKYINIT blackjack-2
# #deploy VM 3
sleep 60
#deploy VM 4
openstack server create --wait  --flavor $SIZE --boot-from-volume 30 --image $DEBIAN --key-name $GRAY_SSH --nic net-id=$TEAM1_NIC,v4-fixed-ip=10.21.1.72 --security-group $POINTS_SEC --availability-zone gcicompute07  slots-1
openstack server create --wait  --flavor $SIZE --boot-from-volume 30 --image $DEBIAN --key-name $GRAY_SSH --nic net-id=$TEAM2_NIC,v4-fixed-ip=10.21.2.72 --security-group $POINTS_SEC --availability-zone gcicompute07  slots-2
sleep 60
#deploy VM 5
openstack server create --wait  --flavor $SIZE --boot-from-volume 30 --image $ROCKY --key-name $GRAY_SSH --nic net-id=$TEAM1_NIC,v4-fixed-ip=10.21.1.73 --security-group $POINTS_SEC --availability-zone gcicompute05  --user-data $ROCKYINIT baccarat-1
openstack server create --wait  --flavor $SIZE --boot-from-volume 30 --image $ROCKY --key-name $GRAY_SSH --nic net-id=$TEAM2_NIC,v4-fixed-ip=10.21.2.73 --security-group $POINTS_SEC --availability-zone gcicompute05  --user-data $ROCKYINIT baccarat-2
sleep 60
#deploy VM 1
openstack server create --wait  --flavor windows --boot-from-volume 50 --image $WINDOWS --key-name $GRAY_SSH --nic net-id=$TEAM1_NIC,v4-fixed-ip=10.21.1.74 --security-group $POINTS_SEC --availability-zone gcicompute08  roulette-1
openstack server create --wait  --flavor windows --boot-from-volume 50 --image $WINDOWS --key-name $GRAY_SSH --nic net-id=$TEAM2_NIC,v4-fixed-ip=10.21.2.74 --security-group $POINTS_SEC --availability-zone gcicompute08  roulette-2
