import 'package:universal_app/config/Imports.dart';

class TasbehController extends GetxController {
  String selected = '';
  Map<String, dynamic> duolar = {
    "Subhanalloh": {
      "id": 1,
      "title": "Subhanalloh",
      "text": "Allohni poklab yod qilaman",
      "count": 0
    },
    "Alhamdulillah": {
      "id": 1,
      "title": "Alhamdulillah",
      "text": "Allohga hamd bo'lsin",
      "count": 0
    },
    "Allohu akbar": {
      "id": 1,
      "title": "Allohu akbar",
      "text": "Alloh buyuk",
      "count": 0
    },
    "Astag'firulloh": {
      "id": 1,
      "title": "Astag'firulloh",
      "text": "Alloh kechirsin",
      "count": 0
    },
  };

  addCount() {
    duolar[selected]['count']++;
    GetStorage().write(selected, duolar[selected]['count']);
    update();
  }

  check() {
    int count = GetStorage().read(selected) ?? 0;
    duolar[selected]['count'] = count;
    update();
  }

  reset() {
    if (duolar[selected]['count'] == 0) return;
    GetStorage().remove(selected);
    duolar[selected]['count'] = 0;
    update();
  }
}
