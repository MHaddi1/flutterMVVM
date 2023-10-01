import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/models/home/user_list_model.dart';
import 'package:getx_mvvm/repository/home_repository/home_repository.dart';

class HomeController extends GetxController {
  final _api = HomeRepository();
  final rxRequestState = Status.loading.obs;
  final userListModel = UserListModel().obs;
  RxString error = "".obs;

  void setRexRequestState(Status value) => rxRequestState.value = value;

  void setUserModel(UserListModel userList) => userListModel.value = userList;

  void setError(String value) => error.value = value;

  void userListApi() {
    //setRexRequestState(Status.loading);
    _api.listApi().then((value) {
      
      setRexRequestState(Status.complete);
      setUserModel(value);
    }).onError((error, stackTrace) {
      setRexRequestState(Status.error);
      setError(error.toString());
    });
  }

    void refreshAPi() {
    setRexRequestState(Status.loading);
    _api.listApi().then((value) {
      
      setRexRequestState(Status.complete);
      setUserModel(value);
    }).onError((error, stackTrace) {
      setRexRequestState(Status.error);
      setError(error.toString());
    });
  }
}
