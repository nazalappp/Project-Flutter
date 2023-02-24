import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Scaffold(
      //membuat halaman dengan widget scaffold
      backgroundColor: HexColor(
          "#feeee8"), //memberikan background tampilan dengan kode warna hexadesimal
      body: SingleChildScrollView(
        //menambahkan singlechildscrollview untuk membuat halaman bisa di scroll
        child: Column(
          //membungkus widget dgn column agar dpt menampilkan widget scr vertikal/kebawah
          children: [
            //menambah animasi lottie dgn menambah file dr url
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Lottie.network(
                "https://gist.githubusercontent.com/olipiskandar/2095343e6b34255dcfb042166c4a3283/raw/d76e1121a2124640481edcf6e7712130304d6236/praujikom_kucing.json",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              //menambah textfield untuk mengambil input email
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(), //memberikan border pd textfield
                  labelText: "Email", //memberikan label pd textfield
                  hintText: "Masukan Email", //memberikan hinttext pd textfield
                ),
              ),
            ),
            Padding(
              //menambahkan textfield untuk mengambil input password
              padding: EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                top: 15,
                bottom: 0,
              ),
              child: TextField(
                controller: controller.passwordController,
                obscureText: true, //mengubah text input menjadi pw
                decoration: InputDecoration(
                  border: OutlineInputBorder(), //memberikan border pd textfield
                  labelText: "Password", //memberikan label pd textfield
                  hintText:
                      "Masukan Password", //memberikan hinttext pd textfield
                ),
              ),
            ),
            const SizedBox(
              //menambahkan tombol login
              height: 10,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.blue, //memberikan warna pd background container
                borderRadius: BorderRadius.circular(
                    20), //memberikan radius border pd container
              ),
              child: TextButton(
                //memberikan aksi ketika tombol login ditekan
                onPressed: () {
                  controller.loginNow();
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white, //memberikan warna pd text tombol
                    fontSize: 25, //mengukur ukuran font pd text yg ada ditombol
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
