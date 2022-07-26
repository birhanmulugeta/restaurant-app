import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';





class TimePicker extends StatefulWidget {
  const TimePicker({Key? key}) : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> { // your dateTime object
 // how you want it to be formatted

  TimeOfDay time = TimeOfDay.now();



  @override
  Widget build(BuildContext context) {
    final hours= time.hour.toString().padLeft(2,'0');
    final minutes= time.minute.toString().padLeft(2,'0');
    return Container(

      child:Row(
        children: [


          Padding(
            padding: const EdgeInsets.only(left:20),
            child: ElevatedButton(

              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber)) ,


                onPressed: () async {
                  TimeOfDay? newTime = await showTimePicker(
                    context: context,
                    initialTime: time,

                  );
                  if(newTime == null) return;

                  setState(()=>time=newTime);
                },

                child: Row(
                  children: [
                    Icon(
                      Icons.timer,
                      color: Colors.black,
                      size:
                      MediaQuery.of(context).size.width * 0.05,
                    ),
                    Text(time.format(context),
                        style: TextStyle(color:Colors.black)
                    ),
                  ],
                ),
            ),

          ),

        ],
      ),


    );
  }
}
