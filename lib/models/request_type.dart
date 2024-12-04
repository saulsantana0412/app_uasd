// Clase que representa un tipo de solicitud con un código y una descripción
class RequestType {
  // Código que identifica el tipo de solicitud
  String codigo;

  // Descripción del tipo de solicitud
  String descripcion;

  // Constructor de la clase que requiere el código y la descripción para crear una instancia
  RequestType({
    required this.codigo,
    required this.descripcion,
  });

  // Método de fábrica para crear una instancia de RequestType desde un mapa JSON
  factory RequestType.fromJson(Map<String, dynamic> json) => RequestType(
    codigo: json["codigo"],  // Asigna el valor de 'codigo' desde el JSON
    descripcion: json["descripcion"],  // Asigna el valor de 'descripcion' desde el JSON
  );

  // Método para convertir la instancia de RequestType en un mapa JSON
  Map<String, dynamic> toJson() => {
    "codigo": codigo,  // Devuelve el valor de 'codigo'
    "descripcion": descripcion,  // Devuelve el valor de 'descripcion'
  };
}
