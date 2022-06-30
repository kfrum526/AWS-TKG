# AWS-TKG
TKG Infra and TKG build test

The purpose of this is to test in a personal lab on how TKG functions in the public cloud to possibly translate that to a airgapped cloud environment
with some slight alterations


After copying down you will need to run terraform init in each cluster directory.

1. Make sure terraform and VMware TKG/Tanzu cli is on box
2. Copy git repo
3. Run terraform init in both directories
4. Run terraform plan in each directory to make sure no errors
5. Run terraform apply when ready to build infrastructre
6. In ManagementCluster directory run tanzu mc create -file <path to file> (in this case mc-config-tkg.yaml)
7....Currently working out an issue at this step
