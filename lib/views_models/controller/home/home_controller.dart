import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/models/home/user_list_model.dart';
import 'package:getx_mvvm/repository/home_repository/home_repository.dart';

class HomeController extends GetxController {
  final _api = HomeRepository();
  final rxRequestState = Status.loading.obs;
  final userListModel = UserListModel().obs;

  void setRexRequestState(Status value) => rxRequestState.value = value;

  void setUserModel(UserListModel userList) => userListModel.value = userList;

  void userListApi() {
    _api.listApi().then((value) {
      setRexRequestState(Status.complete);
      setUserModel(value);
    }).onError((error, stackTrace) {});
  }
}
