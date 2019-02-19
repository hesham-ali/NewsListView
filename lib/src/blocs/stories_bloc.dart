import 'stories_provider.dart';
import '../models/item_models.dart';
import '../resorces/repository.dart';
import 'package:rxdart/rxdart.dart';

class StoriesBloc {
  final _repository = Repository();
  final _topIds = PublishSubject<List<int>>();

  Observable<List<int>> get topIds => _topIds.stream;

  fetchTopId() async {
    final List<int> ids = await _repository.fetchTopId();
    _topIds.sink.add(ids);
  }

  dispose() {
    _topIds.close();
  }
}
