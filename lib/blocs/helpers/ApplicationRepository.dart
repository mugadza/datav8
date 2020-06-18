import 'package:datav8/blocs/graphql/graphql.dart';
import 'package:datav8/blocs/graphql/queries/DeviceDataQueries.graphql.dart';
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
    const int eventCount = 50;

    QueryOptions _options = QueryOptions(
      documentNode: gql(HomeDataQueries.getHomeData(nEventCount: eventCount)),
      variables: <String, dynamic>{
        "nEventCount": eventCount
      }
    );

    QueryResult result = await _graphQLConfiguration.getGraphQLClient().query(_options);
    GraphQLResponse<GetHomeDataOperationResult> homeResults = GraphQLResponse<GetHomeDataOperationResult>(GetHomeDataOperationResult.fromMap, (result.data != null) ? result.data.data : null);

    if(result.hasException){
      throw Exception("Error: ${result.exception.toString()}");
    }
    
    return homeResults.data;
  }

  Future<GetDeviceDataOperationResult> getAllUserDevicesData() async {
    const int eventCount = 50;
    const int deviceCount = 10;

    QueryOptions _options = QueryOptions(
      documentNode: gql(DeviceDataQueries.getAllUserDevices(nEventCount: eventCount, nDeviceCount: deviceCount)),
      variables: <String, dynamic>{
        "nEventCount": eventCount,
        "nDeviceCount": deviceCount
      }
    );

    QueryResult result = await _graphQLConfiguration.getGraphQLClient().query(_options);
    GraphQLResponse<GetDeviceDataOperationResult> deviceTabResults = GraphQLResponse<GetDeviceDataOperationResult>(GetDeviceDataOperationResult.fromMap, (result.data != null) ? result.data.data : null);
 
    if(result.hasException){
      throw Exception("Error: ${result.exception.toString()}");
    }
    
    return deviceTabResults.data;
  }

  Future<GetInitialApplicationDataResult> getInitialApplicationData() async {
    const int eventCount = 50;
    const int deviceCount = 10;
    const int userCount = 10;

    QueryOptions _options = QueryOptions(
      documentNode: gql(ApplicationQueries.getApplicationInitialData(nUserCount: userCount, nEventCount: eventCount, nDeviceCount: deviceCount)),
      variables: <String, dynamic>{
        "nUserCount": userCount,
        "nDeviceCount": deviceCount,
        "nEventCount": eventCount
      }
    );

    QueryResult result = await _graphQLConfiguration.getGraphQLClient().query(_options);
    GraphQLResponse<GetInitialApplicationDataResult> deviceTabResults = GraphQLResponse<GetInitialApplicationDataResult>(GetInitialApplicationDataResult.fromMap, (result.data != null) ? result.data.data : null);
 
    if(result.hasException){
      throw Exception("Error: ${result.exception.toString()}");
    }
    
    return deviceTabResults.data;
  }
}