import 'package:getx_mvvm/data/network/network_api_services.dart';
import 'package:getx_mvvm/models/home/user_list_model.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';

class HomeRepository {
  final NetworkApiService _networkApiService = NetworkApiService();
  Future<UserListModel> listApi() async {
    dynamic response = await _networkApiService.getApi(AppUrl.userListApi);
    return UserListModel.fromJson(response);
  }
}
