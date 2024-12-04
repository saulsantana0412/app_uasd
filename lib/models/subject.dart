// Clase que representa una asignatura en el sistema
class Subject {
  // Código único de la asignatura
  String codigo;

  // Nombre de la asignatura
  String nombre;

  // Aula asignada a la asignatura
  String aula;

  // Horario de la asignatura (opcional)
  String? horario;

  // Ubicación de la asignatura (latitud y longitud)
  String ubicacion;

  // Confirmación de la asignatura (opcional, para indicar si está confirmada)
  bool? confirmada;

  // Constructor que inicializa los valores de la asignatura
  Subject({
    required this.codigo,
    required this.nombre,
    required this.aula,
    this.horario,
    required this.ubicacion,
    this.confirmada,
  });

  // Método de fábrica para crear una instancia de Subject a partir de un JSON
  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
    codigo: json["codigo"],  // Asigna el valor de 'codigo' desde el JSON
    nombre: json["nombre"],  // Asigna el valor de 'nombre' desde el JSON
    aula: json["aula"],  // Asigna el valor de 'aula' desde el JSON
    horario: json["horario"],  // Asigna el valor de 'horario' desde el JSON (puede ser nulo)
    ubicacion: json["ubicacion"],  // Asigna el valor de 'ubicacion' desde el JSON
    confirmada: json["confirmada"],  // Asigna el valor de 'confirmada' desde el JSON (puede ser nulo)
  );

  // Método para convertir la instancia de Subject en un mapa JSON
  Map<String, dynamic> toJson() => {
    "codigo": codigo,  // Devuelve el valor de 'codigo'
    "nombre": nombre,  // Devuelve el valor de 'nombre'
    "aula": aula,  // Devuelve el valor de 'aula'
    "horario": horario,  // Devuelve el valor de 'horario' (puede ser nulo)
    "ubicacion": ubicacion,  // Devuelve el valor de 'ubicacion'
    "confirmada": confirmada,  // Devuelve el valor de 'confirmada' (puede ser nulo)
  };
}
