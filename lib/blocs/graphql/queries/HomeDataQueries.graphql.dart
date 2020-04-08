import 'package:dart_graphql/dart_graphql.dart';
import 'package:datav8/blocs/models/home/GetHomeDataOperationResult.dart';

class HomeDataQueries {
  static GraphqlQuery<GetHomeDataOperationResult> getHomeData({String nIMEI, int nEventCount}) {
    const query = """
      query HomeDeviceInfo(\$nIMEI: String, \$nEventCount: Int) {
        allDevices(imei: \$nIMEI){
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
              eventSet(first: \$nEventCount){
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
    """;
    return GraphqlQuery(query, <String, dynamic>{"nIMEI": nIMEI, "nEventCount": nEventCount}, GetHomeDataOperationResult.fromMap);
  }
}
