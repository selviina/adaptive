import 'package:adaptive/tampilanMobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TampilanIos extends StatefulWidget {
  TampilanIos({super.key});

  @override
  State<TampilanIos> createState() => _TampilanIosState();
}

class _TampilanIosState extends State<TampilanIos> {
  double _currentSliderValue = 0.0;
  String? _sliderStatus;
  bool ios = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CupertinoSwitch(
          value: ios,
          onChanged: (bool? value) {
            setState(
              () {
                if (ios) {
                  // ios = !ios;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TampilanAndroid()),
                  );
                }
              },
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                CupertinoSlider(
                  key: const Key('slider'),
                  value: _currentSliderValue,
                  divisions: 5,
                  max: 100,
                  activeColor: CupertinoColors.systemPurple,
                  thumbColor: CupertinoColors.systemPurple,
                  onChangeStart: (double value) {
                    setState(() {
                      _sliderStatus = 'Sliding';
                    });
                  },
                  // This is called when sliding has ended.
                  onChangeEnd: (double value) {
                    setState(() {
                      _sliderStatus = 'Finished sliding';
                    });
                  },
                  // This is called when slider value is changed.
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Ini Slider Cupertion (IOs)'),
                CupertinoButton(child: Text('Button'), onPressed: () {}),
                CupertinoButton.filled(
                  onPressed: null,
                  child: Text('Disabled'),
                ),
                CupertinoButton.filled(
                  onPressed: () {},
                  child: const Text('Enabled'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Ini Button Cupertion (IOs)'),
                Container(
                  child: CupertinoTextField(),
                  width: 500,
                  height: 40,
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Ini Cupertino Text Field'),
                Icon(Icons.ios_share),
                SizedBox(
                  height: 10,
                ),
                Text('Ini Cupertino Icon'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
