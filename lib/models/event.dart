// Clase que representa un evento con su título, descripción, fecha, lugar y coordenadas.
class Event {
  // ID único del evento
  int id;

  // Título del evento
  String titulo;

  // Descripción detallada del evento
  String descripcion;

  // Fecha en la que se llevará a cabo el evento
  DateTime fechaEvento;

  // Lugar donde se realizará el evento
  String lugar;

  // Coordenadas geográficas del evento ( latitud y longitud)
  String coordenadas;

  // Constructor de la clase que requiere todos los parámetros para crear una instancia
  Event({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.fechaEvento,
    required this.lugar,
    required this.coordenadas,
  });

  // Método de fábrica para crear una instancia de Event desde un mapa JSON
  factory Event.fromJson(Map<String, dynamic> json) => Event(
    id: json["id"],  // Asigna el valor de 'id' desde el JSON
    titulo: json["titulo"],  // Asigna el valor de 'titulo' desde el JSON
    descripcion: json["descripcion"],  // Asigna el valor de 'descripcion' desde el JSON
    fechaEvento: DateTime.parse(json["fechaEvento"]),  // Convierte el valor de 'fechaEvento' a un objeto DateTime
    lugar: json["lugar"],  // Asigna el valor de 'lugar' desde el JSON
    coordenadas: json["coordenadas"],  // Asigna el valor de 'coordenadas' desde el JSON
  );

  // Método para convertir la instancia de Event en un mapa JSON
  Map<String, dynamic> toJson() => {
    "id": id,  // Devuelve el valor de 'id'
    "titulo": titulo,  // Devuelve el valor de 'titulo'
    "descripcion": descripcion,  // Devuelve el valor de 'descripcion'
    "fechaEvento": fechaEvento.toIso8601String(),  // Convierte 'fechaEvento' a formato ISO 8601
    "lugar": lugar,  // Devuelve el valor de 'lugar'
    "coordenadas": coordenadas,  // Devuelve el valor de 'coordenadas'
  };
}
