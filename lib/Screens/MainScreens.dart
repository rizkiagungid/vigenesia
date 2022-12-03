import 'dart:convert';
import 'package:vigenesia/Models/Motivasi_Model.dart';
import 'package:vigenesia/Screens/EditPage.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'Login.dart';
import 'package:vigenesia/Constant/Const.dart';
import 'package:another_flushbar/flushbar.dart';

class MainScreens extends StatefulWidget {
  String? iduser;
  String? nama;

  MainScreens({Key? key, this.nama, this.iduser}) : super(key: key);

  @override
  _MainScreensState createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  bool _loading = false;

  String baseurl = url;
  String? id;
  var dio = Dio();

  List<MotivasiModel> ass = [];
  TextEditingController titleController = TextEditingController();

  Future<dynamic> sendMotivasi(String isi) async {
    Map<String, dynamic> body = {
      "isi_motivasi": isi,
      "iduser": widget.iduser
    }; // [Tambah IDUSER -> Widget.iduser]

    try {
      final response = await dio.post(
        "$baseurl/vigenesia/api/dev/POSTmotivasi/",
        data: body,
        options: Options(
            followRedirects: false,
            validateStatus: (status) => true,
            contentType: Headers.formUrlEncodedContentType),
      ); // Formatnya Harus Form Data
      print("Respon -> ${response.data} + ${response.statusCode}");

      return response;
    } catch (e) {
      print("Error di -> $e");
    }
  }

  List<MotivasiModel> listproduk = [];

  Future<List<MotivasiModel>> getData() async {
    var response = await dio.get(
        '$baseurl/vigenesia/api/Get_motivasi?iduser=${widget.iduser}'); // Ngambil by data

    print(" ${response.data}");
    if (response.statusCode == 200) {
      var getUsersData = response.data as List;
      var listUsers = getUsersData
          .map(
            (i) => MotivasiModel.fromJson(i),
          )
          .toList();
      return listUsers;
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<dynamic> deletePost(String id) async {
    dynamic data = {
      "id": id,
    };
    var response = await dio.delete(
      '$baseurl/vigenesia/api/dev/DELETEmotivasi',
      data: data,
      options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {"Content-type": "application/json"}),
    );

    print(" ${response.data} + ${response.statusCode}");

    return response.data;
  }

  Future<List<MotivasiModel>> getData2() async {
    var response = await dio
        .get('$baseurl/vigenesia/api/Get_motivasi'); // Ngambil by ALL USER

    print(" ${response.data}");
    if (response.statusCode == 200) {
      var getUsersData = response.data as List;
      var listUsers = getUsersData
          .map(
            (i) => MotivasiModel.fromJson(i),
          )
          .toList();
      return listUsers;
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<void> _getData() async {
    setState(() {
      getData();
      listproduk.clear();
      _loading = false;
    });
  }

  TextEditingController isiController = TextEditingController();

  @override
  void initState() {
    _loading = true;
    super.initState();
    getData();
    getData2();
    _getData();
  }

  String? trigger;
  String? triggeruser;

  @override
  Widget build(BuildContext context) {
    if (_loading) return const CircularProgressIndicator();

    return Scaffold(
      body: SingleChildScrollView(
        // <-- Berfungsi Untuk  Bisa Scroll
        child: SafeArea(
          // < -- Biar Gak Keluar Area Screen HP
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment
                    .center, // <-- Berfungsi untuk  atur nilai X jadi tengah
                children: [
                  const SizedBox(
                    height: 40,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Halo, ${widget.nama}",
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                          child: const Icon(Icons.logout),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const Login(),
                                ));
                          })
                    ],
                  ),
                  const SizedBox(height: 20), // <-- Kasih Jarak Tinggi : 50px
                  FormBuilderTextField(
                    controller: isiController,
                    name: "isi_motivasi",
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                      ),
                      onPressed: () async {
                        await sendMotivasi(
                          isiController.text.toString(),
                        ).then((value) => {
                              if (value != null)
                                {
                                  Flushbar(
                                    title: "Success :",
                                    message: "Berhasil Submit",
                                    duration: const Duration(seconds: 5),
                                    backgroundColor: Colors.green,
                                    flushbarPosition: FlushbarPosition.TOP,
                                  ).show(context)
                                }
                            });
                        _getData();
                        print("Sukses");
                      },
                      child: const Text("Submit"),
                    ),
                  ),
                  TextButton(
                    child: const Icon(Icons.refresh),
                    onPressed: () {
                      _getData();
                    },
                  ),
                  FormBuilderRadioGroup(
                    onChanged: (value) {
                      setState(() {
                        trigger = value!;
                        print(" HASILNYA --> ${trigger}"); // hasil ganti value
                      });
                    },
                    name: "_",
                    options: ["Motivasi By All", "Motivasi By User"]
                        .map((e) => FormBuilderFieldOption(
                              value: e,
                              child: Text("${e}"),
                            ))
                        .toList(),
                  ),

                  trigger == "Motivasi By All"
                      ? FutureBuilder(
                          future: getData2(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<MotivasiModel>> snapshot) {
                            if (snapshot.hasData) {
                              return Container(
                                child: Column(
                                  children: [
                                    for (var item in snapshot.data!)
                                      Container(
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              width: 1,
                                              color: Color.fromARGB(
                                                  255, 227, 228, 235),
                                            ),
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ListView(
                                          shrinkWrap: true,
                                          children: [
                                            Container(
                                              child: Text(item.isiMotivasi!),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            } else if (snapshot.hasData &&
                                snapshot.data!.isEmpty) {
                              return const Text("No Data");
                            } else {
                              return const CircularProgressIndicator();
                            }
                          })
                      : Container(),
                  trigger == "Motivasi By User"
                      ? FutureBuilder(
                          future: getData(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<MotivasiModel>> snapshot) {
                            if (snapshot.hasData) {
                              return Container(
                                child: Column(
                                  children: [
                                    for (var item in snapshot.data!)
                                      Container(
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              width: 1,
                                              color: Color.fromARGB(
                                                  255, 227, 228, 235),
                                            ),
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ListView(
                                          shrinkWrap: true,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(item.isiMotivasi!),
                                                  Row(
                                                    children: [
                                                      TextButton(
                                                        child: const Icon(
                                                            Icons.settings),
                                                        onPressed: () {
                                                          String id;
                                                          String isi_motivasi;
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  EditPage(
                                                                      id: item
                                                                          .id,
                                                                      isi_motivasi:
                                                                          item.isiMotivasi),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                      TextButton(
                                                        child: const Icon(
                                                            Icons.delete),
                                                        onPressed: () {
                                                          deletePost(item.id!)
                                                              .then((value) => {
                                                                    if (value !=
                                                                        null)
                                                                      {
                                                                        Flushbar(
                                                                          title:
                                                                              "Success",
                                                                          message:
                                                                              "Berhasil Delete",
                                                                          duration:
                                                                              const Duration(seconds: 5),
                                                                          backgroundColor:
                                                                              Colors.redAccent,
                                                                          flushbarPosition:
                                                                              FlushbarPosition.TOP,
                                                                        ).show(
                                                                            context)
                                                                      }
                                                                  });
                                                          _getData();
                                                        },
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            } else if (snapshot.hasData &&
                                snapshot.data!.isEmpty) {
                              return const Text("No Data");
                            } else {
                              return const CircularProgressIndicator();
                            }
                          })
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
