import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project2/app/modules/dashboard/views/dashboard_view.dart';
import 'package:project2/app/modules/login/views/login_view.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  late Timer _pindah;
  final authToken = GetStorage();

  @override
  void onInit() {
    _pindah = Timer.periodic(
      //timer periodic : fungsi bawaan dart yg menerima 2 argumen
      const Duration(seconds: 4),
      (timer) => authToken.read("token") == null
      //authToken.read('token') digunakan untuk membaca nilai token dari penyimpanan lokal, kemudian dilakukan pengkondisian jika nilai token null, maka layar saat ini akan dipindahkan ke layar LoginView(), jika tidak null maka akan dipindahkan ke layar DashboardView().
      ? Get.off(
        //fungsi get off untuk memindahkan layar saat ini ke layar lain
        () =>
            const LoginView(), //parameter pertama : fungsi anonim yg akan mengembalikan loginview (digunakan untuk menentukan layar yang akan dipindahkan ke layar loginview)
        transition: Transition
            .leftToRight, //konfigurasi ini menentukan bagaimana transisi antara layar saat ini dan layar tujuan yang akan ditampilkan
      )
      : Get.off(() => const DashboardView()),
    );
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _pindah
        .cancel(); //cancel untuk menghentikan timer yang sdg berjalan (untuk menghentikan pengulangan perpindahan tampilan)
    super.onClose();
  }
}
