import 'package:vigenesia/Constant/const.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:dio/dio.dart';
import 'package:vigenesia/Constant/costum-colors.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Ganti Base URL

  String baseurl =
      "http://vigenesia.org"; // ganti dengan ip address kamu / tempat kamu menyimpan backend

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
      final response = await dio.post("$baseurl/api/registrasi/",
          data: data,
          options: Options(headers: {'Content-type': 'application/json'}));

      print("Respon -> ${response.data} + ${response.statusCode}");

      if (response.statusCode == 200) {
        return response.data;
      }
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
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                    colorcostum.accentblue,
                    colorcostum.accent2blue
                  ])),
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Register Your Account",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'mustard',
                        color: Color(0xff83bcff)),
                  ),
                  SizedBox(height: 50),
                  // FormBuilderTextField(
                  //   name: "name",
                  //   controller: nameController,
                  //   decoration: InputDecoration(
                  //       contentPadding: EdgeInsets.only(left: 10),
                  //       border: OutlineInputBorder(),
                  //       labelText: "Nama"),
                  // ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(50, 238, 238, 238),
                          border: Border.all(color: colorcostum.accent2blue),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Nama"),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // FormBuilderTextField(
                  //   name: "profesi",
                  //   controller: profesiController,
                  //   decoration: InputDecoration(
                  //       contentPadding: EdgeInsets.only(left: 10),
                  //       border: OutlineInputBorder(),
                  //       labelText: "Profesi"),
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(50, 238, 238, 238),
                          border: Border.all(color: colorcostum.accent2blue),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: TextField(
                        controller: profesiController,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Profesi"),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(50, 238, 238, 238),
                          border: Border.all(color: colorcostum.accent2blue),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Email"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(50, 238, 238, 238),
                          border: Border.all(color: colorcostum.accent2blue),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Password"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  InkWell(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: colorcostum.purpleshadow,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              boxShadow: [
                                BoxShadow(
                                  color: colorcostum.deepblue,
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "REGISTER",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                      onTap: () async {
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
                                          message: "Berhasil Registrasi",
                                          duration: Duration(seconds: 2),
                                          backgroundColor: Colors.greenAccent,
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                        ).show(context);
                                      })
                                    }
                                  else if (value == null)
                                    {notificationmsg(context)}
                                });
                      })
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   child: ElevatedButton(
                  //       onPressed: () async {

                  //       },
                  //       child: Text("Daftar")),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> notificationmsg(
      BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Container(
          padding: const EdgeInsets.all(16),
          height: 90,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 220, 90, 90),
              borderRadius: BorderRadius.all(Radius.circular(40))),
          child: Row(
            children: [
              Image.asset(
                "assets/images/cancel.png",
                width: 40,
                height: 40,
              ),
              const SizedBox(
                width: 20,
              ),
              const Text("Pastikan Field Diatas Tidak Kosong")
            ],
          )),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }
}
