import 'package:dart_graphql/fetch/client.dart';
import 'package:datav8/blocs/graphql/graphql.dart';
import 'package:datav8/blocs/helpers/GraphQLConfiguration.dart';
import 'package:datav8/blocs/models/home/GetHomeDataOperationResult.dart';
import 'package:flutter/material.dart';

class ApplicationRepository {
  final GraphQLConfiguration _graphQLConfiguration;

  ApplicationRepository({@required graphQLConfiguration})
      : _graphQLConfiguration = graphQLConfiguration;

  Future<GetHomeDataOperationResult> getHomeData() async {
    const String imei = "8868926026201686";
    const int eventCount = 50;

    Map<String, String> header = {
      "Content-Type": "application/json"
    };

    GraphqlResponse<GetHomeDataOperationResult> result = await _graphQLConfiguration.client.query(HomeDataQueries.getHomeData(nEventCount: eventCount, nIMEI: imei), header);
    
    if(result.hasError()){
      throw Exception("Error: ${result.errors.toString()}");
    }
    
    return result.data;
  }
}