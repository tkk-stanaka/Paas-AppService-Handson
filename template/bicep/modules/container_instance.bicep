param conainerName string 
param containerImage string 

param vnetName string
param subnetName string 

param location string

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2024-01-01'existing = {
  name: vnetName
}

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2024-01-01' existing = {
  name: subnetName
  parent: virtualNetwork
}

resource containerGroup 'Microsoft.ContainerInstance/containerGroups@2023-05-01' = {
  name: conainerName
  location: location
  properties: {
    containers: [
      {
        name: conainerName
        properties: {
          
          image: containerImage
          ports: [
            {
              port: 1521
              protocol: 'TCP'
            }
            {
              port: 5500
              protocol: 'TCP'
            }
          ]
          environmentVariables:[
            {
              name: 'ORACLE_PWD'
              value: 'password'
            }
          ]
          resources: {
            requests: {
              cpu: 2
              memoryInGB: 4
            }
          }
        }
      }
    ]
    osType: 'Linux'
    restartPolicy: 'Never'
    ipAddress: {
      ports: [
        {
          port: 1521
          protocol: 'TCP'
        }
        {
          port: 5500
          protocol: 'TCP'
        }
      ]
      type: 'Private'
    }
    subnetIds: [
      {
        id: subnet.id
      }
    ]
  }
}
