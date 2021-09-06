import 'dart:convert';

PerfilModel perfilModelFromJson(String str) => PerfilModel.fromJson(json.decode(str));

String perfilModelToJson(PerfilModel data) => json.encode(data.toJson());

class PerfilModel {
    PerfilModel({
      this.id,
      this.name,
      this.lastname,
      this.ci,
      this.expedition,
      this.legajo,
      this.foto,
      this.birthday,
      this.cellphone,
      this.internal,
      this.address,
      this.numberSons,
      this.maritalStatus,
      this.height,
      this.bustSize,
      this.waistSize,
      this.footSize,
      this.afp,
      this.nuaCua,
      this.dependent,
      this.vacation,
      this.balanceIva,
      this.idRegion,
      this.region,
      this.email
    });

    int ?id;
    String ?name;
    String ?lastname;
    String ?ci;
    String ?expedition;
    String ?legajo;
    String ?foto;
    String ?birthday;
    String ?cellphone;
    String ?internal;
    String ?address;

    int ?numberSons;
    String ?maritalStatus;
    String ?height;
    String ?bustSize;
    String ?waistSize;
    String ?footSize;
    String ?afp;
    String ?nuaCua;
    String ?dependent;
    int ?vacation;
    String ?balanceIva;
    int ?idRegion;
    String ?region;

    String ?email;


    factory PerfilModel.fromJson(Map<String, dynamic> json) => PerfilModel(
      id: json["id"],
      name: json["name"],
      lastname: json["lastname"],
      ci: json["ci"],
      expedition: json["expedition"],
      legajo: json["legajo"],
      foto: json["foto"],
      birthday: json["birthday"].toString(),
      cellphone: json["cellphone"],
      internal: json["internal"],
      address: json["address"],
      numberSons: json["number_sons"],
      maritalStatus: json["marital_status"],
      height: json["height"],
      bustSize: json["bust_size"],
      waistSize: json["waist_size"],
      footSize: json["foot_size"],
      afp: json["afp"],
      nuaCua: json["nua_cua"],
      dependent: json["dependent"],
      vacation: json["vacation"],
      balanceIva: json["balance_iva"],
      idRegion: json["id_region"],
      region: json["Region"]["name"],
      email: json["User"]["user_name"]
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
