import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'dart:convert';
import 'package:another_flushbar/flushbar.dart';
import 'package:dio/dio.dart';
import 'package:vigenesia/Constant/Const.dart';
import 'package:vigenesia/Models/Motivasi_Model.dart';
import 'package:vigenesia/Screens/MainScreens.dart';

class EditPage extends StatefulWidget {
  final String? id;
  final String? isi_motivasi;

  const EditPage({
    Key? key,
    this.id,
    this.isi_motivasi,
  }) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  String baseurl = url;

  var dio = Dio();
  Future<dynamic> putPost(String isi_motivasi, String ids) async {
    Map<String, dynamic> data = {"isi_motivasi": isi_motivasi, "id": ids};
    var response = await dio.put(
      '$baseurl/vigenesia/api/dev/PUTmotivasi',
      data: data,
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
    );

    print("---> ${response.data} + ${response.statusCode}");

    return response.data;
  }

  TextEditingController isiMotivasiC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
      ),
      body: SafeArea(
        child: Container(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${widget.isi_motivasi}"),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.4,
                    child: FormBuilderTextField(
                      name: "isi_motivasi",
                      controller: isiMotivasiC,
                      decoration: InputDecoration(
                        labelText: "New Data",
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      putPost(isiMotivasiC.text, widget.id!).then((value) => {
                            if (value != null)
                              {
                                Navigator.pop(context),
                                Flushbar(
                                  title: "Success :",
                                  message:
                                      "Perubahan disimpan. Silahkan refresh",
                                  duration: const Duration(seconds: 5),
                                  backgroundColor: Colors.green,
                                  flushbarPosition: FlushbarPosition.TOP,
                                ).show(context)
                              }
                          });
                    },
                    child: Text("Submit"),
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
