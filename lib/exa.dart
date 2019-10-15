import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tic Tac Toe',
        theme: ThemeData(fontFamily: 'Proxima Nova Soft W03 Semibold.ttf'),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();

  }
}

class _HomePageState extends State<HomePage> {
  List<List> matrix;

  _HomePageState() {
    _initMatrix();
  }

  _initMatrix() {
    matrix = List<List>(3);
    for (var i = 0; i < matrix.length; i++) {
      matrix[i] = List(3);
      for (var j = 0; j < matrix[i].length; j++) {
        matrix[i][j] = null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var textHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          title: Text('Tic tac toe'),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black54,
              image: DecorationImage(
                image: AssetImage(
                  "assets/background.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: textHeight  * 0.10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Tic-Tac-Toe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 42,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Player X to Move',
                    style: TextStyle(
                      color: Colors.white.withAlpha(150),
                      fontSize: 20,
                    ),
                  ),
                ),
                buildGrid(),
                FlatButton(
                  color: Colors.white.withAlpha(150),
                  onPressed: () {
                    setState(() {
                      _initMatrix();
                    });
                  },
                  child: Text(
                    "Reset",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Column buildGrid() {
    return Column(
      children: <Widget>[
        Row(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildElement(0, 0),
            _buildElement(0, 1),
            _buildElement(0, 2),
          ],
        ),
        Row(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildElement(1, 0),
            _buildElement(1, 1),
            _buildElement(1, 2),
          ],
        ),
        Row(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildElement(2, 0),
            _buildElement(2, 1),
            _buildElement(2, 2),
          ],
        ),
      ],
    );
  }

  IconData choice = Icons.clear;

  _buildElement(int i, int j) {
    return GestureDetector(
      onTap: () {
        _changeMatrixField(i, j);
        _checkWinner(i, j);
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(12, 8, 8, 8),
        width: 90.0,
        height: 90.0,
        decoration: BoxDecoration(
            color: Colors.white.withAlpha(150),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(4)),
            border: Border.all(
              color: Colors.white,
            )),
        child: Center(
          child: Icon(
            matrix[i][j],
            color: Colors.white,
            size: 80,
          ),
        ),
      ),
    );
  }

  _changeMatrixField(int i, int j) {
    setState(
          () {
        if (matrix[i][j] == null) {
          if (choice == Icons.clear)
            matrix[i][j] = FontAwesomeIcons.circle;
          else
            matrix[i][j] = Icons.clear;

          choice = matrix[i][j];
        }
      },
    );
  }

  _checkWinner(int x, int y) {
    var col = 0, row = 0, diag = 0, rdiag = 0;
    var n = matrix.length - 1;
    var player = matrix[x][y];

    for (int i = 0; i < matrix.length; i++) {
      if (matrix[x][i] == player) col++;
      if (matrix[i][y] == player) row++;
      if (matrix[i][i] == player) diag++;
      if (matrix[i][n - i] == player) rdiag++;
    }
    if (row == n + 1 || col == n + 1 || diag == n + 1 || rdiag == n + 1) {
      print('$player won');
      _initMatrix();
    }
  }


}