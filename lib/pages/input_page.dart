import 'package:com/pages/response_page.dart';
import 'package:com/shared/infos/imc_calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../shared/buttons/bottom_button.dart';
import '../shared/buttons/simple_action_button.dart';
import '../shared/containers/primary_container.dart';
import '../shared/infos/height_info.dart';
import '../shared/infos/gender_info.dart';
import 'package:com/shared/constants/color.dart';
import 'package:com/shared/constants/text.dart';

GenderInfo genderInfo = GenderInfo();

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender genderSelected;
  int height = 170;
  int weight = 65;
  int age = 30;
  bool isHeightActive = false;
  bool isWeightActive = false;
  bool isAgeActive = false;

  Color getGenderColor(gender) {
    return genderSelected == gender ? kActiveInputColor : kInactiveInputColor;
  }

  Color getSliderColor(isHeightActive) {
    return isHeightActive ? kActiveInputColor : kInactiveInputColor;
  }

  Color getWeightColor(isWeightActive) {
    return isWeightActive ? kActiveInputColor : kInactiveInputColor;
  }

  Color getAgeColor(isAgeActive) {
    return isAgeActive ? kActiveInputColor : kInactiveInputColor;
  }

  String getCalculateText() {
    if (isVisible() && genderSelected == Gender.male) {
      return 'Belle Batisse?';
    } else if (isVisible() && genderSelected == Gender.female) {
      return 'Bomba Latina?';
    } else {
      return '. . .';
    }
  }

  Color getCalculateColor() {
    return isVisible() ? kDeepBlue : Color(0x843540A4);
  }

  bool isVisible() {
    return genderSelected != null &&
            isHeightActive == true &&
            isWeightActive == true &&
            isAgeActive == true
        ? true
        : false;
  }

  void goToResponse() {
    if (isVisible()) {
      ImcCalculator myImc =
          ImcCalculator(height: height, weight: weight, gender: genderSelected);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResponsePage(
            imc: myImc.getImc().toStringAsFixed(1),
            status: myImc.getStatus(),
            interpretation: myImc.getInterpretation(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: PrimaryContainer(
                      onTap: () {
                        setState(() {
                          genderSelected = Gender.male;
                        });
                      },
                      color: getGenderColor(Gender.male),
                      child: GenderInfo(
                        genderIcon: genderInfo.maleIcon,
                        genderText: 'Homme',
                      ),
                    ),
                  ),
                  Expanded(
                    child: PrimaryContainer(
                      onTap: () {
                        setState(() {
                          genderSelected = Gender.female;
                        });
                      },
                      color: getGenderColor(Gender.female),
                      child: GenderInfo(
                        genderIcon: genderInfo.femaleIcon,
                        genderText: 'Femme',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: PrimaryContainer(
                color: getSliderColor(isHeightActive),
                child: Column(
                  children: <Widget>[
                    Expanded(child: SizedBox()),
                    Expanded(child: HeightText(height: height)),
                    Expanded(
                        flex: 2,
                        child: HeightSlider(
                          height: height,
                          onChanged: (double newHeight) {
                            isHeightActive = true;
                            setState(() {
                              height = newHeight.round();
                            });
                          },
                        )),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: PrimaryContainer(
                      color: getWeightColor(isWeightActive),
                      child: Column(
                        children: <Widget>[
                          Expanded(child: SizedBox()),
                          Expanded(
                            flex: 2,
                            child: UnitText(
                              value: weight,
                              unit: 'kg',
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Row(
                              children: <Widget>[
                                Expanded(child: SizedBox()),
                                Expanded(
                                    flex: 4,
                                    child: SimpleActionButton(
                                        icon: FontAwesomeIcons.minus,
                                        onPressed: () {
                                          isWeightActive = true;
                                          setState(() {
                                            weight--;
                                          });
                                        })),
                                Expanded(
                                    flex: 4,
                                    child: SimpleActionButton(
                                        icon: FontAwesomeIcons.plus,
                                        onPressed: () {
                                          isWeightActive = true;
                                          setState(() {
                                            weight++;
                                          });
                                        })),
                                Expanded(child: SizedBox()),
                              ],
                            ),
                          ),
                          Expanded(child: SizedBox()),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: PrimaryContainer(
                      color: getAgeColor(isAgeActive),
                      child: Column(
                        children: <Widget>[
                          Expanded(child: SizedBox()),
                          Expanded(
                            flex: 2,
                            child: UnitText(
                              value: age,
                              unit: 'ans',
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Row(
                              children: <Widget>[
                                Expanded(child: SizedBox()),
                                Expanded(
                                  flex: 4,
                                  child: SimpleActionButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      isAgeActive = true;
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: SimpleActionButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPressed: () {
                                        isAgeActive = true;
                                        setState(() {
                                          age++;
                                        });
                                      }),
                                ),
                                Expanded(child: SizedBox()),
                              ],
                            ),
                          ),
                          Expanded(child: SizedBox()),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  goToResponse();
                },
                child: BottomButton(
                  color: getCalculateColor(),
                  text: getCalculateText(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
