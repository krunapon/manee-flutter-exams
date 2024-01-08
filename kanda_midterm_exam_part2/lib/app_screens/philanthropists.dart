import 'package:flutter/material.dart';
import 'philanthropist.dart';

class Philantropists extends StatelessWidget {
  final String title;
  const Philantropists({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body:Center(
                child:Column(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: const [
                      Philanthropist(name:"Andrew Carnegie",
                          imgURL:"https://y4p4e3d2.rocketcdn.me/wp-content/uploads/2016/08/biggest-philanthropist-ever-400x274.jpg",
                              donation:"\$297.8 billion"),
                      Philanthropist(name:"Bill and Melinda Gates",
                          imgURL:"https://content.fortune.com/wp-content/uploads/2019/04/gft05.19-bill-melinda-gates-a-square.jpg",
                          donation:"\$74 billion"),
                      Philanthropist(name:"Warren Buffet",
                          imgURL:"https://y4p4e3d2.rocketcdn.me/wp-content/uploads/2016/08/philanthrophy-400x225.jpg",
                        donation:"\$25 billion"),
                  ]
                )
            )
        );
    }
}