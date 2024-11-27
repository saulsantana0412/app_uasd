class Subject {
    String codigo;
    String nombre;
    String aula;
    String? horarios;
    String ubicacion;
    bool? confirmada;

    Subject({
        required this.codigo,
        required this.nombre,
        required this.aula,
        this.horarios,
        required this.ubicacion,
        this.confirmada,
    });

    factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        codigo: json["codigo"],
        nombre: json["nombre"],
        aula: json["aula"],
        horarios: json["horarios"],
        ubicacion: json["ubicacion"],
        confirmada: json["confirmada"],
    );

    Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "nombre": nombre,
        "aula": aula,
        "horarios": horarios,
        "ubicacion": ubicacion,
        "confirmada": confirmada,
    };
}
