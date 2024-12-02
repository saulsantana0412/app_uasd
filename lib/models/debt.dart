
class Debt {
    int id;
    int usuarioId;
    double monto;
    bool pagada;
    DateTime fechaActualizacion;

    Debt({
        required this.id,
        required this.usuarioId,
        required this.monto,
        required this.pagada,
        required this.fechaActualizacion,
    });

    factory Debt.fromJson(Map<String, dynamic> json) => Debt(
        id: json["id"],
        usuarioId: json["usuarioId"],
        monto: json["monto"],
        pagada: json["pagada"],
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "usuarioId": usuarioId,
        "monto": monto,
        "pagada": pagada,
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
    };
}