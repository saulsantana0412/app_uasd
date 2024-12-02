class Request {
    int id;
    int usuarioId;
    String tipo;
    String descripcion;
    String estado;
    DateTime fechaSolicitud;
    DateTime? fechaRespuesta;
    String? respuesta;

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

    factory Request.fromJson(Map<String, dynamic> json) => Request(
        id: json["id"],
        usuarioId: json["usuarioId"],
        tipo: json["tipo"],
        descripcion: json["descripcion"],
        estado: json["estado"],
        fechaSolicitud: DateTime.parse(json["fechaSolicitud"]),
        fechaRespuesta: json["fechaRespuesta"],
        respuesta: json["respuesta"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "usuarioId": usuarioId,
        "tipo": tipo,
        "descripcion": descripcion,
        "estado": estado,
        "fechaSolicitud": fechaSolicitud.toIso8601String(),
        "fechaRespuesta": fechaRespuesta,
        "respuesta": respuesta,
    };
}