import 'package:universal_app/config/Imports.dart';
import 'package:universal_app/stores/home_controller.dart';

class PrayerTime extends StatefulWidget {
  const PrayerTime({super.key});

  @override
  State<PrayerTime> createState() => _PrayerTimeState();
}

class _PrayerTimeState extends State<PrayerTime> {
  HomeController controller = Get.put(HomeController());

  List times = [];
//bu funksiya obyektni listga aylantirib beradi
  filterTime(data) {
    data.forEach((key, value) {
      times.add({"vaqt": key, "soat": value});
    });
  }

// page ishga tushishi bilan ishlatib yuboradi
  @override
  void initState() {
    filterTime(controller.prayerTime['times']);
    super.initState();
  }

  // bu funksiya filter qilib beradi yani texti o'zgartirib beradi
  // String filterText(String key) {
  //   switch (key) {
  //     case "tong_saharlik":
  //       return "Bomdod nomozi";
  //     case "quyosh":
  //       return "Quyosh";
  //     case "peshin":
  //       return "Peshin nomozi";
  //     case "asr":
  //       return "Asr nomozi";
  //     case "shom_iftor":
  //       return "Shom nomozi";
  //     case "hufton":
  //       return "Hufton nomozi";
  //     default:
  //       return "";
  //   }
  // }
  Map<String, dynamic> keys = {
    "tong_saharlik": "Bomdod nomozi",
    "quyosh": "Quyosh",
    "peshin": "Peshin nomozi",
    "asr": "Asr nomozi",
    "shom_iftor": "Shom nomozi",
    "hufton": "Hufton nomozi",
  };
  filterText(String key) {
    return keys[key] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${controller.selectCity} vaqti bilan"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  controller.prayerTime['date'],
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(
                  controller.prayerTime['weekday'],
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                )
              ],
            ),
            const Divider(),
            Column(
              children: List.generate(times.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        filterText(times[index]['vaqt']),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        times[index]['soat'],
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
