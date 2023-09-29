import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/views_models/controller/home/home_controller.dart';
import 'package:getx_mvvm/views_models/controller/user_preference/user_preference_view_model.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserPreference userPreference = UserPreference();
  final homeController = Get.put(HomeController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.gray300,
      appBar: AppBar(
        leading: const Icon(null),
        centerTitle: true,
        title: 'home'.tr.text.make(),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              Get.defaultDialog(
                title: "logout".tr,
                middleText: "logout_message".tr,
                confirm: TextButton(
                  onPressed: () {
                    userPreference.removeUser().then((value) {
                      Get.offAllNamed(RoutesName.loginScrren);
                    });
                  },
                  child: Text("ok".tr),
                ),
                cancel: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('cancel'.tr)),
              );
            },
          ),
        ],
      ),
      body: Obx(() {
        switch (homeController.rxRequestState.value) {
          case Status.loading:
            {
              return const CircularProgressIndicator().centered();
            }
          case Status.error:
            {
              return "Something Went Wrong".text.make().centered();
            }
          case Status.complete:
            {
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: homeController.userListModel.value.data!.length,
                  itemBuilder: ((context, index) {
                    return Card(
                      color: Vx.white,
                      child: ListTile(
                        title: homeController
                            .userListModel.value.data![index].firstName
                            .toString()
                            .text
                            .make(),
                        subtitle: homeController
                            .userListModel.value.data![index].email
                            .toString()
                            .text
                            .make(),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(homeController
                              .userListModel.value.data![index].avatar
                              .toString()),
                        ),
                      ),
                    ).px8().py4();
                  }));
            }
        }
      }),
    );
  }
}
