import 'package:mobx_module/data/repository.dart';
import 'package:mobx_module/models/post/post.dart';
import 'package:mobx_module/models/post/post_list.dart';
import 'package:mobx_module/stores/error/error_store.dart';
import 'package:mobx_module/utils/dio/dio_error_util.dart';
import 'package:mobx/mobx.dart';

part 'post_store.g.dart';

class PostStore = _PostStore with _$PostStore;

abstract class _PostStore with Store {
  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  final postObservableList  = ObservableList<Post>();

  // store variables
  @observable
  PostsList postsList;

  @observable
  bool success = false;

  @observable
  bool loading = false;

  @observable
  int statusCode;

  // actions
  @action
  Future getPosts() async {
    loading = true;
    Repository.instance.getPosts().then((res) {
      this.postsList = PostsList.fromJson(res.data);

      postsList.posts.forEach((posts) => postObservableList.add(Post(id: posts.id, description: posts.description)));

      /*postsList.posts.forEach((newsArticle) {

      });*/

      statusCode = res.statusCode;
      loading = false;
      success = true;
      errorStore.showError = false;
    }).catchError((e) {
      loading = false;
      success = false;
      errorStore.showError = true;
      errorStore.errorMessage = DioErrorUtil.handleError(e);
    });
  }

  @action
  void remove() {
    this.postObservableList.removeAt(0);
  }
}
