import 'package:flutter/services.dart';
import 'package:vigenesia/Constant/const.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:dio/dio.dart';
import 'main.dart';
import 'registrasi.dart';
import 'package:flutter/gestures.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vigenesia/Models/login_model.dart';
import 'package:vigenesia/Constant/costum-colors.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  Future postLogin(String email, String password) async {
    String baseurl = url;
    Map<String, dynamic> data = {'email': email, 'password': password};
    try {
      final response = await dio.post('$baseurl/api/login',
          data: data,
          options: Options(headers: {'content-Type': 'application/json'}));
      print('Respon -> ${response.data} + ${response.statusCode}');
      if (response.statusCode == 200) {
        final loginModel = LoginModels.fromJson(response.data);
        return loginModel;
      }
    } catch (e) {
      print('Failed To Load $e');
    }
    return null;
  }

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
      ),
      body: SingleChildScrollView(
        // <-- Berfungsi Untuk Bisa Scroll
        child: SafeArea(
          // < -- Biar Gak Keluar Area Screen HP
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [colorcostum.accentblue, colorcostum.accent2blue])),
            height: MediaQuery.of(context).size.height,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 50, bottom: 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Vigenesia',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'mustard',
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50, bottom: 50),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Sign in to continue',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                    ),
                  ),
                  Center(
                    child: Form(
                      key: _fbKey,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: Column(
                          children: [
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
                                  true, // <--Buat bikin setiap inputan jadi bintang ' * '
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
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Dont Have Account? ',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                  TextSpan(
                                      text: 'Sign Up',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        const Register()),
                                          );
                                        },
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.blueAccent,
                                      )),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await postLogin(emailController.text,
                                            passwordController.text)
                                        .then((value) => {
                                              if (value != null)
                                                {
                                                  setState(() {
                                                    var id = value.data.iduser;
                                                    var name = value.data.nama;
                                                    prefs.setString('email',
                                                        value.data.email);
                                                    prefs.setString('nama',
                                                        value.data.nama);
                                                    prefs.setString('id',
                                                        value.data.iduser);
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            MainScreens(
                                                          nama: name,
                                                          idUser: id,
                                                        ),
                                                      ),
                                                    );
                                                  })
                                                }
                                              else if (value == null)
                                                {
                                                  Flushbar(
                                                    message:
                                                        'Check Your Email / Password',
                                                    duration: const Duration(
                                                        seconds: 5),
                                                    backgroundColor:
                                                        Colors.redAccent,
                                                    flushbarPosition:
                                                        FlushbarPosition.TOP,
                                                  ).show(context)
                                                }
                                            });
                                  },
                                  child: const Text('Sign In')),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
