class Subject {
    String codigo;
    String nombre;
    String aula;
    String? horario;
    String ubicacion;
    bool? confirmada;

    Subject({
        required this.codigo,
        required this.nombre,
        required this.aula,
        this.horario,
        required this.ubicacion,
        this.confirmada,
    });

    factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        codigo: json["codigo"],
        nombre: json["nombre"],
        aula: json["aula"],
        horario: json["horario"],
        ubicacion: json["ubicacion"],
        confirmada: json["confirmada"],
    );

    Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "nombre": nombre,
        "aula": aula,
        "horario": horario,
        "ubicacion": ubicacion,
        "confirmada": confirmada,
    };
}
