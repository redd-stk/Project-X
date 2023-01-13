import 'package:flutter/material.dart';

import '../../constants.dart';

class Body extends StatelessWidget {
  Body({super.key});

  final List<Map> myGrid =
      List.generate(4, (index) => {"id": index, "name": "Grid $index"})
          .toList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        // padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(height: SizeConfig.screenHeight! * 0.0005),
              SizedBox(
                height: 220,
                child: PageView.builder(
                    itemCount: 5,
                    itemBuilder: (context, position) {
                      return homeCarousel();
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  height: 300,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 220,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15),
                      itemCount: myGrid.length,
                      itemBuilder: ((context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: appPrimaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        );
                      })),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget homeCarousel() {
  return Container(
    height: 220,
    margin: const EdgeInsets.only(left: 5, right: 5),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(25),
    ),
  );
}
