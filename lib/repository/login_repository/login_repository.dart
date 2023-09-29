import 'package:getx_mvvm/data/network/network_api_services.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';

class LoginRepository {
  final _networkApiService = NetworkApiService();
  Future<dynamic> loginApi(var data) async {
    dynamic response = await _networkApiService.postApi(data, AppUrl.loginApi);
    return response;
  }
}
