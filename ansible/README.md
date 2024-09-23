# Gray Team Infra

gray_infra.sh - Deploys the VMs required to run the main backend infrastructure (ansible, scoring, beats)

deployscoring.yml - Deploys the scoring VMs and configures security groups

ANSIBLE ROLES:
    docker - installs docker on the host
    scoring - deploys the main scoring stack docker image ( in progress )
    beat - deploys dynamicbeat to support scoring ( in progress )

ansible-cloud.yaml - cloud-init config to have ansible have all necessary packages preinstalled and automatically clones the gray team ansible deployment repo (ansible repo cloning in progress)


When running this script on a new host remember to run `ansible-galaxy install -r requirements.yml` to download the required galaxy roles and collections.

# Using

Deploy VMs using gray_infra.sh
Update inventory.ini with the Infra IPs created after running gray_infra.sh 
Run playbook with `ansible-playbook deployscoring.yml -i inventory.ini`
    NOTE: Playbook often times errors out the first time while adding docker repo, it will work the 2nd time, unsure why this is.

