// Clase que representa una noticia con su ID, título, imagen, URL y fecha
class New {
  // ID único de la noticia
  String id;

  // Título de la noticia
  String title;

  // URL de la imagen relacionada con la noticia
  String img;

  // URL de la noticia
  String url;

  // Fecha de publicación de la noticia
  String date;

  // Constructor de la clase que requiere todos los parámetros para crear una instancia
  New({
    required this.id,
    required this.title,
    required this.img,
    required this.url,
    required this.date,
  });

  // Método de fábrica para crear una instancia de New desde un mapa JSON
  factory New.fromJson(Map<String, dynamic> json) => New(
    id: json["id"],  // Asigna el valor de 'id' desde el JSON
    title: json["title"],  // Asigna el valor de 'title' desde el JSON
    img: json["img"],  // Asigna el valor de 'img' desde el JSON
    url: json["url"],  // Asigna el valor de 'url' desde el JSON
    date: json["date"],  // Asigna el valor de 'date' desde el JSON
  );

  // Método para convertir la instancia de New en un mapa JSON
  Map<String, dynamic> toJson() => {
    "id": id,  // Devuelve el valor de 'id'
    "title": title,  // Devuelve el valor de 'title'
    "img": img,  // Devuelve el valor de 'img'
    "url": url,  // Devuelve el valor de 'url'
    "date": date,  // Devuelve el valor de 'date'
  };
}
