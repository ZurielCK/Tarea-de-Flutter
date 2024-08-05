// auto.dart
class AutoModel {
  final int id;
  final String marca;
  final String modelo;
  final int velocidadMaxima;
  final String tipo;

  AutoModel({
    required this.id,
    required this.marca,
    required this.modelo,
    required this.velocidadMaxima,
    required this.tipo,
  });

  factory AutoModel.fromJson(Map<String, dynamic> json) {
    return AutoModel(
      id: json['id'],
      marca: json['marca'],
      modelo: json['modelo'],
      velocidadMaxima: json['velocidadMaxima'],
      tipo: json['tipo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'marca': marca,
      'modelo': modelo,
      'velocidadMaxima': velocidadMaxima,
      'tipo': tipo,
    };
  }
}
