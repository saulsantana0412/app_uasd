class Event {
    int id;
    String titulo;
    String descripcion;
    DateTime fechaEvento;
    String lugar;
    String coordenadas;

    Event({
        required this.id,
        required this.titulo,
        required this.descripcion,
        required this.fechaEvento,
        required this.lugar,
        required this.coordenadas,
    });

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        fechaEvento: DateTime.parse(json["fechaEvento"]),
        lugar: json["lugar"],
        coordenadas: json["coordenadas"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "descripcion": descripcion,
        "fechaEvento": fechaEvento.toIso8601String(),
        "lugar": lugar,
        "coordenadas": coordenadas,
    };
}
