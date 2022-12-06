import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:dio/dio.dart';

import 'package:vigenesia/Constant/const.dart';

import 'package:vigenesia/Models/Motivasi_Model.dart';

class EditPage extends StatefulWidget {
  final String? id;
  final String? isi_motivasi;
  const EditPage({Key? key, this.id, this.isi_motivasi}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  String baseurl =
      "http://vigenesia.org"; // ganti dengan ip address kamu / tempat kamu menyimpan backend

  var dio = Dio();
  Future<dynamic> putPost(String isi_motivasi, String ids) async {
    Map<String, dynamic> data = {"isi_motivasi": isi_motivasi, "id": ids};
    var response = await dio.put('$baseurl/api/dev/PUTmotivasi',
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ));

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
                SizedBox(
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
                      contentPadding: EdgeInsets.only(left: 10),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      putPost(isiMotivasiC.text, widget.id.toString())
                          .then((value) => {
                                if (value != null)
                                  {
                                    Navigator.pop(context),
                                    Flushbar(
                                      message: "Berhasil Update & Refresh dlu",
                                      duration: Duration(seconds: 5),
                                      backgroundColor: Colors.green,
                                      flushbarPosition: FlushbarPosition.TOP,
                                    ).show(context)
                                  }
                              });
                    },
                    child: Text("Submit"))
              ],
            ),
          ),
        ),
      )),
    );
  }
}
