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
openstack server create --wait --flavor windows --boot-from-volume 100 --image $WINDOWS --key-name $GRAY_SSH --nic net-id=$POINTS_NIC,v4-fixed-ip=10.21.77.70 --nic net-id=$SSHJUMPNET --security-group $POINTS_SEC --availability-zone gcicompute07  windows-1
openstack server create --wait --flavor windows --boot-from-volume 100 --image $WINDOWS --key-name $GRAY_SSH --nic net-id=$POINTS_NIC,v4-fixed-ip=10.21.77.75 --nic net-id=$SSHJUMPNET --security-group $POINTS_SEC --availability-zone gcicompute07  windows-2
#deploy VM 2
openstack server create --wait --flavor $SIZE --boot-from-volume 100 --image $ROCKY --key-name $GRAY_SSH --nic net-id=$POINTS_NIC,v4-fixed-ip=10.21.77.71 --nic net-id=$SSHJUMPNET --security-group $POINTS_SEC --availability-zone gcicompute02  rocky-1
openstack server create --wait --flavor $SIZE --boot-from-volume 100 --image $ROCKY --key-name $GRAY_SSH --nic net-id=$POINTS_NIC,v4-fixed-ip=10.21.77.76 --nic net-id=$SSHJUMPNET --security-group $POINTS_SEC --availability-zone gcicompute02  rocky-2
#deploy VM 3
openstack server create --wait --flavor $SIZE --boot-from-volume 100 --image $DEBIAN --key-name $GRAY_SSH --nic net-id=$POINTS_NIC,v4-fixed-ip=10.21.77.72 --nic net-id=$SSHJUMPNET --security-group $POINTS_SEC --availability-zone gcicompute03  debian-1
openstack server create --wait --flavor $SIZE --boot-from-volume 100 --image $DEBIAN --key-name $GRAY_SSH --nic net-id=$POINTS_NIC,v4-fixed-ip=10.21.77.77 --nic net-id=$SSHJUMPNET --security-group $POINTS_SEC --availability-zone gcicompute03  debian-2
#deploy VM 4
openstack server create --wait --flavor $SIZE --boot-from-volume 100 --image $DEBIAN --key-name $GRAY_SSH --nic net-id=$POINTS_NIC,v4-fixed-ip=10.21.77.73 --nic net-id=$SSHJUMPNET --security-group $POINTS_SEC --availability-zone gcicompute03  debian-3
openstack server create --wait --flavor $SIZE --boot-from-volume 100 --image $DEBIAN --key-name $GRAY_SSH --nic net-id=$POINTS_NIC,v4-fixed-ip=10.21.77.78 --nic net-id=$SSHJUMPNET --security-group $POINTS_SEC --availability-zone gcicompute03  debian-4
#deploy VM 5
openstack server create --wait --flavor $SIZE --boot-from-volume 100 --image $ROCKY --key-name $GRAY_SSH --nic net-id=$POINTS_NIC,v4-fixed-ip=10.21.77.74 --nic net-id=$SSHJUMPNET --security-group $POINTS_SEC --availability-zone gcicompute03  rocky-3
openstack server create --wait --flavor $SIZE --boot-from-volume 100 --image $ROCKY --key-name $GRAY_SSH --nic net-id=$POINTS_NIC,v4-fixed-ip=10.21.77.79 --nic net-id=$SSHJUMPNET --security-group $POINTS_SEC --availability-zone gcicompute03  rocky-4

