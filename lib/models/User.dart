class User {

  final String email;
  final String name;
  final String accessToken;
  final String tokenType;

  User({this.email, this.name, this.accessToken, this.tokenType});

  /*factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      name: json['name'],
      accessToken: json['access_token'],
      tokenType: json['token_type'],
    );
  }*/


  User.fromJson(Map<String, dynamic> json)

  // named constructor
    : email = json['email'],
      name =  json['name'],
      accessToken = json['access_token'],
      tokenType = json['token_type'];

  // method
    Map<String, dynamic> toJson() {
    return {
      'email' : email,
      'name' : name,
      'access_token' : accessToken,
      'token_type' : tokenType,
      };

    }

  }