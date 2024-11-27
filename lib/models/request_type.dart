class RequestType {
    String codigo;
    String descripcion;

    RequestType({
        required this.codigo,
        required this.descripcion,
    });

    factory RequestType.fromJson(Map<String, dynamic> json) => RequestType(
        codigo: json["codigo"],
        descripcion: json["descripcion"],
    );

    Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "descripcion": descripcion,
    };
}
