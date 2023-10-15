import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:olh_rafi/constants/colors.dart';
import 'package:olh_rafi/survey_model.dart';
import 'constants/size_utils.dart';
import 'survey_dropdown.dart';
import 'survey_header.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class SurveySelection {
  int? selectedChoiceIndex;

  SurveySelection({this.selectedChoiceIndex});
}

class _SurveyScreenState extends State<SurveyScreen> {
  List<SurveySelection> selectedChoices =
      List.generate(userExperiences.length, (index) => SurveySelection());

  final items = [
    ' Topic Request',
    'Bug/Error Report',
    'Change Request',
  ];
  String? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 110,
                child: SurveyHeader(),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: userExperiences.length, // Adjust as needed
                itemBuilder: (context, index) {
                  print("Building item at index $index");
                  return Padding(
                    padding: getPadding(
                      top: 8,
                      left: 8,
                      right: 8,
                    ),
                    child: SurveyCard(
                        survey: userExperiences[index],
                        selectedChoiceIndex:
                            selectedChoices[index].selectedChoiceIndex,
                        onChoiceSelected: (choiceIndex) {
                          setState(() {
                            selectedChoices[index].selectedChoiceIndex =
                                choiceIndex;
                          });
                        }),
                  );
                },
              ),
              SizedBox(height: 25),
              Padding(
                padding: getPadding(
                  left: 8,
                  right: 8,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Report/Request',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w700),
                        ),
                        SurveyDropdown(),
                      ],
                    ),
                    SizedBox(height: 5),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      shadowColor: Colors.white54,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: "Text here...",
                            hintStyle: TextStyle(
                              color: Color(0XFF888888),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 21),
                  Image.network(
                    'https://64.media.tumblr.com/17fa36508f975fd84b3d6bd37ff3b025/8d2bf2c319db922b-7a/s250x400/b710f132ea440b6d39c9c76bf0ba208777880341.pnj',
                    height: 90,
                  ),
                  Text(
                    'Rate your experience',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                  ),
                  const Text('If you enjoy our app,',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                  const Text('Please rate us.',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                ],
              ),
              SizedBox(height: 25),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  grade: 2,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(height: 25),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1F4766),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      padding: const EdgeInsets.only(top: 16, bottom: 16)),
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Pwedy rani siya part e balhin sa local_widget na folder para dili kaayu taas ag code deri
class SurveyCard extends StatelessWidget {
  const SurveyCard({
    required this.survey,
    required this.selectedChoiceIndex,
    required this.onChoiceSelected,
    Key? key,
  }) : super(key: key);

  final Survey survey;
  final int? selectedChoiceIndex;
  final void Function(int?) onChoiceSelected;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.white54,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              survey.question,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 40),
            Column(
              children: survey.choices.asMap().entries.map((entry) {
                final int index = entry.key;
                final String choice = entry.value.answer;

                return ChoiceTile(
                  choice: choice,
                  isSelected: selectedChoiceIndex == index,
                  onPressed: () {
                    onChoiceSelected(index);
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

//Pwedy rani siya part e balhin sa local_widget na folder para dili kaayu taas ag code deri
class ChoiceTile extends StatelessWidget {
  const ChoiceTile({
    Key? key,
    required this.choice,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  final String choice;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: double.maxFinite,
      height: 53,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          elevation: 5,
          shadowColor: Colors.white54,
          alignment: Alignment.centerLeft,
          backgroundColor: isSelected ? AppColors.rhino : AppColors.white,
          shape: const StadiumBorder(),
        ),
        child: Text(
          choice,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? AppColors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
