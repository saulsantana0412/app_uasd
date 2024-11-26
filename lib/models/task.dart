class Task {
    int id;
    int usuarioId;
    String titulo;
    String descripcion;
    DateTime fechaVencimiento;
    bool completada;

    Task({
        required this.id,
        required this.usuarioId,
        required this.titulo,
        required this.descripcion,
        required this.fechaVencimiento,
        required this.completada,
    });

    factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        usuarioId: json["usuarioId"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        fechaVencimiento: DateTime.parse(json["fechaVencimiento"]),
        completada: json["completada"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "usuarioId": usuarioId,
        "titulo": titulo,
        "descripcion": descripcion,
        "fechaVencimiento": fechaVencimiento.toIso8601String(),
        "completada": completada,
    };
}