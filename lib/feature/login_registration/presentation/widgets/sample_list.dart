import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imu_survey_new/core/util/widgets.dart';

class SampleList extends StatelessWidget {
  List listOfItems = List.generate(20, (index) => 'Sample Item - $index');

  SampleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: labelHeaderWhite('Survey List'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/main_bg.png'),
              fit: BoxFit.cover,
              opacity: 0.3),
        ),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: listOfItems.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  // print('Tapped on item #$index');
                  Navigator.of(context).pushNamed('/survey');
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  child: Card(
                    elevation: 5,
                    shadowColor: Colors.black,
                    color: Colors.white,
                    child: SizedBox(
                      // width: width,
                      // height: (3/5 * width),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.asset(
                                'assets/images/imu_logo.png',
                                // fit: BoxFit.scaleDown,
                                height: 150,
                                width: 200,
                              ),
                            ),
                            Text('Survey Title ${listOfItems[index]}'),
                            Text('18 questions')
                          ],
                        ),
                      ),
                    ),
                  ),
                  // child: Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(listOfItems[index]),
                  //     Text('Sample subtitle for item $index'),
                  //   ],
                  // ),
                ),
              );
            }),
      ),
    );
  }
}
