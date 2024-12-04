// Clase que representa una solicitud realizada por un usuario
class Request {
  // Identificador único de la solicitud
  int id;

  // Identificador del usuario que realiza la solicitud
  int usuarioId;

  // Tipo de solicitud (por ejemplo, "beca", "carta_estudio", etc.)
  String tipo;

  // Descripción detallada de la solicitud
  String descripcion;

  // Estado actual de la solicitud (por ejemplo, "pendiente", "resuelta")
  String estado;

  // Fecha en la que se realizó la solicitud
  DateTime fechaSolicitud;

  // Fecha en la que se dio respuesta a la solicitud, puede ser nula si no ha sido respondida
  DateTime? fechaRespuesta;

  // Respuesta dada a la solicitud, puede ser nula si no se ha respondido
  String? respuesta;

  // Constructor de la clase que requiere varios parámetros para crear una instancia
  Request({
    required this.id,
    required this.usuarioId,
    required this.tipo,
    required this.descripcion,
    required this.estado,
    required this.fechaSolicitud,
    this.fechaRespuesta,
    this.respuesta,
  });

  // Método de fábrica para crear una instancia de Request desde un mapa JSON
  factory Request.fromJson(Map<String, dynamic> json) => Request(
    id: json["id"],  // Asigna el valor de 'id' desde el JSON
    usuarioId: json["usuarioId"],  // Asigna el valor de 'usuarioId' desde el JSON
    tipo: json["tipo"],  // Asigna el valor de 'tipo' desde el JSON
    descripcion: json["descripcion"],  // Asigna el valor de 'descripcion' desde el JSON
    estado: json["estado"],  // Asigna el valor de 'estado' desde el JSON
    fechaSolicitud: DateTime.parse(json["fechaSolicitud"]),  // Convierte la cadena a DateTime para 'fechaSolicitud'
    fechaRespuesta: json["fechaRespuesta"] != null ? DateTime.parse(json["fechaRespuesta"]) : null,  // Convierte la cadena a DateTime solo si existe 'fechaRespuesta'
    respuesta: json["respuesta"],  // Asigna el valor de 'respuesta' desde el JSON
  );

  // Método para convertir la instancia de Request en un mapa JSON
  Map<String, dynamic> toJson() => {
    "id": id,  // Devuelve el valor de 'id'
    "usuarioId": usuarioId,  // Devuelve el valor de 'usuarioId'
    "tipo": tipo,  // Devuelve el valor de 'tipo'
    "descripcion": descripcion,  // Devuelve el valor de 'descripcion'
    "estado": estado,  // Devuelve el valor de 'estado'
    "fechaSolicitud": fechaSolicitud.toIso8601String(),  // Convierte la 'fechaSolicitud' a una cadena ISO 8601
    "fechaRespuesta": fechaRespuesta?.toIso8601String(),  // Convierte 'fechaRespuesta' a una cadena ISO 8601, si no es nula
    "respuesta": respuesta,  // Devuelve el valor de 'respuesta'
  };
}
