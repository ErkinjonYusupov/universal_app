import 'package:dio/dio.dart';
import 'package:universal_app/config/Imports.dart';
import 'package:universal_app/models/prayer_time_model.dart';

class HomeController extends GetxController {
  // https://cbu.uz/uz/arkhiv-kursov-valyut/json/
  Dio http = Dio();

  List<CurrensiesModel> currensies = [];

  bool loading = false;

  // metodlar
  // get  bu beckeddan ma'lumotlarni olib kelisda ishlatiladi
  // post  bu metod backendga malumotlar junatadi
  // put bu metod backendagi malumotni tahrirlab beradi
  // delete bu metod backendagi ma'lumotlarni o'chirib beradi

  fetchCurresies() async {
    try {
      loading = true;
      update();
      var res = await http.get('https://cbu.uz/uz/arkhiv-kursov-valyut/json/');
      currensies = currebsiesFromMap(res.data);
    } catch (err) {
      print(err);
    } finally {
      loading = false;
      update();
    }
  }

  List<String> cities = [
    "Toshkent",
    "Farg'ona",
    "Andijon",
    "Namangan",
    "Buxoro",
    "Qarshi",
    "Samarqand",
    "Navoiy",
    "Nukus",
    "Guliston",
    "Xiva",
    "Qo'qon",
  ];

  PrayerTimeModel? prayerTime;

  String selectCity = '';


  fetchPrayerTimes() async {
    try {
      times = [];
      loading = true;
      update();
      Get.to(() => const PrayerTime());
      var res = await http
          .get('https://islomapi.uz/api/present/day?region=$selectCity');
      prayerTime = PrayerTimeModel.fromJson(res.data);
      filterTime(prayerTime!.times);
    } catch (err) {
      Get.snackbar("Xatolik", "Ma'lumot topilmadi");
    } finally {
      loading = false;
      update();
    }
  }

   Map<String, dynamic> keys = {
    "tong_saharlik": "Bomdod namozi",
    "quyosh": "Quyosh",
    "peshin": "Peshin namozi",
    "asr": "Asr namozi",
    "shom_iftor": "Shom namozi",
    "hufton": "Xufton namozi",
  };

  filterText(String key) {
    return keys[key] ?? '';
  }


  List times = [];

  //bu funksiya obyektni listga aylantirib beradi
  filterTime(data) {
    data.forEach((key, value) {
      times.add( {"vaqt": key, "soat": value} );
    });
  }
}
