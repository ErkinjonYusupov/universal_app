import 'package:universal_app/config/Imports.dart';

class Currensies extends StatefulWidget {
  const Currensies({super.key});

  @override
  State<Currensies> createState() => _CurrensiesState();
}

class _CurrensiesState extends State<Currensies> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: const Text("Valyuta kurslari")),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: 
              controller.loading ? const Center(child: CircularProgressIndicator()):
              Column(
                children: List.generate(controller.currensies.length, (index) {
                  var item = controller.currensies[index];
                  return ListTile(
                    title: Text.rich(TextSpan(
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                        children: [
                          TextSpan(text: "${item.Nominal} "),
                          TextSpan(text: item.CcyNm_UZ)
                        ])),
                    subtitle: Text(item.Date),
                    trailing: Text(
                      item.Rate,
                      style:
                          const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  );
                }),
              ),
            ),
          ),
        );
      },
    );
  }
}
// "Nominal" -> "1"
// "Rate" -> "12270.10"
// "Date" -> "17.11.2023"
// "CcyNm_UZ"

