// Clase que representa un video en el sistema
class Video {
  // Identificador único del video
  int id;

  // Título del video
  String titulo;

  // URL del video
  String url;

  // Fecha de publicación del video
  DateTime fechaPublicacion;

  // Constructor de la clase Video, con todos los campos requeridos
  Video({
    required this.id,
    required this.titulo,
    required this.url,
    required this.fechaPublicacion,
  });

  // Método de fábrica para crear una instancia de Video a partir de un mapa JSON
  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],  // Asigna el valor de 'id' desde el JSON
        titulo: json["titulo"],  // Asigna el valor de 'titulo' desde el JSON
        url: json["url"],  // Asigna el valor de 'url' desde el JSON
        fechaPublicacion: DateTime.parse(json["fechaPublicacion"]),  // Convierte la fecha desde el formato ISO 8601
      );

  // Método para convertir la instancia de Video en un mapa JSON
  Map<String, dynamic> toJson() => {
        "id": id,  // Devuelve el valor de 'id'
        "titulo": titulo,  // Devuelve el valor de 'titulo'
        "url": url,  // Devuelve el valor de 'url'
        "fechaPublicacion": fechaPublicacion.toIso8601String(),  // Convierte la fecha a formato ISO 8601
      };
}
