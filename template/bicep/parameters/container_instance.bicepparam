using '../modules/container_instance.bicep'

param conainerName = 'oracleextest'

param containerImage = 'container-registry.oracle.com/database/express:latest'

param vnetName = 'vnet-mcwfy25q2g3110-spoke'

param subnetName = 'subnet-2'

param location = 'westus'
