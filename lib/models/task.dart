// Clase que representa una tarea dentro del sistema
class Task {
  // Identificador único de la tarea
  int id;

  // Identificador del usuario que crea la tarea
  int usuarioId;

  // Título de la tarea
  String titulo;

  // Descripción detallada de la tarea
  String descripcion;

  // Fecha de vencimiento de la tarea
  DateTime fechaVencimiento;

  // Indica si la tarea ha sido completada
  bool completada;

  // Constructor que inicializa los valores de la tarea
  Task({
    required this.id,
    required this.usuarioId,
    required this.titulo,
    required this.descripcion,
    required this.fechaVencimiento,
    required this.completada,
  });

  // Método de fábrica para crear una instancia de Task a partir de un JSON
  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json["id"],  // Asigna el valor de 'id' desde el JSON
    usuarioId: json["usuarioId"],  // Asigna el valor de 'usuarioId' desde el JSON
    titulo: json["titulo"],  // Asigna el valor de 'titulo' desde el JSON
    descripcion: json["descripcion"],  // Asigna el valor de 'descripcion' desde el JSON
    fechaVencimiento: DateTime.parse(json["fechaVencimiento"]),  // Convierte el valor de 'fechaVencimiento' en un objeto DateTime
    completada: json["completada"],  // Asigna el valor de 'completada' desde el JSON
  );

  // Método para convertir la instancia de Task en un mapa JSON
  Map<String, dynamic> toJson() => {
    "id": id,  // Devuelve el valor de 'id'
    "usuarioId": usuarioId,  // Devuelve el valor de 'usuarioId'
    "titulo": titulo,  // Devuelve el valor de 'titulo'
    "descripcion": descripcion,  // Devuelve el valor de 'descripcion'
    "fechaVencimiento": fechaVencimiento.toIso8601String(),  // Convierte la fecha de vencimiento a una cadena ISO8601
    "completada": completada,  // Devuelve el valor de 'completada'
  };
}
