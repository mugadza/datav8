
class HomeDataQueries {
  static String getHomeData({String nIMEI, int nEventCount}) {
    return r'''
      query HomeDeviceInfo($nIMEI: String, $nEventCount: Int) {
        userDevices(first: 1, imei: $nIMEI){
          edges{
            cursor
            node{
              imei
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
      }
    ''';
  }
}
