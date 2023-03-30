import 'package:dio/dio.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import '../helpers/helpers.dart';

import '../models/models.dart';

class UserRepo {
  Future<User> signUp(User user) async {
    final parseObj = ParseUser(user.email, user.senha, user.email);

    parseObj.set<String>('name', user.name!);
    parseObj.set<String>('phone', user.phone!);
    parseObj.set('type', user.type.index);

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

      QueryBuilder<ParseUser> queryUsers =
          QueryBuilder<ParseUser>(ParseUser.forQuery());

      queryUsers.whereEqualTo('objectId', pUser.objectId);

      queryUsers.includeObject([
        'matriculas',
        'matriculas.turma',
        'matriculas.owner',
        'matriculas.turma.escola'
      ]);

      final ret = await queryUsers.query();

      return User.fromJson(ret.result.first.objectId, ret.result.first.toJson(),
          obj: ret.result.first);
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Future<void> logout() async {
    final parseObj = await ParseUser.currentUser() as ParseUser?;
    await parseObj!.logout(deleteLocalUserData: true);
  }

  Future<User?> currentUser() async {
    final parseObj = await ParseUser.currentUser() as ParseUser?;
    if (parseObj == null) {
      return null;
    }

    final ParseResponse? response =
        await ParseUser.getCurrentUserFromServer(parseObj.sessionToken!);

    if (response?.success == null || !response!.success) {
      await parseObj.logout(deleteLocalUserData: true);
      return null;
    } else {
      ParseUser p = response.result;

      QueryBuilder<ParseUser> queryUsers =
          QueryBuilder<ParseUser>(ParseUser.forQuery());

      queryUsers.whereEqualTo('objectId', p.objectId);

      queryUsers.includeObject([
        'matriculas',
        'matriculas.turma',
        'matriculas.owner',
        'matriculas.turma.escola'
      ]);

      final ret = await queryUsers.query();

      return User.fromJson(ret.result.first.objectId, ret.result.first.toJson(),
          obj: ret.result.first);
    }
  }

  Future<List<User>?> getUsers() async {
    QueryBuilder<ParseUser> queryUsers =
        QueryBuilder<ParseUser>(ParseUser.forQuery());

    queryUsers
        .includeObject(['matriculas', 'matriculas.turma', 'matriculas.owner']);
    final ParseResponse apiResponse = await queryUsers.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results
          ?.map((e) => User.fromJson(e.objectId!, e.toJson(), obj: e))
          .toList();
    } else {
      return [];
    }
  }

  Future<void> atualizarMatriculas(User user) async {
    final ParseUser u = ParseUser.forQuery();
    u.objectId = user.id;

    final q = QueryBuilder<ParseObject>(ParseObject('Matriculas'));
    q.whereEqualTo('email', user.email);

    final ParseResponse apiResponse = await q.query();

    if (apiResponse.success && apiResponse.results != null) {
      List<ParseObject> matList = apiResponse.results as List<ParseObject>;

      u.set<List<ParseObject>>('matriculas', matList);
      final retUpdateUser = await u.update();
      if (retUpdateUser.success && retUpdateUser.results != null) {}
    }
  }

  Future<void> save(User u) async {
    final curentUser = await ParseUser.currentUser() as ParseUser?;

    if (curentUser != null) {
      curentUser.set<String>('name', u.name!);
      curentUser.set<String>('phone', u.phone!);
      curentUser.set<int>('type', u.type.index);

      if (u.senha != null) {
        curentUser.password = u.senha;
      }

      final response = await curentUser.save();
      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
      if (u.senha != null) {
        await curentUser.logout();

        final loginRes = await ParseUser(u.email, u.senha, u.email).login();
        if (!loginRes.success) {
          return Future.error(ParseErrors.getDescription(loginRes.error!.code));
        }
      }
    }
  }
}
