import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'gender_info.dart';
import 'next_button.dart';
import 'input_container.dart';
import 'shared.dart';
import 'height_info.dart';

GenderInfo genderInfo = GenderInfo();

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender genderSelected;
  int height = 170;
  int weight = 60;
  int age = 25;
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
      return 'Belle Balisse?';
    } else if (isVisible() && genderSelected == Gender.female) {
      return 'Bonnasse?';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: InputContainer(
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
                  child: InputContainer(
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
            child: InputContainer(
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
                  child: InputContainer(
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
                                  child: SimpleButton(
                                      icon: FontAwesomeIcons.minus,
                                      onPressed: () {
                                        isWeightActive = true;
                                        setState(() {
                                          weight--;
                                        });
                                      })),
                              Expanded(
                                  flex: 4,
                                  child: SimpleButton(
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
                  child: InputContainer(
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
                                child: SimpleButton(
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
                                child: SimpleButton(
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
            child: NextButton(
              color: getCalculateColor(),
              text: getCalculateText(),
            ),
          ),
        ],
      ),
    );
  }
}
