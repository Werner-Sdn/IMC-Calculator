import 'package:auto_size_text/auto_size_text.dart';
import 'package:com/shared/buttons/bottom_button.dart';
import 'package:com/shared/constants/color.dart';
import 'package:com/shared/constants/text.dart';
import 'package:com/shared/containers/primary_container.dart';
import 'package:flutter/material.dart';

class ResponsePage extends StatelessWidget {
  final String imc;
  final String status;
  final String interpretation;

  ResponsePage(
      {@required this.imc,
      @required this.status,
      @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 9,
              child: PrimaryContainer(
                color: kActiveInputColor,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: AutoSizeText(
                            status,
                            textAlign: TextAlign.center,
                            style: kTextStyle.copyWith(
                              fontWeight: FontWeight.w600,
                              letterSpacing: 6,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Center(
                              child: AutoSizeText('Ton IMC est de',
                                  style: kTextStyle),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: AutoSizeText(
                                imc,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 42,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 3,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: AutoSizeText(
                          interpretation,
                          textAlign: TextAlign.center,
                          style: kTextStyle.copyWith(
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child:
                    BottomButton(text: 'Je veux recalculer', color: kDeepBlue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
