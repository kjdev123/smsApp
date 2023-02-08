import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SurveyListCard extends StatefulWidget {
  const SurveyListCard({Key? key}) : super(key: key);

  @override
  State<SurveyListCard> createState() => _SurveyListCardState();
}

class _SurveyListCardState extends State<SurveyListCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 50,
            shadowColor: Colors.black,
            color: Colors.white,
            child: SizedBox(
              width: 400,
              height: (2 / 3 * width),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/imu_logo.png',
                      height: 150,
                      width: 200,
                    ),
                    Text('Survey Title'),
                    Text('18 questions')
                  ],
                  // children: [
                  //   CircleAvatar(
                  //     backgroundColor: Colors.green[500],
                  //     radius: 108,
                  //     child: const CircleAvatar(
                  //       backgroundImage: NetworkImage(
                  //           "https://media.geeksforgeeks.org/wp-content/uploads/20210101144014/gfglogo.png"), //NetworkImage
                  //       radius: 100,
                  //     ), //CircleAvatar
                  //   ), //CircleAvatar
                  //   const SizedBox(
                  //     height: 10,
                  //   ), //SizedBox
                  //   Text(
                  //     'GeeksforGeeks',
                  //     style: TextStyle(
                  //       fontSize: 30,
                  //       color: Colors.green[900],
                  //       fontWeight: FontWeight.w500,
                  //     ), //Textstyle
                  //   ), //Text
                  //   const SizedBox(
                  //     height: 10,
                  //   ), //SizedBox
                  //   const Text(
                  //     'GeeksforGeeks is a computer science portal for geeks at geeksforgeeks.org. It contains well written, well thought and well explained computer science and programming articles, quizzes, projects, interview experiences and much more!!',
                  //     style: TextStyle(
                  //       fontSize: 15,
                  //       color: Colors.green,
                  //     ), //Textstyle
                  //   ), //Text
                  //   const SizedBox(
                  //     height: 10,
                  //   ), //SizedBox
                  //   SizedBox(
                  //     width: 100,
                  //
                  //     child: ElevatedButton(
                  //       onPressed: () => 'Null',
                  //       style: ButtonStyle(
                  //           backgroundColor:
                  //           MaterialStateProperty.all(Colors.green)),
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(4),
                  //         child: Row(
                  //           children: const [
                  //             Icon(Icons.touch_app),
                  //             Text('Visit')
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     // RaisedButton is deprecated and should not be used
                  //     // Use ElevatedButton instead
                  //
                  //     // child: RaisedButton(
                  //     //   onPressed: () => null,
                  //     //   color: Colors.green,
                  //     //   child: Padding(
                  //     //     padding: const EdgeInsets.all(4.0),
                  //     //     child: Row(
                  //     //       children: const [
                  //     //         Icon(Icons.touch_app),
                  //     //         Text('Visit'),
                  //     //       ],
                  //     //     ), //Row
                  //     //   ), //Padding
                  //     // ), //RaisedButton
                  //   ) //SizedBox
                  // ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
