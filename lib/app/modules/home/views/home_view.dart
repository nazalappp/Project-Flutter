import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController()); //membuat instance dr HomeControllier dan menyimpan di dlm getX
                                //menggunakan get put dan menyimpan di dlm getX, sehingga instance dr homecontroller bs diakses dr mana saja dlm aplikasi menggunakan getX
    return Scaffold(  //Membuat struktur utama tampilan aplikasi memakai widget scaffold
      backgroundColor: HexColor('#feeee8'), //nentuin warna background scaffold dgn code warna heksadesimal
      body: Center( //membuat widget center sbg container untuk widget column
        child: Column( //membuat widget column sbg tampilan vertikal
          mainAxisAlignment: MainAxisAlignment.center, //menentukan posisi tampilan vertikal pd tengah halaman
          crossAxisAlignment: CrossAxisAlignment.center, //menentukan posisi tampilan horizontal pd tengah halaman
          children: [ //widget turunan dr widget column
            Lottie.network( //widget lottie utk menampilkan animasi lottie dgn sumber internet karna network bukan asset
              "https://gist.githubusercontent.com/olipiskandar/2095343e6b34255dcfb042166c4a3283/raw/d76e1121a2124640481edcf6e7712130304d6236/praujikom_kucing.json",
              fit: BoxFit.cover, //menentukan ukuran dan posisi animasi pd tampilan
            ),
            const SizedBox( //widget sizedbox utk memberikan jarak antar widget
              height: 15, //menentukan jarak vertikal antara widget lottie dan text
            ),
            Text( //widget text untuk menampilan text pd tampilan
              "Aplikasi Portal Berita Indonesia", //isi text
              style: GoogleFonts.roboto( //menggunakan font google roboto pd widget text
                textStyle: const TextStyle( //styling text pd widget text
                  fontWeight: FontWeight.bold, //nentuin ketebelan text
                  fontSize: 30, //nentuin ukuran text
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
