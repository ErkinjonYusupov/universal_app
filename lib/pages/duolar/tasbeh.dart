import 'package:flutter/material.dart';
import 'package:universal_app/config/Imports.dart';
import 'package:universal_app/stores/tasbeh_controller.dart';

class Tasbeh extends StatefulWidget {
  const Tasbeh({super.key});

  @override
  State<Tasbeh> createState() => _TasbehState();
}

class _TasbehState extends State<Tasbeh> {
  TasbehController controller = Get.put(TasbehController());
  @override
  void initState() {
    controller.selected = Get.arguments;
    controller.check();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TasbehController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(controller.selected),
          ),
          body: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Center(
                child: Column(children: [
                  Text(
                    controller.duolar[controller.selected]['title'],
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w700)
                  ),
                  Text(
                      "${"'Ma'nosi: " + controller.duolar[controller.selected]['text']}'",
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center),
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      Image.asset(AppImages.rounded,
                          width: 320, fit: BoxFit.cover),
                      Positioned.fill(
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                  controller.duolar[controller.selected]
                                          ['count']
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w600))))
                    ],
                  ),
                  const SizedBox(height: 50),
                  TasbehButton(
                      color: Colors.green,
                      text: "Hisoblash",
                      onTap: () {
                        controller.addCount();
                      }),
                  const SizedBox(height: 24),
                  TasbehButton(
                      color: Colors.red,
                      text: "Qayta o'rnatish",
                      onTap: () {
                        controller.reset();
                      })
                ]),
              ),
            ),
          ),
        );
      },
    );
  }
}

class TasbehButton extends StatelessWidget {
  String text;
  Color color;
  Function onTap;
  TasbehButton({
    super.key,
    required this.color,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 24),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(30)),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    );
  }
}
