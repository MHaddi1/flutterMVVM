import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/res/components/general_exception.dart';
import 'package:getx_mvvm/res/components/internet_exceptions_widgets.dart';
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
      backgroundColor: Vx.blue200,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              print(homeController.error.value);
              if (homeController.error.value ==
                  "TimeoutException after 0:00:10.000000: Future not completed") {
                return InternetExceptionsWidgets(onPress: () {
                  homeController.refreshAPi();
                });
              } else {
                return GeneralExceptionsWidgets(onPress: () {
                  homeController.refreshAPi();
                });
              }
            }
          case Status.complete:
            {
              return [
                VxSwiper.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: homeController.userListModel.value.data!.length,
                    itemBuilder: ((context, index) {
                      return Card(
                        child: VStack([
                          CircleAvatar(
                            radius: 70,
                            backgroundImage: NetworkImage(homeController
                                .userListModel.value.data![index].avatar
                                .toString()),
                          ).centered().px12().py8(),
                          homeController
                              .userListModel.value.data![index].firstName
                              .toString()
                              .text
                              .semiBold
                              .size(18)
                              .makeCentered(),
                          homeController.userListModel.value.data![index].email
                              .toString()
                              .text
                              .size(16)
                              .makeCentered(),
                        ]),
                      );
                    })),
                20.heightBox,
                SizedBox(
                  height: Get.height * 0.55,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount:
                          homeController.userListModel.value.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(homeController
                                  .userListModel.value.data![index].avatar
                                  .toString()),
                            ),
                            title: homeController
                                .userListModel.value.data![index].firstName
                                .toString()
                                .text
                                .semiBold
                                .size(18)
                                .make(),
                            subtitle: homeController
                                .userListModel.value.data![index].email
                                .toString()
                                .text
                                .make(),
                          ),
                        );
                      }),
                )
              ].vStack().scrollVertical().h(Get.height);
            }
        }
      }),
    );
  }
}
