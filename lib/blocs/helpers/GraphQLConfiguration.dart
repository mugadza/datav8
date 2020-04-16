import 'package:graphql/client.dart';

class GraphQLConfiguration{
  final HttpLink _httpLink;
  static final apiUrl = "http://upsitec.club/safesens/graphql/";

  GraphQLClient _client;

  GraphQLConfiguration() 
    : _httpLink = HttpLink(uri: GraphQLConfiguration.apiUrl);

  GraphQLClient getGraphQLClient(){
    _client ??= GraphQLClient(
      link: _httpLink,
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    );
    return _client;
  }

  void updateClientHeader(HttpLink httpLink){
    _client = GraphQLClient(
      link: httpLink,
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    );
  }
}