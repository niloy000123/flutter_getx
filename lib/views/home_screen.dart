import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/app_loding.dart';
import '../component/user_list_row.dart';
import '../model/users_list_model.dart';
import '../view_model/users_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 196, 196, 196),
      appBar: AppBar(
        title: const Text('Flutter Getx'),
      ),
      body: GetBuilder<UsersViewModel>(
          init: UsersViewModel(), builder: (controller) => _ui(controller)),
    );
  }

  _ui(UsersViewModel usersViewModel) {
    if (usersViewModel.loading) {
      return const AppLoading();
    }
    if (usersViewModel.userError != null) {
      return Text(usersViewModel.userError!.message.toString());
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(
            usersViewModel.userListModel.length,
            (index) {
              UserModel userModel = usersViewModel.userListModel[index];
              return UserListRow(userModel: userModel, onTap: () async {});
            },
          )
        ],
      ),
    );
  }
}
