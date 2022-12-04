import 'package:get/get.dart';

import '../model/users_error.dart';
import '../model/users_list_model.dart';
import '../repo/api_status.dart';
import '../repo/user_services.dart';

class UsersViewModel extends GetxController {
  // final fruit = Fruit().obs;
  // void changeFruit(String newFruit) {
  //   fruit.update((thisFruit) {
  //     thisFruit!.name = newFruit;
  //   });
  // }
  bool _loading = false;
  List<UserModel> _userListModel = [];
  UserError? _userError;

  bool get loading => _loading;
  UserError? get userError => _userError;

  List<UserModel> get userListModel => _userListModel;

  UsersViewModel() {
    getUser();
  }
  setLoding(bool loading) {
    _loading = loading;
    update();
  }

  setuserListModel(List<UserModel> userListModel) {
    _userListModel = userListModel;
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  getUser() async {
    setLoding(true);
    var response = await UserServices.getUser();
    if (response is Success) {
      setuserListModel(response.responce as List<UserModel>);
    }
    if (response is Failure) {
      print('in_false');
      UserError userError =
          UserError(code: response.code, message: response.errorResponce);
      setUserError(userError);
    }
    setLoding(false);
    print('in_succ');
  }
}