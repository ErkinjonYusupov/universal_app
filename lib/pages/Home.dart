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
        body: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                const Text(
                  "Hammasi bittada",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 24),
                 HomeButton(
                  icon: Icons.attach_money,
                  text: "Namoz vaqtlari",
                  subtitle: "Besh vaqt Nomoz vaqtlarini bilish uchun kiring",
                  image: AppImages.masjid,
                  colors: [AppColors.red, AppColors.violet],
                  textColor: Colors.white,
                  onTap: () {
                    Get.to(()=> const Cities());
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
                    Get.to(()=>const Currensies());
                  },
                ),
               
                HomeButton(
                  icon: Icons.attach_money,
                  text: "Elektron tasbeh",
                  subtitle: "Har kuni zikr aytishni unutmang",
                  image: AppImages.money,
                  colors: [AppColors.violet, AppColors.pink],
                  textColor: Colors.white,
                  onTap: () {
                    Get.to(()=> const TasbehMain());
                  },
                ),
                HomeButton(
                  icon: Icons.attach_money,
                  text: "Mahsulotlar",
                  subtitle: "Eng arzon va hamyonbop mahsulotlar sizlar uchun",
                  image: AppImages.money,
                  colors: [AppColors.pink, AppColors.yellow],
                  textColor: Colors.white,
                  onTap: () {
                    Get.to(()=> const Products());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
