import 'package:dio/dio.dart';
import 'package:vigenesia/Models/login_model.dart';
import 'package:vigenesia/Models/motivasi_model.dart';

String url = 'http://vigenesia.org/';
Dio dio = Dio();

Future<List<MotivasiModel>> getDataMotivasi() async {
  var response = await dio.get('$url/api/get_motivasi');
  if (response.statusCode == 200) {
    var getUsersData = response.data as List;
    return getUsersData.map((i) => MotivasiModel.fromJson(i)).toList();
  } else {
    throw Exception('Failed to load');
  }
}

Future<List<MotivasiModel>> getDataMotivasiUser(String id) async {
  var response = await dio.get('$url/api/get_motivasi?iduser=$id');
  if (response.statusCode == 200) {
    var getUsersData = response.data as List;
    return getUsersData.map((i) => MotivasiModel.fromJson(i)).toList();
  } else {
    throw Exception('Failed to load');
  }
}

Future<List<DataUser>> getDataUser(String id) async {
  var response = await dio.get('$url/api/user?iduser=$id');
  if (response.statusCode == 200) {
    var getUsersData = response.data as List;
    return getUsersData.map((i) => DataUser.fromJson(i)).toList();
  } else {
    throw Exception('Failed to load');
  }
}

extension DateTimeExtension on DateTime {
  String timeAgo({bool numericDates = true}) {
    final date2 = DateTime.now();
    final difference = date2.difference(this);

    if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates)
          ? '1 week ago'
          : '${year.toString().padLeft(4, '0')}-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour ago' : 'h';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 minute ago' : 'm';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} s';
    } else {
      return 'now';
    }
  }
}
