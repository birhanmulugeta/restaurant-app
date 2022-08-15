import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);


  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime date= DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(

      child:Row(
        children: [


          Padding(
            padding: const EdgeInsets.only(left:20),
            child: ElevatedButton(

                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber)) ,

                onPressed: () async {
                  DateTime? newDate = await showDatePicker(


                      context: context,
                      initialDate: date,
                      firstDate: DateTime(2010),
                      lastDate: DateTime(2025),
                  );
                  if(newDate == null) return;

                  setState(()=>date=newDate);

                },

              child: Row(
                children: [
                  Icon(
                    Icons.date_range,
                    color: Colors.black,
                    size:
                    MediaQuery.of(context).size.width * 0.05,
                  ),
                  Text( DateFormat.yMd().format(date),

                      style: TextStyle(color:Colors.white)


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
