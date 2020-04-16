class AuthenticationMutation {
  static  String emailPasswordAuthenticationMutation(String email, String password){
    return """
      mutation UserAuthentication{
        tokenAuth(email: "$email", password: "$password"){
          token
        }
      }
    """;
  }
}
