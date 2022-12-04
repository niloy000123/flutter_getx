import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/app_loding.dart';
import '../component/user_list_row.dart';
import '../model/users_list_model.dart';
import '../view_model/users_view_model.dart';

class HomeScreen extends GetWidget<UsersViewModel> {
  HomeScreen({super.key});
  final usersViewModel = Get.put(UsersViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Container(
        child: _ui(usersViewModel),
      ),
    );
  }

  _ui(UsersViewModel usersViewModel) {
    if (usersViewModel.loading) {
      return AppLoading();
    }
    if (usersViewModel.userError != null) {
      return Container(
        child: Text(usersViewModel.userError!.message.toString()),
      );
    }
    return Column(
      children: [
        ...List.generate(
          usersViewModel.userListModel.length,
          (index) {
            UserModel userModel = usersViewModel.userListModel[index];
            return UserListRow(userModel: userModel, onTap: () async {});
          },
        )
      ],
    );
  }
}
