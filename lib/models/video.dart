
class Video {
    int id;
    String titulo;
    String url;
    DateTime fechaPublicacion;

    Video({
        required this.id,
        required this.titulo,
        required this.url,
        required this.fechaPublicacion,
    });

    factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        titulo: json["titulo"],
        url: json["url"],
        fechaPublicacion: DateTime.parse(json["fechaPublicacion"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "url": url,
        "fechaPublicacion": fechaPublicacion.toIso8601String(),
    };
}