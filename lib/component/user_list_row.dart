import 'package:flutter/material.dart';

import '../model/users_list_model.dart';

class UserListRow extends StatelessWidget {
  const UserListRow({super.key, required this.userModel, required this.onTap});
  final UserModel userModel;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 3,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name : ${userModel.name!}',
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(
                height: 5,
              ),
              Text('Email : ${userModel.email!}'),
            ],
          ),
        ),
      ),
    );
  }
}
