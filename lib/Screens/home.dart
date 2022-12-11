import 'package:flutter/material.dart';
import 'package:vigenesia/Models/tweet.dart';
import 'package:vigenesia/Constant/const.dart';
import 'package:vigenesia/Models/motivasi_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final String baseurl = url;

  Future<List<MotivasiModel>> getDataMotivasi() async {
    var response = await dio.get('$baseurl/api/Get_motivasi');
    if (response.statusCode == 200) {
      var getUsersData = response.data as List;
      return getUsersData.map((i) => MotivasiModel.fromJson(i)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 19.0, right: 19.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              FutureBuilder(
                future: getDataMotivasi(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<MotivasiModel>> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        for (var item in snapshot.data!)
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Tweet(
                              id: item.id,
                              user: item.idUser,
                              text: item.isiMotivasi,
                              date: item.tanggalInput,
                              fromPage: "home",
                            ),
                          ),
                          
                      ],
                    );
                  } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                    return const Text('No Data');
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                  
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
