import 'dart:convert';

PerfilModel perfilModelFromJson(String str) =>
    PerfilModel.fromJson(json.decode(str));

String perfilModelToJson(PerfilModel data) => json.encode(data.toJson());

class PerfilModel {
  PerfilModel(
      {this.id,
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
      this.idPolera,
      this.pantalon,
      this.zapato,
      this.afp,
      this.nuaCua,
      this.dependent,
      this.vacation,
      this.balanceIva,
      this.gender,
      this.sindicalizado,
      this.idEscolaridad,
      this.codCajaSalud,
      this.convenio,
      this.centroCosto,
      this.puesto,
      this.idEmpresa,
      this.codTributario,
      this.idRegion,
      this.region,
      this.email,
      this.polera});

  int? id;
  String? name;
  String? lastname;
  String? ci;
  String? expedition;
  String? legajo;
  String? foto;
  String? birthday;
  String? cellphone;
  String? internal;
  String? address;
  int? numberSons;
  String? maritalStatus;
  String? height;
  String? idPolera;
  String? pantalon;
  String? zapato;
  String? afp;
  String? nuaCua;
  String? dependent;
  int? vacation;
  String? balanceIva;
  String? gender;
  String? sindicalizado;
  String? idEscolaridad;
  String? codCajaSalud;
  String? convenio;
  String? centroCosto;
  String? puesto;
  String? idEmpresa;
  String? codTributario;
  int? idRegion;
  String? region;
  String? email;

  String? polera;

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
      idPolera: json["id_polera"].toString(),
      pantalon: json["pantalon"],
      zapato: json["zapato"],
      afp: json["afp"],
      nuaCua: json["nua_cua"],
      dependent: json["dependent"],
      vacation: json["vacation"],
      balanceIva: json["balance_iva"],
      gender: json["gender"],
      sindicalizado: json["sindicalizado"],
      idEscolaridad: json["id_escolaridad"]?.toString() ?? "Por definir",
      codCajaSalud: json["cod_caja_salud"],
      convenio: json["convenio"],
      centroCosto: json["centro_costo"],
      puesto: json["puesto"],
      idEmpresa: json["id_empresa"].toString(),
      codTributario: json["cod_tributario"],
      idRegion: json["id_region"],
      region: json["Region"]["name"],
      email: json["User"]["user_email"],
      polera: (json["Polera"] == null) ? "" : json["Polera"]["talla"]);

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
