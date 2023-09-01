import 'dart:convert';

import 'package:mvvm_app/model/picsum_model.dart';
import 'package:http/http.dart' as http;

class Services {
  Future<List<PicSumModel>> fetchPicturesAPI() async {
    String url = "https://picsum.photos/v2/list";
    final respons = await http.get(Uri.parse(url));
    if (respons.statusCode == 200) {
      final json = jsonDecode(respons.body) as List<dynamic>;
      final listResult = json.map((e) => PicSumModel.fromJson(e)).toList();
      return listResult;
    } else
      throw Exception(" Error fetching pictures");
  }
}
