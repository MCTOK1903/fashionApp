import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  var imgPath, tag;

  Detail({this.imgPath, this.tag});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.imgPath), fit: BoxFit.cover)),
          ),
          imageCard(context),
        ],
      ),
    );
  }

  Positioned imageCard(BuildContext context) {
    return Positioned(
      bottom: 15,
      left: 15,
      right: 15,
      child: Material(
        borderRadius: BorderRadius.circular(15),
        elevation: 4,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: cardDetail(),
        ),
      ),
    );
  }

  cardDetail() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.17,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey),
                  image: DecorationImage(
                      image: AssetImage('assets/dress.jpg'),
                      fit: BoxFit.contain),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'LAMINETED',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Louis vuitton',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width - 200,
                  child: Text(
                    'One button V-neck sling long-sleeved waist female stitching dress',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        color: Colors.grey),
                  ),
                ),
              ],
            ),
          ],
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.only(left:20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "\$5699",
                style: TextStyle(
                    fontFamily: 'Montserrat', fontWeight: FontWeight.bold, fontSize: 22),
              ),
              FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.arrow_forward_ios),
                backgroundColor: Colors.brown,
              )
            ],
          ),
        )
      ],
    );
  }
}
