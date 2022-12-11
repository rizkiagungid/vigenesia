import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:dio/dio.dart';
import 'package:vigenesia/Constant/const.dart';

class AddPage extends StatefulWidget {
  final String userid;
  const AddPage({Key? key, required this.userid}) : super(key: key);
  @override
  AddPageState createState() => AddPageState();
}

class AddPageState extends State<AddPage> {
  String baseurl = url;
  bool _visible = false;
  late String _motivasi;
  TextEditingController motivasiController = TextEditingController();

  @override
  void dispose() {
    motivasiController.dispose();
    super.dispose();
  }

  Future sendMotivasi(String motivasi) async {
    dynamic body = {'isi_motivasi': motivasi, 'iduser': widget.userid};
    try {
      final response = await dio.post(
        '$baseurl/api/dev/POSTmotivasi',
        data: body,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      return response;
    } catch (e) {
      print('Error di -> $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      floatingActionButton: Visibility(
        visible: _visible,
        child: ElevatedButton(
          style: OutlinedButton.styleFrom(
            shape: const StadiumBorder(),
          ),
          child: const Text('Tambah'),
          onPressed: () async {
            await sendMotivasi(
              _motivasi,
            ).then(
              (value) => {
                Navigator.pop(context),
                if (value != null)
                  {
                    Flushbar(
                      message: 'Berhasil Submit',
                      duration: const Duration(seconds: 2),
                      backgroundColor: Colors.greenAccent,
                      flushbarPosition: FlushbarPosition.TOP,
                    ).show(context)
                  },
              },
            );
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                onChanged: (text) {
                  setState(
                    () {
                      _visible = text.isNotEmpty;
                      _motivasi = text;
                    },
                  );
                },
                decoration: const InputDecoration(
                  hintText: "Apa yang sedang terjadi?",
                  icon: Icon(Icons.circle_rounded),
                ),
                scrollPadding: const EdgeInsets.all(20.0),
                keyboardType: TextInputType.multiline,
                maxLines: 99999,
                autofocus: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
