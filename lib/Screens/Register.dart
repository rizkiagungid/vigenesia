import 'package:vigenesia/Constant/Const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:dio/dio.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String baseurl = url;

  Future postRegister(
      String nama, String profesi, String email, String password) async {
    var dio = Dio();

    dynamic data = {
      "nama": nama,
      "profesi": profesi,
      "email": email,
      "password": password
    };

    try {
      final response = await dio.post(
        "$baseurl/vigenesia/api/registrasi/",
        data: data,
        options: Options(headers: {'Content-type': 'application/json'}),
      );

      print("Respon -> ${response.data} + ${response.statusCode}");

      return response.data;
    } catch (e) {
      print("Failed To Load $e");
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController profesiController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.3,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Register Your Account",
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 50),
                  FormBuilderTextField(
                    name: "name",
                    controller: nameController,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        border: OutlineInputBorder(),
                        labelText: "Nama"),
                  ),
                  const SizedBox(height: 20),
                  FormBuilderTextField(
                    name: "profesi",
                    controller: profesiController,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        border: OutlineInputBorder(),
                        labelText: "Profesi"),
                  ),
                  const SizedBox(height: 20),
                  FormBuilderTextField(
                    name: "email",
                    controller: emailController,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        border: OutlineInputBorder(),
                        labelText: "Email"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FormBuilderTextField(
                    obscureText:
                        true, // <-- Buat bikin setiap inputan jadi bintang " * "
                    name: "password",
                    controller: passwordController,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        border: OutlineInputBorder(),
                        labelText: "Password"),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                      ),
                      onPressed: () async {
                        await postRegister(
                                nameController.text,
                                profesiController.text,
                                emailController.text,
                                passwordController.text)
                            .then((value) => {
                                  if (value != null)
                                    {
                                      setState(() {
                                        Navigator.pop(context);
                                        Flushbar(
                                          title: "Success :",
                                          message: "Berhasil Registrasi",
                                          duration: Duration(seconds: 3),
                                          backgroundColor: Colors.greenAccent,
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                        ).show(context);
                                      })
                                    }
                                  else if (value == null)
                                    {
                                      Flushbar(
                                        title: "Failed :",
                                        message:
                                            "Please check your field before register!",
                                        duration: const Duration(seconds: 5),
                                        backgroundColor: Colors.red,
                                        flushbarPosition: FlushbarPosition.TOP,
                                      ).show(context)
                                    }
                                });
                      },
                      child: const Text("Sign Up"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
