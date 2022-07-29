import 'package:flutter/material.dart';




class CheckBox extends StatefulWidget {

  const CheckBox({Key? key}) : super(key: key);

  @override
  State<CheckBox> createState() => _CheckBoxState();

}

class _CheckBoxState extends State<CheckBox> {
  bool vip = false;
  bool regular = false;

  @override
  Widget build(BuildContext context) {

    return Row(
      children:[
        const Padding(
          padding: EdgeInsets.only(left:5.0),
          child: Text('VIP',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              )),
        ),


          Checkbox(
          value: regular,
          onChanged: (bool? value) { // This is where we update the state when the checkbox is tapped
            setState(() {
              regular = value!;
              value=vip;

            });
          },
    ),


        const Text('Regular',
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            )),


        Checkbox(
          value: vip,
          onChanged: (bool? value) { // This is where we update the state when the checkbox is tapped
            setState(() {
              vip = value!;
              value=regular;

            });
          },
        ),
  ],
      );

  }
}