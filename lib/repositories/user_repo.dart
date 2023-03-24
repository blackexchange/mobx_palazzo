import 'package:parse_server_sdk/parse_server_sdk.dart';
import '../helpers/helpers.dart';

import '../models/models.dart';

class UserRepo {
  Future<User> signUp(User user) async {
    final parseObj = ParseUser(user.email, user.senha, user.email);

    parseObj.set<String>('name', user.name);
    parseObj.set<String>('phone', user.phone);
    parseObj.set('type', user.type?.index);

    final response = await parseObj.signUp();

    if (response.success) {
      ParseUser pUser = response.result;
      final User userParsed = User.fromJson(pUser.objectId!, pUser.toJson());

      return userParsed;
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Future<User> signIn(String email, String senha) async {
    final parseObj = ParseUser(email, senha, null);

    final response = await parseObj.login();

    if (response.success) {
      ParseUser pUser = response.result;
      final User userParsed = User.fromJson(pUser.objectId!, pUser.toJson());

      return userParsed;
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Future<User?> currentUser() async {
    final parseObj = await ParseUser.currentUser() as ParseUser?;
    if (parseObj == null) {
      return null;
    }

    final ParseResponse? response =
        await ParseUser.getCurrentUserFromServer(parseObj.sessionToken!);

    if (response?.success == null || !response!.success) {
      await parseObj.logout();
      return null;
    } else {
      return User.fromJson(response.result.objectId!, response.result.toJson());
    }
  }
}
