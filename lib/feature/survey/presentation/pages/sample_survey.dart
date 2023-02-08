import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imu_survey_new/feature/survey/data/sample_question_model.dart';

class SampleSurvey extends StatefulWidget {
  const SampleSurvey({Key? key}) : super(key: key);

  @override
  State<SampleSurvey> createState() => _SampleSurveyState();
}

class _SampleSurveyState extends State<SampleSurvey> {
  final _formKey = GlobalKey<FormState>();

  final List<SampleQuestionModel> _initialData = [
    SampleQuestionModel(
        question: 'Student ID?',
        isSingleChoice: true,
        answerChoices: null,
        isMandatory: true,
        errorText: 'Required field',
        answers: null),
    SampleQuestionModel(
        question: 'How do you travel to school?',
        isSingleChoice: true,
        answerChoices: ['Public transport', 'Car', 'Motor'],
        isMandatory: true,
        errorText: 'Required field',
        answers: null),
    SampleQuestionModel(
        question: 'Which school are you from?',
        isSingleChoice: true,
        answerChoices: ['Medical', 'Nursery', 'Phramacist'],
        isMandatory: true,
        errorText: 'Required field',
        answers: null),
    SampleQuestionModel(
        question: 'What food do you prefer?',
        isSingleChoice: false,
        answerChoices: null,
        multipleAnswerChoices: {'Thai': false, 'Western': false, 'Chinese': false, 'Local': false, 'Viet': false},
        isMandatory: true,
        errorText: 'Required field',
        answers: null),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: _initialData.length,
            itemBuilder: (BuildContext context, int index) {
              if (_initialData[index].isSingleChoice && _initialData[index].answerChoices == null) {
                return Padding(
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
                            Text('${index + 1}. ${_initialData[index].question}'),
                            TextFormField(
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } else if (_initialData[index].isSingleChoice && _initialData[index].answerChoices != null) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  child: Card(
                    elevation: 5,
                    shadowColor: Colors.black,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${index + 1}. ${_initialData[index].question}'),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: _initialData[index].answerChoices!.length,
                              itemBuilder: (context, index1) {
                                return RadioListTile(
                                    visualDensity: const VisualDensity(
                                        horizontal: VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity),
                                    title: Text(_initialData[index].answerChoices![index1]),
                                    value: _initialData[index].answerChoices![index1],
                                    groupValue: _initialData[index].answers,
                                    onChanged: (value) {
                                      setState(() {
                                        _initialData[index].answers = value;
                                      });
                                    });
                              })
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Padding(
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
                            Text('${index + 1}. ${_initialData[index].question}'),
                            ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: _initialData[index].multipleAnswerChoices!.length,
                                itemBuilder: (context, index1) {
                                  String key = _initialData[index].multipleAnswerChoices!.keys.elementAt(index1);
                                  return CheckboxListTile(
                                    title: Text(key),
                                    controlAffinity: ListTileControlAffinity.leading,
                                    // contentPadding: EdgeInsets.zero,
                                    visualDensity: const VisualDensity(
                                        horizontal: VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity),
                                    value: _initialData[index].multipleAnswerChoices![key],
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _initialData[index].multipleAnswerChoices![key] = value ?? false;
                                      });
                                    },
                                  );
                                })
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
            }),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            height: 56,
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.cyanAccent, // Background Color
              ),
              child: const Text("Submit"),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  //do something
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
