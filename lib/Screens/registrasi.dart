import 'package:flutter/services.dart';
import 'package:vigenesia/Constant/const.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:dio/dio.dart';
import 'package:vigenesia/Constant/costum-colors.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  String baseurl = url;

  Future postRegister(
      String nama, String profesi, String email, String password) async {
    dynamic data = {
      'nama': nama,
      'profesi': profesi,
      'email': email,
      'password': password
    };
    try {
      final response = await dio.post('$baseurl/api/registrasi',
          data: data,
          options: Options(headers: {'content-Type': 'application/json'}));
      print('Respon -> ${response.data} + ${response.statusCode}');
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      print('Failed To Load $e');
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController profesiController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorcostum.accentblue,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: SizedBox(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                      colorcostum.accentblue,
                      colorcostum.accent2blue
                    ])),
                width: MediaQuery.of(context).size.width / 0.1,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Register Your Account',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 50),
                    FormBuilderTextField(
                      name: 'name',
                      controller: nameController,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          border: OutlineInputBorder(),
                          labelText: 'Nama'),
                    ),
                    const SizedBox(height: 20),
                    FormBuilderTextField(
                      name: 'profesi',
                      controller: profesiController,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          border: OutlineInputBorder(),
                          labelText: 'Profesi'),
                    ),
                    const SizedBox(height: 20),
                    FormBuilderTextField(
                      name: 'email',
                      controller: emailController,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          border: OutlineInputBorder(),
                          labelText: 'Email'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormBuilderTextField(
                      obscureText:
                          true, // <-- Buat bikin setiap inputan jadi bintang ' * '
                      name: 'password',
                      controller: passwordController,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          border: OutlineInputBorder(),
                          labelText: 'Password'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          onPressed: () async {
                            await postRegister(
                                    nameController.text,
                                    profesiController.text,
                                    emailController.text,
                                    passwordController.text)
                                .then((value) => {
                                      if (value != null)
                                        {
                                          setState(
                                            () {
                                              Navigator.pop(context);
                                              Flushbar(
                                                message: 'Berhasil Registrasi',
                                                duration:
                                                    const Duration(seconds: 2),
                                                backgroundColor:
                                                    Colors.greenAccent,
                                                flushbarPosition:
                                                    FlushbarPosition.TOP,
                                              ).show(context);
                                            },
                                          )
                                        }
                                      else if (value == null)
                                        {
                                          Flushbar(
                                            message:
                                                'Check Your Field Before Register',
                                            duration:
                                                const Duration(seconds: 5),
                                            backgroundColor: Colors.redAccent,
                                            flushbarPosition:
                                                FlushbarPosition.TOP,
                                          ).show(context)
                                        }
                                    });
                          },
                          child: const Text('Register')),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
