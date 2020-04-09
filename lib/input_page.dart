import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'gender_info.dart';
import 'next_button.dart';
import 'input_container.dart';

const Color inactiveInputColor = Color(0xFF141419);
const Color activeInputColor = Color(0xFF2B2B30);

GenderInfo genderInfo = GenderInfo();

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool maleSelected = false;
  bool femaleSelected = false;

  Color getGenderColor(gender) {
    return gender ? activeInputColor : inactiveInputColor;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        maleSelected = true;
                        femaleSelected = false;
                      });
                    },
                    child: InputContainer(
                      color: getGenderColor(maleSelected),
                      child: GenderInfo(
                        genderIcon: genderInfo.maleIcon,
                        genderText: 'Homme',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        femaleSelected = true;
                        maleSelected = false;
                      });
                    },
                    child: InputContainer(
                      color: getGenderColor(femaleSelected),
                      child: GenderInfo(
                        genderIcon: genderInfo.femaleIcon,
                        genderText: 'Femme',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: InputContainer(color: inactiveInputColor),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: InputContainer(color: inactiveInputColor),
                ),
                Expanded(
                  child: InputContainer(color: inactiveInputColor),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: NextButton(color: inactiveInputColor, text: 'Calculer'),
          ),
        ],
      ),
    );
  }
}
