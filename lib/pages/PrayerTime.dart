import 'package:universal_app/config/Imports.dart';

class PrayerTime extends StatefulWidget {
  const PrayerTime({super.key});

  @override
  State<PrayerTime> createState() => _PrayerTimeState();
}

class _PrayerTimeState extends State<PrayerTime> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: Text("${controller.selectCity} vaqti bilan")),
          body: controller.loading
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(controller.prayerTime!.date,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600)),
                            Text(controller.prayerTime!.weekday,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600))
                          ]),
                      const Divider(),
                      Column(
                        children:
                            List.generate(controller.times.length, (index) {
                          var item = controller.times[index];
                          return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(controller.filterText(item['vaqt']),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600)),
                                    Text(item['soat'],
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600))
                                  ]));
                        }),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
