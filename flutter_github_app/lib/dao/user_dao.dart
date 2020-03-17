import 'package:flutter_github_app/utils/address.dart';
import 'package:flutter_github_app/net/http_manager.dart';
import 'package:flutter_github_app/net/net_config.dart';

class UserDao {

  static login(name,password) async{
    Map <String, dynamic> params = {
      "scopes": ['user', 'repo', 'gist', 'notifications'],
      "note": "admin_script",
      "client_id": NetConfig.CLIENT_ID,
      "client_secret": NetConfig.CLIENT_SECRET
    };
    String url = Address.getAuthorization();
    var result = await HttpManager.shared().post(url, params);
    return result;
  }
}