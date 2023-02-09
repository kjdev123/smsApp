import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imu_survey_new/core/util/widgets.dart';

import '../../../survey/data/survey_list_model.dart';

class SampleList extends StatefulWidget {
  late List<Survey> surveyListModel;
  final Map<String, dynamic> result;

  SampleList({Key? key, required this.result}) : super(key: key);

  @override
  State<SampleList> createState() => _SampleListState();
}

class _SampleListState extends State<SampleList> {
  // List listOfItems = List.generate(20, (index) => 'Sample Item - $index');

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    widget.surveyListModel = widget.result['survey'];
    return Scaffold(
      appBar: AppBar(
        title: labelHeaderWhite('Survey List'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/main_bg.png'), fit: BoxFit.cover, opacity: 0.3),
        ),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: widget.surveyListModel.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  // print('Tapped on item #$index');
                  Navigator.of(context).pushNamed('/survey');
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    shadowColor: Colors.black,
                    color: Colors.white,
                    child: ClipPath(
                      clipper:
                          ShapeBorderClipper(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Image.network(
                              'https://alumni.imu.edu.my/wp-content/uploads/2022/07/about-imu-alumni.jpg',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text('${widget.surveyListModel[index].name}'),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text('${widget.surveyListModel[index].count} questions'),
                          const SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                    // child:
                  ),
                ),
              );
            }),
      ),
    );
  }
}
