class User{
  final int? id;
  final String? name;
  final String? lastname;
  final String? email;
  final String username;
  final String password;
  final String authToken;

  User({
    this.id, 
    this.name, 
    this.lastname, 
    this.email, 
    required this.username, 
    required this.password, 
    required this.authToken
    }
  );

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json['id'], 
      name: json['nombre'], 
      lastname: json['apellido'], 
      email: json['email'], 
      username: json['username'], 
      password: json['password'], 
      authToken: json['authToken']
      );
  }

  Map<String, dynamic> toJson(){
    return{
      'id' : id,
      'name' : name,
      'lastname' : lastname,
      'email' : email,
      'username' : username,
      'password' : password,
      'authToken' : authToken,
    };
  }

}