import 'package:dart_graphql/fetch/client.dart';

class GraphQLConfiguration{
  final GraphqlClient _client = GraphqlClient('http://upsitec.club/safesens/graphql/');

  GraphqlClient get client => _client;
}