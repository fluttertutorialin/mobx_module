import 'package:mobx_module/stores/post/post_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_module/ui/widgets/progress_indicator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //store
  final _store = PostStore();

  @override
  void initState() {
    super.initState();

    //GET ALL POST
    _store.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Posts'),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            /*SharedPreferences.getInstance().then((preference) {
              preference.setBool(Preferences.is_logged_in, false);
              Navigator.of(context).pushReplacementNamed(Routes.login);
            });*/
            _store.remove();
          },
          icon: Icon(
            Icons.power_settings_new,
          ),
        )
      ],
    );
  }

  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        Observer(
          builder: (context) {
            return _store.loading
                ? CustomProgressIndicator()
                : Material(child: _buildListView());
          },
        ),
        Observer(
          name: 'error',
          builder: (context) {
            return _store.success
                ? Container()
                : showErrorMessage(context, _store.errorStore.errorMessage);
          },
        )
      ],
    );
  }

  Widget _buildListView() {
    return Observer(
        builder: (_) => _store.postObservableList.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: _store.postObservableList.length,
                itemBuilder: (_, index) => ListTile(
                      leading: Icon(Icons.cloud_circle),
                      title: Text(
                        '${_store.postObservableList[index].id}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: Theme.of(context).textTheme.title,
                      ),
                      subtitle: Text(
                        '${_store.postObservableList[index].description}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                    ))
            : Center(child: Text('No posts found')));
  }

  // General Methods:-----------------------------------------------------------
  showErrorMessage(BuildContext context, String message) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (message != null) {}
    });

    return Container();
  }
}
