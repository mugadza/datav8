import 'package:datav8/blocs/graphql/graphql.dart';
import 'package:datav8/blocs/helpers/GraphQLConfiguration.dart';
import 'package:datav8/blocs/models/home/GetHomeDataOperationResult.dart';
import 'package:datav8/blocs/models/models.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

class ApplicationRepository {
  final GraphQLConfiguration _graphQLConfiguration;

  ApplicationRepository({@required graphQLConfiguration})
      : _graphQLConfiguration = graphQLConfiguration;

  Future<GetHomeDataOperationResult> getHomeData() async {
    const String imei = "8868926026201686";
    const int eventCount = 10;

    QueryOptions _options = QueryOptions(
      documentNode: gql(HomeDataQueries.getHomeData(nEventCount: eventCount, nIMEI: imei)),
      variables: <String, dynamic>{
        "nEventCount": eventCount,
        "nIMEI": imei
      }
    );

    QueryResult result = await _graphQLConfiguration.getGraphQLClient().query(_options);
    GraphQLResponse<GetHomeDataOperationResult> homeResults = GraphQLResponse<GetHomeDataOperationResult>(GetHomeDataOperationResult.fromMap, (result.data != null) ? result.data.data : null);

    if(result.hasException){
      throw Exception("Error: ${result.exception.toString()}");
    }
    
    return homeResults.data;
  }
}