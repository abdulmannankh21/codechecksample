import 'package:get/get.dart';
import '../models/users_list_model.dart';
import '../repo/api_status.dart';
import '../repo/user_services.dart';

class UsersViewModel extends GetxController {
  RxBool _loading = false.obs;
  RxList<UserModel> _usersListModel = <UserModel>[].obs;

  bool get loading => _loading.value;
  List<UserModel> get usersListModel => _usersListModel.toList();

  @override
  void onInit() {
    super.onInit();
    getUsers();
  }

  void setLoading(bool loading) {
    _loading.value = loading;
  }

  void setUsersListModel(List<UserModel> usersListModel) {
    _usersListModel.assignAll(usersListModel);
  }

  void getUsers() async {
    setLoading(true);
    var response = await UserServices.getUsers();
    if (response is Success) {
      setUsersListModel(response.response as List<UserModel>);
    }
    setLoading(false);
  }
}
