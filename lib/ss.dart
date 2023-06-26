import 'package:flutter/material.dart';

class ColorContainerListView extends StatefulWidget {
  @override
  _ColorContainerListViewState createState() => _ColorContainerListViewState();
}

class _ColorContainerListViewState extends State<ColorContainerListView> {
  List<Color> containerColors = [];
  List<bool> buttonStates = [true, true, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Container List'),
      ),
      body: ListView.builder(
        itemCount: containerColors.length,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            color: containerColors[index],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: buttonStates[0]
                  ? () {
                      setState(() {
                        containerColors.add(Colors.red);
                        buttonStates[0] = false;
                      });
                    }
                  : null,
            ),
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: buttonStates[1]
                  ? () {
                      setState(() {
                        containerColors.add(Colors.pink);
                        buttonStates[1] = false;
                      });
                    }
                  : null,
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: buttonStates[2]
                  ? () {
                      setState(() {
                        containerColors.add(Colors.green);
                        buttonStates[2] = false;
                      });
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
