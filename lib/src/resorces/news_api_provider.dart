import 'package:http/http.dart' show get;
import 'dart:convert';
import '../models/item_models.dart';
import 'repository.dart';

class NewsApiProvider implements Source{
  final _root = ' ';



  Future<List<int>> fetchTopId() async {
    final response = await get('https://hacker-news.firebaseio.com/v0/topstories.json');
    final List<int>ids = json.decode(response.body);

    return ids;
  }

  Future<ItemModel> fetchItem(int id) async {
    final response = await get('$_root/item/$id.json');
    final parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);
  }
}
