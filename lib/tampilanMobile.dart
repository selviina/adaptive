import 'package:adaptive/tampilanIos.dart';
import 'package:flutter/material.dart';

class TampilanAndroid extends StatefulWidget {
  const TampilanAndroid({super.key});

  @override
  State<TampilanAndroid> createState() => _TampilanAndroidState();
}

class _TampilanAndroidState extends State<TampilanAndroid> {
  double _currentSliderValue = 0.0;
  String? _sliderStatus;
  bool ios = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Switch(
          value: ios,
          onChanged: (bool? value) {
            setState(
              () {
                if (!ios) {
                  // ios = !ios;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TampilanIos()),
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
                Slider(
                  key: const Key('slider'),
                  value: _currentSliderValue,
                  divisions: 5,
                  max: 100,
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
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Ini Slider Android'),
                TextButton(
                  onPressed: () {},
                  child: Text("button"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Button'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Ini Android Buttons'),
                Container(
                  child: TextField(),
                  width: 500,
                  height: 40,
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Ini Cupertino Text Field'),
                Icon(Icons.share),
                SizedBox(
                  height: 10,
                ),
                Text('Ini Android Icon'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
