class AuthenticationMutation {
  static  String emailPasswordAuthenticationMutation(String email, String password){
    return """
      mutation UserAuthentication{
        tokenCreate(input:{
          email: "$email", password: "$password"
        })
        {
          token
          user{
            id
            homeDeviceImei
            email
            firstName
            lastName
            role
            avatar{
              url
            }
            userSet(first: 10){
              edges{
                cursor
                node{
                  id
                  email
                  firstName
                  lastName
                  role
                  avatar{
                    url
                  }
                }
              }
              pageInfo{
                hasNextPage
                hasPreviousPage
                startCursor
                endCursor
              }
            }
            devices(first: 10){
              edges{
                cursor 
                node{
                  id
                  imei
                  ch1On
                  ch2On
                  ch3On
                  ch4On
                  ch5On
                  alertStateCh1
                  alertStateCh2
                  alertStateCh3
                  alertStateCh4
                  alertStateCh5
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
          accountErrors{
            field
            message
            code
          }
        }
      }
    """;
  }
}
