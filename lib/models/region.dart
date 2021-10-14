import 'dart:convert';

Region regionModelFromJson(String str) => Region.fromJson(json.decode(str));

String regionModelToJson(Region data) => json.encode(data.toJson());

class Regiones {
  List<Region> items = [];

  Regiones();

  Regiones.fromJsonList(List<dynamic> jsonList) {
    // ignore: unnecessary_null_comparison
    if (jsonList == null) return;

    for (var item in jsonList) {
      final tienda = new Region.fromJson(item);

      items.add(tienda);
    }
  }
}

class Region {
  Region({this.id, this.name, this.abbreviation});

  int? id;
  String? name;
  String? abbreviation;

  factory Region.fromJson(Map<String, dynamic> json) => Region(
      id: json["id"], name: json["name"], abbreviation: json["abbreviation"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "abbreviation": abbreviation};
}
