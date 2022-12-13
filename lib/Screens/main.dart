import 'package:flutter/services.dart';
import 'package:vigenesia/Screens/add_page.dart';
import 'package:flutter/material.dart';
import 'package:vigenesia/Screens/drawer.dart';
import 'package:vigenesia/Screens/home.dart';
import 'package:vigenesia/Constant/const.dart';
import 'package:url_launcher/url_launcher.dart';

import 'login.dart';

class MainScreens extends StatefulWidget {
  final String idUser;
  final String nama;
  const MainScreens({Key? key, required this.nama, required this.idUser})
      : super(key: key);
  @override
  MainScreensState createState() => MainScreensState();
}

class MainScreensState extends State<MainScreens> {
  String baseurl = url;
  late String id;
  TextEditingController titleController = TextEditingController();

  Future<Widget> getData() async {
    await getDataMotivasi().then((_) {
      setState(() => {});
    });
    return const Center(child: CircularProgressIndicator());
  }

  @override
  void initState() {
    super.initState();
    getDataMotivasiUser(widget.idUser);
    getDataMotivasi();
    getData();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    String firstName = widget.nama.split(' ')[0];
    String? secondName =
        widget.nama.split(' ').length > 1 ? widget.nama.split(' ')[1] : null;
    String displayName =
        secondName != null ? firstName[0] + secondName[0] : firstName[0];
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(
        displayName: displayName,
        fullName: widget.nama,
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.only(left: 19.0),
          child: CircleAvatar(
            child: TextButton(
              child: Text(
                displayName,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            ),
          ),
        ),
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          const Home(),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(21.0),
              child: FloatingActionButton(
                tooltip: 'Tambah Motivasi',
                child: const Icon(Icons.add),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          AddPage(userid: widget.idUser),
                    ),
                  ).then((_) async => await getData());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

_launchUrl() async {
  const url = 'http://vigenesia.rasxmedia.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
