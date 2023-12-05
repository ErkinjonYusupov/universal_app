import 'dart:ui';

import 'package:universal_app/config/Imports.dart';
import 'package:universal_app/pages/duolar/tasbeh_main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: Center(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              constraints: const BoxConstraints(maxWidth: 500),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color.fromRGBO(89, 236, 255, 1),
                    Color.fromRGBO(11, 123, 251, 1),
                  ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Text("Hammasi bittada",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.pink)),
                  const SizedBox(height: 24),
                  HomeButton(
                    icon: Icons.attach_money,
                    text: "Namoz vaqtlari",
                    subtitle: "Besh vaqt Namoz vaqtlarini bilish uchun kiring",
                    image: AppImages.masjid,
                    colors: [AppColors.red, AppColors.violet],
                    textColor: Colors.white,
                    onTap: () {
                      Get.to(() => const Cities());
                    },
                  ),
                  HomeButton(
                      icon: Icons.attach_money,
                      text: "Valyutalar kursi",
                      subtitle:
                          "Real vaqt davomida valyuta kurslaridan habardor bo'ling",
                      image: AppImages.money,
                      colors: [AppColors.blue, AppColors.pink],
                      textColor: Colors.white,
                      onTap: () {
                        controller.fetchCurresies();
                        Get.to(() => const Currensies());
                      }),
                  HomeButton(
                      icon: Icons.attach_money,
                      text: "Elektron tasbeh",
                      subtitle: "Har kuni zikr aytishni unutmang",
                      image: AppImages.tasbeh,
                      colors: [AppColors.violet, AppColors.pink],
                      textColor: Colors.white,
                      onTap: () {
                        Get.to(() => const TasbehMain());
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
