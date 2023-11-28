import 'package:universal_app/config/Imports.dart';
import 'package:universal_app/pages/duolar/tasbeh.dart';
import 'package:universal_app/stores/tasbeh_controller.dart';

class TasbehMain extends StatefulWidget {
  const TasbehMain({super.key});

  @override
  State<TasbehMain> createState() => _TasbehMainState();
}

class _TasbehMainState extends State<TasbehMain> {
  TasbehController controller = Get.put(TasbehController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Elektron tasbeh"),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TasbehButton(title: "Subhanalloh"),
              TasbehButton(title: "Alhamdulillah"),
              TasbehButton(title: "Allohu akbar"),
            ],
          ),
        ),
      ),
    );
  }
}

class TasbehButton extends StatelessWidget {
  String title;
  TasbehButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const Tasbeh(), arguments: title);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
