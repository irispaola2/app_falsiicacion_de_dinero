import 'dart:convert';

class Falsificacion {
  String? caracteristica1;
  String? caracteristica2;
  String? caracteristica3;
  String? caracteristica4;
  String? caracteristica5;
  String? imagenId;
  String name;
  String? picture;
  int valor;
  String? id;

  Falsificacion({
    this.caracteristica1,
    this.caracteristica2,
    this.caracteristica3,
    this.caracteristica4,
    this.caracteristica5,
    this.imagenId,
    required this.name,
    this.picture,
    required this.valor,
    this.id,
  });

  factory Falsificacion.fromJson(String str) =>
      Falsificacion.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Falsificacion.fromMap(Map<String, dynamic> json) => Falsificacion(
        caracteristica1: json["caracteristica1"],
        caracteristica2: json["caracteristica2"],
        caracteristica3: json["caracteristica3"],
        caracteristica4: json["caracteristica4"],
        caracteristica5: json["caracteristica5"],
        imagenId: json["imagen_id"],
        name: json["name"],
        picture: json["picture"],
        valor: json["valor"],
      );

  Map<String, dynamic> toMap() => {
        "caracteristica1": caracteristica1,
        "caracteristica2": caracteristica2,
        "caracteristica3": caracteristica3,
        "caracteristica4": caracteristica4,
        "caracteristica5": caracteristica5,
        "imagen_id": imagenId,
        "name": name,
        "picture": picture,
        "valor": valor,
      };
  Falsificacion copy() => Falsificacion(
        caracteristica1: this.caracteristica1,
        caracteristica2: this.caracteristica2,
        caracteristica3: this.caracteristica3,
        caracteristica4: this.caracteristica4,
        caracteristica5: this.caracteristica5,
        imagenId: this.imagenId,
        name: this.name,
        picture: this.picture,
        valor: this.valor,
        id: this.id,
      );
}
