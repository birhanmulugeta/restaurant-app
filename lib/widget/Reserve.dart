import 'package:flutter/material.dart';
import 'package:restaurant_app/routing/routingConstants.dart';
import 'package:restaurant_app/widget/timePicker.dart';
import 'datePicker.dart';
import 'checkBox.dart';

class Reserve extends StatelessWidget {
  const Reserve({Key? key, required this.thumbnailUrl}) : super(key: key);

  final String thumbnailUrl;

  @override
  Widget build(BuildContext context) {

    return SafeArea(

      child: Padding(
        padding:  EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
            Container(
              margin:  EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width*0.5,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.9),
                    offset: const Offset(
                      0.0,
                      10.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: -6.0,
                  ),
                ],
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.35),
                    BlendMode.color,
                  ),
                  image: NetworkImage(thumbnailUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin:  EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.7),
                    offset: const Offset(
                      0.0,
                      10.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: -6.0,
                  ),
                ],
              ),
              child: Padding(
                padding:  EdgeInsets.only(top: 30.0, bottom: 30),
                child: Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          const Text('Seats',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          const Text('Type',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          const Text('Date',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          const Text('From',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          const Text('To',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left:10.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pushNamed(context, HomePageRoute);
                              },

                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)) ,

                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.home,
                                      color: Colors.white,
                                      size:
                                      MediaQuery.of(context).size.width * 0.06,
                                    ),
                                    const Text("Home",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                      ),
                                  ],
                                ),
                            ),
                          )

                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          const SizedBox(
                            width: 130.0,
                            height :50.0,
                            child: Padding(
                              padding: EdgeInsets.only(left: 65.0, bottom: 5),
                              child: TextField(
                                style: TextStyle(fontSize: 15, height: 0.5),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                )),
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                maxLength: 2,
                              ),
                            ),
                          ),
                           const CheckBox(),
                          const DatePicker(),
                          const TimePicker(),
                          const TimePicker(),
                          Padding(
                            padding: const EdgeInsets.only(left:5.0),
                            child: ElevatedButton(
                              onPressed:null,
                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)) ,

                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_city,
                                    color: Colors.white,
                                    size:
                                    MediaQuery.of(context).size.width * 0.06,
                                  ),
                                  const Text("Reserve",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,

                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )


                        ],

                      ),



                    ],
                  ),


                ),

              ),

            ),

          ],

        ),

      ),
    );
  }
}
