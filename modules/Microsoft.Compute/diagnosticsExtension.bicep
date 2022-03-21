
param location string = resourceGroup().location
param tags object
param vmName string
param diagnosticsStorageAccountName string
param monitoringResourceGroupName string

resource vm 'Microsoft.Compute/virtualMachines@2021-04-01' existing = {
  name: vmName
}

resource diagnosticsStorageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' existing = {
  name: diagnosticsStorageAccountName
  scope: resourceGroup(monitoringResourceGroupName)
}

resource diagnosticsExtension 'Microsoft.Compute/virtualMachines/extensions@2021-07-01' = {
  parent: vm
  name: 'Microsoft.Insights.VMDiagnosticsSettings'
  location: location
  tags: tags
  properties: {
    publisher: 'Microsoft.Azure.Diagnostics'
    type: 'IaaSDiagnostics'
    typeHandlerVersion: '1.5'
    autoUpgradeMinorVersion: true
    settings: {
      StorageAccount: diagnosticsStorageAccountName
      WadCfg: {
        DiagnosticMonitorConfiguration: {
          overallQuotaInMB: 5120
          Metrics: {
            resourceId: vm.id
            MetricAggregation: [
              {
                scheduledTransferPeriod: 'PT1H'
              }
              {
                scheduledTransferPeriod: 'PT1M'
              }
            ]
          }
          DiagnosticInfrastructureLogs: {
            scheduledTransferLogLevelFilter: 'Error'
          }
          PerformanceCounters: {
            scheduledTransferPeriod: 'PT1M'
            PerformanceCounterConfiguration: [
              {
                counterSpecifier: '\\Processor Information(_Total)\\% Processor Time'
                unit: 'Percent'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\Processor Information(_Total)\\% Privileged Time'
                unit: 'Percent'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\Processor Information(_Total)\\% User Time'
                unit: 'Percent'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\Processor Information(_Total)\\Processor Frequency'
                unit: 'Count'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\System\\Processes'
                unit: 'Count'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\Process(_Total)\\Thread Count'
                unit: 'Count'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\Process(_Total)\\Handle Count'
                unit: 'Count'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\System\\System Up Time'
                unit: 'Count'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\System\\Context Switches/sec'
                unit: 'CountPerSecond'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\System\\Processor Queue Length'
                unit: 'Count'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\Memory\\% Committed Bytes In Use'
                unit: 'Percent'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\Memory\\Available Bytes'
                unit: 'Bytes'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\Memory\\Committed Bytes'
                unit: 'Bytes'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\Memory\\Cache Bytes'
                unit: 'Bytes'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\Memory\\Pool Paged Bytes'
                unit: 'Bytes'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\Memory\\Pool Nonpaged Bytes'
                unit: 'Bytes'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\Memory\\Pages/sec'
                unit: 'CountPerSecond'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\Memory\\Page Faults/sec'
                unit: 'CountPerSecond'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\Process(_Total)\\Working Set'
                unit: 'Count'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\Process(_Total)\\Working Set - Private'
                unit: 'Count'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\LogicalDisk(_Total)\\% Disk Time'
                unit: 'Percent'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\LogicalDisk(_Total)\\% Disk Read Time'
                unit: 'Percent'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\LogicalDisk(_Total)\\% Disk Write Time'
                unit: 'Percent'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\LogicalDisk(_Total)\\% Idle Time'
                unit: 'Percent'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\LogicalDisk(_Total)\\Disk Bytes/sec'
                unit: 'BytesPerSecond'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\LogicalDisk(_Total)\\Disk Read Bytes/sec'
                unit: 'BytesPerSecond'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\LogicalDisk(_Total)\\Disk Write Bytes/sec'
                unit: 'BytesPerSecond'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\LogicalDisk(_Total)\\Disk Transfers/sec'
                unit: 'BytesPerSecond'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\LogicalDisk(_Total)\\Disk Reads/sec'
                unit: 'BytesPerSecond'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\LogicalDisk(_Total)\\Disk Writes/sec'
                unit: 'BytesPerSecond'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\LogicalDisk(_Total)\\Avg. Disk sec/Transfer'
                unit: 'Count'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\LogicalDisk(_Total)\\Avg. Disk sec/Read'
                unit: 'Count'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\LogicalDisk(_Total)\\Avg. Disk sec/Write'
                unit: 'Count'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\LogicalDisk(_Total)\\Avg. Disk Queue Length'
                unit: 'Count'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\LogicalDisk(_Total)\\Avg. Disk Read Queue Length'
                unit: 'Count'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\LogicalDisk(_Total)\\Avg. Disk Write Queue Length'
                unit: 'Count'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\LogicalDisk(_Total)\\% Free Space'
                unit: 'Percent'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\LogicalDisk(_Total)\\Free Megabytes'
                unit: 'Count'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\Network Interface(*)\\Bytes Total/sec'
                unit: 'BytesPerSecond'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\Network Interface(*)\\Bytes Sent/sec'
                unit: 'BytesPerSecond'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\Network Interface(*)\\Bytes Received/sec'
                unit: 'BytesPerSecond'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\Network Interface(*)\\Packets/sec'
                unit: 'BytesPerSecond'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\Network Interface(*)\\Packets Sent/sec'
                unit: 'BytesPerSecond'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\Network Interface(*)\\Packets Received/sec'
                unit: 'BytesPerSecond'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\Network Interface(*)\\Packets Outbound Errors'
                unit: 'Count'
                sampleRate: 'PT60S'
              }
              {
                counterSpecifier: '\\Network Interface(*)\\Packets Received Errors'
                unit: 'Count'
                sampleRate: 'PT60S'
              }
            ]
          }
          WindowsEventLog: {
            scheduledTransferPeriod: 'PT1M'
            DataSource: [
              {
                name: 'Application!*[System[(Level = 1 or Level = 2 or Level = 3)]]'
              }
              {
                name: 'Security!*[System[band(Keywords,4503599627370496)]]'
              }
              {
                name: 'System!*[System[(Level = 1 or Level = 2 or Level = 3)]]'
              }
            ]
          }
          Directories: {
            scheduledTransferPeriod: 'PT1M'
          }
        }
      }
    }
    protectedSettings: {
      storageAccountName: diagnosticsStorageAccountName
      storageAccountKey: first(listKeys(diagnosticsStorageAccount.id, '2019-04-01').keys).value
      storageAccountEndPoint: 'https://${environment().suffixes.storage}/'
    }
  }
}
