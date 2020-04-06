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
              eventSet(first: \$nEventCount){
                edges{
                  node{
                    ch1
                    ch2
                    ch3
                    ch4
                    ch5
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
