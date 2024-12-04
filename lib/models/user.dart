// Clase que representa a un usuario en el sistema
class User {
  // Identificador único del usuario (opcional)
  final int? id;

  // Nombre del usuario (opcional)
  final String? name;

  // Apellido del usuario (opcional)
  final String? lastname;

  // Correo electrónico del usuario (opcional)
  final String? email;

  // Nombre de usuario (obligatorio)
  final String username;

  // Contraseña del usuario (obligatorio)
  final String password;

  // Token de autenticación del usuario (obligatorio)
  final String authToken;

  // Constructor de la clase User, con parámetros opcionales y obligatorios
  User({
    this.id, 
    this.name, 
    this.lastname, 
    this.email, 
    required this.username, 
    required this.password, 
    required this.authToken
  });

  // Método de fábrica para crear una instancia de User a partir de un mapa JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],  // Asigna el valor de 'id' desde el JSON
      name: json['nombre'],  // Asigna el valor de 'nombre' desde el JSON
      lastname: json['apellido'],  // Asigna el valor de 'apellido' desde el JSON
      email: json['email'],  // Asigna el valor de 'email' desde el JSON
      username: json['username'],  // Asigna el valor de 'username' desde el JSON
      password: json['password'],  // Asigna el valor de 'password' desde el JSON
      authToken: json['authToken'],  // Asigna el valor de 'authToken' desde el JSON
    );
  }

  // Método para convertir la instancia de User en un mapa JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,  // Devuelve el valor de 'id'
      'name': name,  // Devuelve el valor de 'name'
      'lastname': lastname,  // Devuelve el valor de 'lastname'
      'email': email,  // Devuelve el valor de 'email'
      'username': username,  // Devuelve el valor de 'username'
      'password': password,  // Devuelve el valor de 'password'
      'authToken': authToken,  // Devuelve el valor de 'authToken'
    };
  }
}
