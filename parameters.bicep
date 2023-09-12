param frname string
param location string = 'uksouth'
param dynamicthrottling bool = true
param capacity int = 0

param

resource recognizer 'Microsoft.CognitiveServices/accounts@2022-12-01' = {
  // 'biceplearncogservice' is name
  name: frname
  location:location
  sku:{
    name:'S0'
    capacity: capacity
  }
  kind:'FormRecognizer'
  properties:{
    dynamicThrottlingEnabled: dynamicthrottling
  }
  tags:{ owner: 'tony'
  environment: 'testing'
 }
}
