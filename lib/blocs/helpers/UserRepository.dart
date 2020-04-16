import 'package:datav8/blocs/graphql/graphql.dart';
import 'package:datav8/blocs/helpers/GraphQLConfiguration.dart';
import 'package:datav8/blocs/models/models.dart';
import 'package:graphql/client.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final GraphQLConfiguration _graphQLConfiguration;
  
  UserRepository({@required GraphQLConfiguration graphQLConfiguration})
    : _graphQLConfiguration = graphQLConfiguration;

  Future<AuthenticationResult> authenticate({@required String email, @required String password}) async {
    MutationOptions _options = MutationOptions(
      documentNode: gql(AuthenticationMutation.emailPasswordAuthenticationMutation(email, password))
    );
    QueryResult result = await _graphQLConfiguration.getGraphQLClient().mutate(_options);

    GraphQLResponse<AuthenticationResult> graphQLResponse = GraphQLResponse(AuthenticationResult.fromMap, (result.data != null) ? result.data.data : null);

    if(result.hasException){
      throw Exception("Error: ${result.exception.toString()}");
    }

    return graphQLResponse.data;
  }

  Future<void> deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("jwtToken");
  }

  Future<void> persistToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("jwtToken", token);
    
    _graphQLConfiguration.updateClientHeader(
      HttpLink(
        uri: "http://upsitec.club/safesens/graphql/",
        headers: <String, String>{
          "Content-Type": "application/json",
          "Authorization": "JWT $token"
        }
      )
    );
  }

  Future<bool> hasToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool tokenFound = true;

    if (!prefs.containsKey("jwtToken")){
      tokenFound = false;
    }
    else{
      String token = prefs.getString("jwtToken");
      _graphQLConfiguration.updateClientHeader(
        HttpLink(
          uri: "http://upsitec.club/safesens/graphql/",
          headers: <String, String>{
            "Content-Type": "application/json",
            "Authorization": "JWT $token"
          }
        )
      );
    }

    return tokenFound;
  }
}
