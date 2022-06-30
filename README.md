# AWS-TKG
TKG Infra and TKG build test

The purpose of this is to test in a personal lab on how TKG functions in the public cloud to possibly translate that to a airgapped cloud environment
with some slight alterations


After copying down you will need to run terraform init in each cluster directory.

Make sure terraform and VMware TKG/Tanzu cli is on box
Copy git repo
Run terraform init in both directories
Run terraform plan in each directory to make sure no errors
Run terraform apply when ready to build infrastructre
In ManagementCluster directory run tanzu mc create -file <path to file> (in this case mc-config-tkg.yaml)
...Currently working out an issue at this step
