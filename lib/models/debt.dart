// Clase que representa una deuda de un usuario.
class Debt {
  // ID único de la deuda
  int id;

  // ID del usuario asociado con la deuda
  int usuarioId;

  // Monto de la deuda
  double monto;

  // Estado de la deuda (si ha sido pagada o no)
  bool pagada;

  // Fecha de la última actualización de la deuda
  DateTime fechaActualizacion;

  // Constructor de la clase que requiere todos los parámetros para crear una instancia
  Debt({
    required this.id,
    required this.usuarioId,
    required this.monto,
    required this.pagada,
    required this.fechaActualizacion,
  });

  // Método de fábrica para crear una instancia de Debt desde un mapa JSON
  factory Debt.fromJson(Map<String, dynamic> json) => Debt(
    id: json["id"],  // Asigna el valor de 'id' desde el JSON
    usuarioId: json["usuarioId"],  // Asigna el valor de 'usuarioId' desde el JSON
    monto: json["monto"],  // Asigna el valor de 'monto' desde el JSON
    pagada: json["pagada"],  // Asigna el valor de 'pagada' desde el JSON
    fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),  // Convierte el valor de 'fechaActualizacion' a un objeto DateTime
  );

  // Método para convertir la instancia de Debt en un mapa JSON
  Map<String, dynamic> toJson() => {
    "id": id,  // Devuelve el valor de 'id'
    "usuarioId": usuarioId,  // Devuelve el valor de 'usuarioId'
    "monto": monto,  // Devuelve el valor de 'monto'
    "pagada": pagada,  // Devuelve el valor de 'pagada'
    "fechaActualizacion": fechaActualizacion.toIso8601String(),  // Convierte 'fechaActualizacion' a formato ISO 8601
  };
}
