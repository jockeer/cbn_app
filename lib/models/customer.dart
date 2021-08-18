import 'dart:convert';

CustomerModel customerModelFromJson(String str) => CustomerModel.fromJson(json.decode(str));

String customerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
    CustomerModel({
        this.id,
        this.name,
        this.lastname,
        this.ci,
        this.legajo,
        this.birthday,
        this.cellphone,
        this.internal,
        this.address,

        this.email
    });

    int ?id;
    String ?name;
    String ?lastname;
    String ?ci;
    String ?legajo;
    String ?birthday;
    String ?cellphone;
    String ?internal;
    String ?address;

    String ?email;


    factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        ci: json["ci"],
        legajo: json["legajo"],
        birthday: json["birthday"].toString(),
        cellphone: json["cellphone"],
        internal: json["internal"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "ci": ci,
        "legajo": legajo,
        "birthday": birthday,
        "cellphone": cellphone,
        "internal": internal,
        "address": address,
        "email": email,
    };
}
