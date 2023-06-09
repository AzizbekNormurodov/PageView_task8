import 'package:flutter/material.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  int currentindex = 0;
  final pagecontroller = PageController();
  List title_3 = [
    "Большой ассортимент",
    "Экономьте время",
    "Быстрая доставка"
  ];
  List title_4 = [
    "Большой ассортимент с ваших любимих\c сетей" ,
    "Теперь не нужно посещать гипермаркеты, \n  рестораны и магазины мы сделаем \n это за вас",
    "Доставка в удобное для вас время"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Visibility(
            visible: currentindex != 2,
            child: InkWell(
              onTap: () {},
              child: const Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Пропустить",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 500,
              child: PageView.builder(
                controller: pagecontroller,
                onPageChanged: (index) {
                  setState(() {
                    currentindex = index;
                  });
                },
                itemCount: 3,
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      Image.asset("assets/${(index + 4)}.png"),
                      SizedBox(
                        height: 30,
                      ),
                      Text("${(title_3[index])}"),
                      SizedBox(
                        height: 30,
                      ),
                      Text("${(title_4[index])}"),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
              child: Center(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    return AnimatedContainer(
                      height: 6,
                      width: 6,
                      duration: Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: index == currentindex ? Colors.red : Colors.grey,
                      ),
                    );
                  },
                  separatorBuilder: (_, __) {
                    return SizedBox(
                      height: 4,
                    );
                  },
                  itemCount: 3,
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () {
            nextPage();
          },
          child: Text(
            currentindex == 2 ? "Готово" : "Далее",
          ),
        ),
      ),
    );
  }

  void nextPage() {
    if (currentindex == 2) {}
    pagecontroller.animateToPage(currentindex,
        duration: const Duration(milliseconds: 300), curve: Curves.decelerate);
  }
}