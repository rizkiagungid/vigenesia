import 'dart:convert';

LoginModels loginModelsFromJson(String str) =>
    LoginModels.fromJson(json.decode(str));
String loginModelsToJson(LoginModels data) => json.encode(data.toJson());

class LoginModels {
  LoginModels({
    required this.isActive,
    required this.message,
    required this.data,
  });

  bool isActive;
  String message;
  DataUser data;

  factory LoginModels.fromJson(Map<String, dynamic> json) => LoginModels(
        isActive: json['is_active'],
        message: json['message'],
        data: DataUser.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'is_active': isActive,
        'message': message,
        'data': data.toJson(),
      };
}

class DataUser {
  DataUser({
    required this.iduser,
    required this.nama,
    required this.profesi,
    required this.email,
    required this.password,
    required this.roleId,
    required this.isActive,
    required this.tanggalInput,
    required this.modified,
  });

  String iduser;
  String nama;
  String profesi;
  String email;
  String password;
  String roleId;
  String isActive;
  DateTime tanggalInput;
  String modified;

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
        iduser: json['iduser'],
        nama: json['nama'],
        profesi: json['profesi'],
        email: json['email'],
        password: json['password'],
        roleId: json['role_id'],
        isActive: json['is_active'],
        tanggalInput: DateTime.parse(json['tanggal_input']),
        modified: json['modified'],
      );

  Map<String, dynamic> toJson() => {
        'iduser': iduser,
        'nama': nama,
        'profesi': profesi,
        'email': email,
        'password': password,
        'role_id': roleId,
        'is_active': isActive,
        'tanggal_input':
            '${tanggalInput.year.toString().padLeft(4, '0')}-${tanggalInput.month.toString().padLeft(2, '0')}-${tanggalInput.day.toString().padLeft(2, '0')}',
        'modified': modified,
      };
}
