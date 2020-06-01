import 'package:fashion_app/details.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buttomNavigationBar(),
      appBar: customizedAppBar(),
      body: homeBody(),
    );
  }

  Widget buttomNavigationBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.more), title: Text('hom')),
        BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow), title: Text('hom')),
        BottomNavigationBarItem(
            icon: Icon(Icons.navigation), title: Text('hom')),
        BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle), title: Text('hom')),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      selectedItemColor: Colors.brown.shade400,
      onTap: onItemTapped,
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  customizedAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      title: Text(
        'Fashion App',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.camera_alt), onPressed: null)
      ],
    );
  }

  Widget homeBody() {
    return ListView(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[userListView(), postDetailView(), postDetailView()],
    );
  }

  Widget userListView() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 6,
      child: ListView(
        padding: EdgeInsets.only(left: 10),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          elementsOfList('assets/model1.jpeg', 'assets/chanellogo.jpg'),
          elementsOfList('assets/model2.jpeg', 'assets/chloelogo.png'),
          elementsOfList('assets/model3.jpeg', 'assets/louisvuitton.jpg'),
          elementsOfList('assets/model1.jpeg', 'assets/chanellogo.jpg'),
          elementsOfList('assets/model2.jpeg', 'assets/chloelogo.png'),
          elementsOfList('assets/model3.jpeg', 'assets/louisvuitton.jpg'),
        ],
      ),
    );
  }

  Widget elementsOfList(String imagePath, String logoPath) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Stack(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage(imagePath),
                radius: MediaQuery.of(context).size.width / 10,
              ),
              Positioned(
                top: MediaQuery.of(context).size.width / 8,
                left: MediaQuery.of(context).size.width / 8,
                child: CircleAvatar(
                  backgroundImage: AssetImage(logoPath),
                  radius: MediaQuery.of(context).size.width / 25,
                ),
              )
            ],
          ),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height / 30,
            width: MediaQuery.of(context).size.width / 5.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width / 10),
                color: Colors.brown),
            child: Text(
              'Follow',
              style: TextStyle(fontFamily: 'Montserrat', color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget postDetailView() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Material(
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width / 16),
        elevation: 4,
        child: Container(
          padding: EdgeInsets.all(8.0),
          height: (MediaQuery.of(context).size.height / 1.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              postDetailUserInfo(),
              postDetailText(),
              postDetailImageGallery(),
              postDetailTag(),
              Divider(),
              postDetailInteractonInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget postDetailUserInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage('assets/model1.jpeg'),
          radius: MediaQuery.of(context).size.width / 14,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Daisy',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '34 min ago',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        Spacer(), // her zaman ise yaramayabilir
        IconButton(icon: Icon(Icons.more_vert), onPressed: null)
      ],
    );
  }

  Widget postDetailText() {
    return Text(
      'This official web side features a ribbed knit zibber jacket that is'
      'modern ans stylish. It looks very temparanent and is recommed to friends.',
      style: TextStyle(
        fontSize: 13,
        color: Colors.grey,
        fontFamily: 'Montserrat',
      ),
    );
  }

  Widget postDetailImageGallery() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Detail(
                      imgPath: 'assets/modelgrid1.jpeg',
                      tag: 1,
                    )));
          },
          child: Container(
            height: MediaQuery.of(context).size.height / 3,
            width: (MediaQuery.of(context).size.width - 50) / 2,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/modelgrid1.jpeg'),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        Column(
          children: <Widget>[
            InkWell(
              child: Container(
                height: MediaQuery.of(context).size.height / 6.5,
                width: (MediaQuery.of(context).size.width - 100) / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/modelgrid2.jpeg'),
                      fit: BoxFit.cover),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Detail(
                          imgPath: 'assets/modelgrid2.jpeg',
                          tag: 2,
                        )));
              },
            ),
            SizedBox(height: 20),
            InkWell(
              child: Container(
                height: MediaQuery.of(context).size.height / 6.5,
                width: (MediaQuery.of(context).size.width - 100) / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/modelgrid3.jpeg'),
                      fit: BoxFit.cover),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Detail(
                          imgPath: 'assets/modelgrid3.jpeg',
                          tag: 3,
                        )));
              },
            ),
          ],
        )
      ],
    );
  }

  Widget postDetailTag() {
    return Row(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height / 30,
          width: MediaQuery.of(context).size.width / 4,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(MediaQuery.of(context).size.width / 10),
              color: Colors.brown.withOpacity(0.3)),
          child: Text(
            '#louisvuitton',
            style: TextStyle(fontFamily: 'Montserrat', color: Colors.white),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height / 30,
          width: MediaQuery.of(context).size.width / 6,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(MediaQuery.of(context).size.width / 10),
              color: Colors.brown.withOpacity(0.3)),
          child: Text(
            '#chloe',
            style: TextStyle(fontFamily: 'Montserrat', color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget postDetailInteractonInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              IconButton(icon: Icon(Icons.reply), onPressed: null),
              Text('1.7K')
            ],
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              IconButton(icon: Icon(Icons.comment), onPressed: null),
              Text('324')
            ],
          ),
        ),
        Spacer(),
        Container(
          child: Row(
            children: <Widget>[
              IconButton(icon: Icon(Icons.favorite), onPressed: null),
              Text('4.2K')
            ],
          ),
        )
      ],
    );
  }
}
