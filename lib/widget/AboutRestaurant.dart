import 'package:flutter/material.dart';
import '../routing/routingConstants.dart';

class About extends StatelessWidget {
  const About({Key? key, required this.thumbnailUrl}) : super(key: key);

  final String thumbnailUrl;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:  EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Container(
              margin:  EdgeInsets.symmetric(horizontal: 25),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
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
              margin:  EdgeInsets.symmetric(horizontal: 25),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
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
              ),
              child: Padding(
                padding:  EdgeInsets.only(top: 30.0, bottom: 30),
                child: Container(

                    child:Text("abcdefghijklmnopqrstuvwxyz abcdefghijklmnopqrstuvwxyz") ,
                      ),
                  ),
                ),
]
    ),
    ),
        );
  }
}
