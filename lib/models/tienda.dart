import 'dart:convert';

Tienda tiendaModelFromJson(String str) => Tienda.fromJson(json.decode(str));

String tiendaModelToJson(Tienda data) => json.encode(data.toJson());


class Tiendas{
  List<Tienda> items = [];

  Tiendas();

  Tiendas.fromJsonList(List<dynamic> jsonList ){
    // ignore: unnecessary_null_comparison
    if (jsonList==null) return;

    for (var item in jsonList) {
      final tienda = new Tienda.fromJson(item);

      items.add(tienda);
    }
  }
}

class Tienda {
    Tienda({
        this.id,
        this.name,
        this.logo,
        this.cupones
    });

    String ?id;
    String ?name;
    String ?logo;
    String ?cupones;


    factory Tienda.fromJson(Map<String, dynamic> json) => Tienda(
        id: json["id"].toString(),
        name: json["name"],
        logo: json["logo"],
        cupones: json["cantidad"]
        
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "cupones": cupones
    };
}
