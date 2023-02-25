import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project2/app/modules/dashboard/views/dashboard_view.dart';
import 'package:project2/app/utils/api.dart';
// import 'package:flutter/cupertino.dart  ';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final _getConnect = GetConnect();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final authToken = GetStorage();

  // final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  void loginNow() async {
    //fungsi loginNow() dgn deklarasi kata kunci async
    final response = await _getConnect.post(BaseUrl.auth, {
      //membuat variabel response yang dideklarasikan dengan kata kunci final, menggunakan fungsi _getConnect.post() untuk melakukan permintaan HTTP POST ke endpoint yang diberikan dalam konstanta BaseUrl.auth, dan mengirimkan email dan password yang dimasukkan pengguna dalam teks emailController dan passwordController. Respons HTTP disimpan dalam variabel response.
      "email": emailController.text, //mengirim email dr input emailController
      "password":
          passwordController.text, //mengirim pw dr input passwordController
    });

    if (response.body['success'] == true) {
      //struktur if-else untuk menentukan tindakan yang harus diambil berdasarkan respons yang diterima dari permintaan HTTP. Jika nilai kunci success dalam response.body adalah true, maka aplikasi menulis token akses yang diperoleh dari respons ke penyimpanan lokal menggunakan authToken.write().
      authToken.write("token", response.body['access_token']);
      authToken.write("full_name", response.body["full_name"]);
      Get.offAll(() =>
          const DashboardView()); //untuk berpindah halaman tanpa menampilkan halaman login kembali
    } else {
      //jika tdk, apk menampilkan pesan kesalahan menggunakan  get.snackbar()
      Get.snackbar(
        "Error", //parameter pesan yg ditampilkan dalam snackbar
        response.body['message']
            .toString(), //mengambil pesan kesalahan dari nilai kunci message dalam response.body
        icon: const Icon(Icons.error), //icon yg ditampilkan pd snackbar
        backgroundColor: Colors.red, //warna background snckbar
        colorText: Colors.white, //warna text pd snackbar
        forwardAnimationCurve: Curves.bounceIn, //kurva animasi pd snackbar
        margin: const EdgeInsets.only(
          //mengatur margin pd snackbar
          top: 10,
          left: 5,
          right: 5,
        ),
      );
    }
  }

  // void increment() => count.value++;
}

//* void: Tipe data kembalian dari metode _loginNow() adalah void, artinya tidak ada nilai yang dikembalikan dari metode tersebut.
//* async: Kata kunci yang menunjukkan bahwa metode _loginNow() menggunakan await untuk menunggu hasil dari sebuah operasi asinkron.
//* final response: Mendeklarasikan sebuah variabel response yang bertipe Response dan memiliki nilai awal berupa hasil dari permintaan HTTP POST ke endpoint API untuk autentikasi yang didefinisikan di BaseUrl.auth. Variabel ini bersifat final, artinya nilai variabel ini hanya dapat diinisialisasi satu kali.
//* await: Kata kunci yang digunakan untuk menunggu hasil operasi asinkron. Di sini, await digunakan untuk menunggu hasil dari operasi HTTP POST ke endpoint API.
//* _getConnect.post(...): Mengirim permintaan HTTP POST ke endpoint API dengan menggunakan objek _getConnect yang didapatkan dari package http. Parameter pertama adalah URL endpoint API yang ingin diakses dan parameter kedua adalah sebuah Map yang berisi data email dan password yang dikirimkan dalam permintaan HTTP POST.
//* emailController.text dan passwordController.text: Mengambil nilai dari dua buah TextField dengan menggunakan TextEditingController yang masing-masing disimpan di dalam variabel emailController dan passwordController. Nilai yang diambil adalah nilai teks yang saat ini dimasukkan ke dalam TextField tersebut.
//Dalam aplikasi, metode seperti _loginNow() dapat digunakan untuk mengatur dan mengirimkan permintaan HTTP ke endpoint API untuk melakukan proses autentikasi login. Data yang dikirimkan biasanya berisi email dan password yang dimasukkan oleh pengguna dalam form login. Setelah permintaan dikirimkan, respons yang diterima dapat diolah sesuai dengan kebutuhan aplikasi, seperti menampilkan pesan kesalahan jika login gagal atau mengambil data pengguna jika login berhasil.