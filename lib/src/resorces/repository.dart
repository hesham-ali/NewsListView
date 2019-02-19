import 'dart:async';
import 'news_dp_provider.dart';
import 'news_api_provider.dart';
import '../models/item_models.dart';

class Repository {
  List<Source> sources = <Source>[
    NewsApiProvider(),
    NewsDbProviders(),
  ];
  List<Cache> caches = <Cache>[
    NewsDbProviders(),
  ];

  Future<List<int>> fetchTopId() async {
    List <int>ids;
    Source source;
    for (source in sources) {
      ids = await source.fetchTopId();
      if (ids.length > 0) {
        break;
      }
    }
    return ids;
  }

  Future<ItemModel> fetchItem(int id) async {
    ItemModel item;
    Source source;

    for (source in sources) {
      item = await source.fetchItem(id);
      if (item != null) {
        break;
      }
    }
    for (var cache in caches) {
      cache.addItem(item);
    }

    return item;
  }
}

abstract class Source {
  Future<List<int>> fetchTopId();

  Future<ItemModel> fetchItem(int id);
}

abstract class Cache {
  Future<int> addItem(ItemModel item);
}
