import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/users_list_model.dart';
import '../view_models/user_view_models.dart';

class HomeScreen extends GetView<UsersViewModel> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = Get.find<UsersViewModel>();

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Obx(() {
              if (usersViewModel.loading) {
                return CircularProgressIndicator(
                  color: Colors.red,
                );
              } else {
                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      UserModel userModel = usersViewModel.usersListModel[index];
                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(userModel.name),
                            Text(userModel.email),
                            Text(userModel.phone),
                            Text(userModel.username),
                            Text(userModel.website),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: usersViewModel.usersListModel.length,
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}