
class ApplicationQueries {
  static String getApplicationInitialData({int nUserCount, int nDeviceCount, int nEventCount}) {
    return r'''
      query ApplicationInitialData($nUserCount: Int, $nDeviceCount: Int, $nEventCount: Int) {
        me{
          id
          lastName
          firstName
          role
          email
          userSet(first: $nUserCount){
            edges{
              node{
                id
                lastName
                firstName
                role
                email
                avatar{
                  url
                  alt
                }
              }
            }
          }
          avatar{
            url
            alt
          }
          devices(first: $nDeviceCount){
            edges{
              node{
                id
                imei
                unitName
                unitAdminName
                unitAdminPhoneNumber
                ch1On
                ch2On
                ch3On
                ch4On
                ch5On
                ch1Name
                ch2Name
                ch3Name
                ch4Name
                ch5Name
                upperThresholdCh1
                upperThresholdCh2
                upperThresholdCh3
                upperThresholdCh4
                upperThresholdCh5
                lowerThresholdCh1
                lowerThresholdCh2
                lowerThresholdCh3
                lowerThresholdCh4
                lowerThresholdCh5
                monitoringActiveCh1
                monitoringActiveCh2
                monitoringActiveCh3
                monitoringActiveCh4
                monitoringActiveCh5
                alertStateCh1
                alertStateCh2
                alertStateCh3
                alertStateCh4
                alertStateCh5
                ch1MasksAlerts
                ch2MasksAlerts
                ch3MasksAlerts
                ch4MasksAlerts
                ch5MasksAlerts
                unitsCh1
                unitsCh2
                unitsCh3
                unitsCh4
                unitsCh5
                zeroOffsetCh1
                zeroOffsetCh2
                zeroOffsetCh3
                zeroOffsetCh4
                zeroOffsetCh5
                scaleFactorCh1
                scaleFactorCh2
                scaleFactorCh3
                scaleFactorCh4
                scaleFactorCh5
                ch1SensorType
                ch2SensorType
                ch3SensorType
                ch4SensorType
                ch5SensorType
                eventSet(first: $nEventCount){
                  edges{
                    node{
                      ch1
                      ch2
                      ch3
                      ch4
                      ch5
                      deviceTimeDate
                    }
                  }
                  pageInfo{
                    hasNextPage
                    hasPreviousPage
                    startCursor
                    endCursor
                  }
                }
              }
            }
          }
          homeDevice{
            id
            imei
            ch1On
            ch2On
            ch3On
            ch4On
            ch5On
            unitName
            unitAdminName
            unitAdminPhoneNumber
            ch1Name
            ch2Name
            ch3Name
            ch4Name
            ch5Name
            upperThresholdCh1
            upperThresholdCh2
            upperThresholdCh3
            upperThresholdCh4
            upperThresholdCh5
            lowerThresholdCh1
            lowerThresholdCh2
            lowerThresholdCh3
            lowerThresholdCh4
            lowerThresholdCh5
            monitoringActiveCh1
            monitoringActiveCh2
            monitoringActiveCh3
            monitoringActiveCh4
            monitoringActiveCh5
            alertStateCh1
            alertStateCh2
            alertStateCh3
            alertStateCh4
            alertStateCh5
            ch1MasksAlerts
            ch2MasksAlerts
            ch3MasksAlerts
            ch4MasksAlerts
            ch5MasksAlerts
            unitsCh1
            unitsCh2
            unitsCh3
            unitsCh4
            unitsCh5
            zeroOffsetCh1
            zeroOffsetCh2
            zeroOffsetCh3
            zeroOffsetCh4
            zeroOffsetCh5
            scaleFactorCh1
            scaleFactorCh2
            scaleFactorCh3
            scaleFactorCh4
            scaleFactorCh5
            ch1SensorType
            ch2SensorType
            ch3SensorType
            ch4SensorType
            ch5SensorType
            eventSet(first: $nEventCount){
              edges{
                node{
                  ch1
                  ch2
                  ch3
                  ch4
                  ch5
                  deviceTimeDate
                }
              }
              pageInfo{
                hasNextPage
                hasPreviousPage
                startCursor
                endCursor
              }
            }
          }
        }
      }
    ''';
  }
}

