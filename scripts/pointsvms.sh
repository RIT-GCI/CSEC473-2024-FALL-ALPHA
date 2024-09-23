OPENSTACKENV=./cdt-alpha-openrc.sh
SIZE=large

DEBIAN=DebianBookworm12
ROCKY=RockyLinux86
WINDOWS=WinSrv2019-2024.7 

POINTS_SEC=points-sec

GRAY_SSH=pitboss
SSHJUMPNET=e721ed5e-fefc-48d9-ad0f-7b9022a81b56
POINTS_NIC=4536a602-cead-49fc-af1a-c8ff91c1646a

# add enviornment variables, authenticate to openstack
source $OPENSTACKENV


#deploy VM 1
openstack server create --flavor windows --boot-from-volume 25 --image $WINDOWS --key-name $GRAY_SSH --nic net-id=$POINTS_NIC,v4-fixed-ip=10.21.77.70 --security-group $POINTS_SEC --availability-zone gcicompute08  roulette-1
openstack server create --flavor windows --boot-from-volume 25 --image $WINDOWS --key-name $GRAY_SSH --nic net-id=$POINTS_NIC,v4-fixed-ip=10.21.77.75 --security-group $POINTS_SEC --availability-zone gcicompute08  roulette-2
#deploy VM 2
openstack server create --flavor $SIZE --boot-from-volume 25 --image $ROCKY --key-name $GRAY_SSH --nic net-id=$POINTS_NIC,v4-fixed-ip=10.21.77.71 --security-group $POINTS_SEC --availability-zone gcicompute02  blackjack-1
openstack server create --flavor $SIZE --boot-from-volume 25 --image $ROCKY --key-name $GRAY_SSH --nic net-id=$POINTS_NIC,v4-fixed-ip=10.21.77.76 --security-group $POINTS_SEC --availability-zone gcicompute02  blackjack-2
#deploy VM 3
openstack server create --flavor $SIZE --boot-from-volume 25 --image $DEBIAN --key-name $GRAY_SSH --nic net-id=$POINTS_NIC,v4-fixed-ip=10.21.77.72 --security-group $POINTS_SEC --availability-zone gcicompute03  poker-1
openstack server create --flavor $SIZE --boot-from-volume 25 --image $DEBIAN --key-name $GRAY_SSH --nic net-id=$POINTS_NIC,v4-fixed-ip=10.21.77.77 --security-group $POINTS_SEC --availability-zone gcicompute03  poker-2
#deploy VM 4
openstack server create --flavor $SIZE --boot-from-volume 25 --image $DEBIAN --key-name $GRAY_SSH --nic net-id=$POINTS_NIC,v4-fixed-ip=10.21.77.73 --security-group $POINTS_SEC --availability-zone gcicompute07  slots-1
openstack server create --flavor $SIZE --boot-from-volume 25 --image $DEBIAN --key-name $GRAY_SSH --nic net-id=$POINTS_NIC,v4-fixed-ip=10.21.77.78 --security-group $POINTS_SEC --availability-zone gcicompute07  slots-2
#deploy VM 5
openstack server create --flavor $SIZE --boot-from-volume 25 --image $ROCKY --key-name $GRAY_SSH --nic net-id=$POINTS_NIC,v4-fixed-ip=10.21.77.74 --security-group $POINTS_SEC --availability-zone gcicompute05  baccarat-1
openstack server create --flavor $SIZE --boot-from-volume 25 --image $ROCKY --key-name $GRAY_SSH --nic net-id=$POINTS_NIC,v4-fixed-ip=10.21.77.79 --security-group $POINTS_SEC --availability-zone gcicompute05  baccarat-2

