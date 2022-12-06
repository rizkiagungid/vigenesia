class LoginModels {
  bool? isActive;
  String? message;
  LoginData? data;

  LoginModels({this.isActive, this.message, this.data});

  LoginModels.fromJson(Map<String, dynamic> json) {
    isActive = json['is_active'];
    message = json['message'];
    data = json['data'] != null ? new LoginData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_active'] = this.isActive;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LoginData {
  String? iduser;
  String? nama;
  String? profesi;
  String? email;
  String? password;
  String? roleId;
  String? isActive;
  String? tanggalInput;
  String? modified;

  LoginData(
      {this.iduser,
      this.nama,
      this.profesi,
      this.email,
      this.password,
      this.roleId,
      this.isActive,
      this.tanggalInput,
      this.modified});

  LoginData.fromJson(Map<String, dynamic> json) {
    iduser = json['iduser'];
    nama = json['nama'];
    profesi = json['profesi'];
    email = json['email'];
    password = json['password'];
    roleId = json['role_id'];
    isActive = json['is_active'];
    tanggalInput = json['tanggal_input'];
    modified = json['modified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iduser'] = this.iduser;
    data['nama'] = this.nama;
    data['profesi'] = this.profesi;
    data['email'] = this.email;
    data['password'] = this.password;
    data['role_id'] = this.roleId;
    data['is_active'] = this.isActive;
    data['tanggal_input'] = this.tanggalInput;
    data['modified'] = this.modified;
    return data;
  }
}
