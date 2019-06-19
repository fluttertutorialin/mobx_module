// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$PostStore on _PostStore, Store {
  final _$postsListAtom = Atom(name: '_PostStore.postsList');

  @override
  PostsList get postsList {
    _$postsListAtom.reportObserved();
    return super.postsList;
  }

  @override
  set postsList(PostsList value) {
    _$postsListAtom.context
        .checkIfStateModificationsAreAllowed(_$postsListAtom);
    super.postsList = value;
    _$postsListAtom.reportChanged();
  }

  final _$successAtom = Atom(name: '_PostStore.success');

  @override
  bool get success {
    _$successAtom.reportObserved();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.context.checkIfStateModificationsAreAllowed(_$successAtom);
    super.success = value;
    _$successAtom.reportChanged();
  }

  final _$loadingAtom = Atom(name: '_PostStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.checkIfStateModificationsAreAllowed(_$loadingAtom);
    super.loading = value;
    _$loadingAtom.reportChanged();
  }

  final _$statusCodeAtom = Atom(name: '_PostStore.statusCode');

  @override
  int get statusCode {
    _$statusCodeAtom.reportObserved();
    return super.statusCode;
  }

  @override
  set statusCode(int value) {
    _$statusCodeAtom.context
        .checkIfStateModificationsAreAllowed(_$statusCodeAtom);
    super.statusCode = value;
    _$statusCodeAtom.reportChanged();
  }

  final _$getPostsAsyncAction = AsyncAction('getPosts');

  @override
  Future<dynamic> getPosts() {
    return _$getPostsAsyncAction.run(() => super.getPosts());
  }

  final _$_PostStoreActionController = ActionController(name: '_PostStore');

  @override
  void remove() {
    final _$actionInfo = _$_PostStoreActionController.startAction();
    try {
      return super.remove();
    } finally {
      _$_PostStoreActionController.endAction(_$actionInfo);
    }
  }
}
