import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCircleTurn;
  String winnerMessage;
  List<Widget> spaces;

  void onPress(int index) {
    TickTacToeSpace tts = spaces[index] as TickTacToeSpace;
    print(isCircleTurn);
    setState(() {
      if (tts.spaceState == SpaceState.none) {
        print('a');
        if (isCircleTurn) {
          print('b');
          tts.setState(SpaceState.circle);
        } else {
          print('c');
          tts.setState(SpaceState.cross);
        }
      }
      isCircleTurn = !isCircleTurn;
      winnerMessage = checkEndGame();
    });
  }

  String checkEndGame() {
    TickTacToeSpace space1 = spaces[0] as TickTacToeSpace;
    TickTacToeSpace space2 = spaces[1] as TickTacToeSpace;
    TickTacToeSpace space3 = spaces[2] as TickTacToeSpace;
    TickTacToeSpace space4 = spaces[3] as TickTacToeSpace;
    TickTacToeSpace space5 = spaces[4] as TickTacToeSpace;
    TickTacToeSpace space6 = spaces[5] as TickTacToeSpace;
    TickTacToeSpace space7 = spaces[6] as TickTacToeSpace;
    TickTacToeSpace space8 = spaces[7] as TickTacToeSpace;
    TickTacToeSpace space9 = spaces[8] as TickTacToeSpace;

    if (space1.spaceState == SpaceState.circle && space2.spaceState == SpaceState.circle && space3.spaceState == SpaceState.circle) {
      return 'Circle Won!';
    }
    if (space4.spaceState == SpaceState.circle && space5.spaceState == SpaceState.circle && space6.spaceState == SpaceState.circle) {
      return 'Circle Won!';
    }
    if (space7.spaceState == SpaceState.circle && space8.spaceState == SpaceState.circle && space9.spaceState == SpaceState.circle) {
      return 'Circle Won!';
    }
    if (space1.spaceState == SpaceState.circle && space4.spaceState == SpaceState.circle && space7.spaceState == SpaceState.circle) {
      return 'Circle Won!';
    }
    if (space2.spaceState == SpaceState.circle && space5.spaceState == SpaceState.circle && space8.spaceState == SpaceState.circle) {
      return 'Circle Won!';
    }
    if (space3.spaceState == SpaceState.circle && space6.spaceState == SpaceState.circle && space9.spaceState == SpaceState.circle) {
      return 'Circle Won!';
    }
    if (space1.spaceState == SpaceState.circle && space5.spaceState == SpaceState.circle && space9.spaceState == SpaceState.circle) {
      return 'Circle Won!';
    }
    if (space3.spaceState == SpaceState.circle && space5.spaceState == SpaceState.circle && space7.spaceState == SpaceState.circle) {
      return 'Circle Won!';
    }

    if (space1.spaceState == SpaceState.cross && space2.spaceState == SpaceState.cross && space3.spaceState == SpaceState.cross) {
      return 'Circle Won!';
    }
    if (space4.spaceState == SpaceState.cross && space5.spaceState == SpaceState.cross && space6.spaceState == SpaceState.cross) {
      return 'Circle Won!';
    }
    if (space7.spaceState == SpaceState.cross && space8.spaceState == SpaceState.cross && space9.spaceState == SpaceState.cross) {
      return 'Circle Won!';
    }
    if (space1.spaceState == SpaceState.cross && space4.spaceState == SpaceState.cross && space7.spaceState == SpaceState.cross) {
      return 'Circle Won!';
    }
    if (space2.spaceState == SpaceState.cross && space5.spaceState == SpaceState.cross && space8.spaceState == SpaceState.cross) {
      return 'Circle Won!';
    }
    if (space3.spaceState == SpaceState.cross && space6.spaceState == SpaceState.cross && space9.spaceState == SpaceState.cross) {
      return 'Circle Won!';
    }
    if (space1.spaceState == SpaceState.cross && space5.spaceState == SpaceState.cross && space9.spaceState == SpaceState.cross) {
      return 'Circle Won!';
    }
    if (space3.spaceState == SpaceState.cross && space5.spaceState == SpaceState.cross && space7.spaceState == SpaceState.cross) {
      return 'Circle Won!';
    }

    return null;
  }

  @override
  void initState() {
    super.initState();

    isCircleTurn = true;
    spaces = [
      TickTacToeSpace(0, SpaceState.none, onPress),
      TickTacToeSpace(1, SpaceState.none, onPress),
      TickTacToeSpace(2, SpaceState.none, onPress),
      TickTacToeSpace(3, SpaceState.none, onPress),
      TickTacToeSpace(4, SpaceState.none, onPress),
      TickTacToeSpace(5, SpaceState.none, onPress),
      TickTacToeSpace(6, SpaceState.none, onPress),
      TickTacToeSpace(7, SpaceState.none, onPress),
      TickTacToeSpace(8, SpaceState.none, onPress),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          GridView.builder(
            shrinkWrap: true,
            key: UniqueKey(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, int i) {
              return GridTile(
                child: spaces[i],
              );
            },
            itemCount: 9,
          ),
          winnerMessage != null ? Text(winnerMessage) : Container(),
        ],
      ),
    );
  }
}

class TickTacToeSpace extends StatefulWidget {
  TickTacToeSpace(this.index, this.spaceState, [this.onPress]);

  final int index;
  SpaceState spaceState;
  Function onPress;

  void setState(SpaceState state) {
    spaceState = state;
  }

  @override
  _TickTacToeSpaceState createState() => _TickTacToeSpaceState();
}

class _TickTacToeSpaceState extends State<TickTacToeSpace> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.spaceState == SpaceState.none ? () => widget.onPress(widget.index) : null,
      child: Container(
        color: Colors.white,
        child: Center(
          child: getText(),
        ),
      ),
    );
  }

  Widget getText() {
    if (widget.spaceState == SpaceState.none) {
      return Text('None');
    } else if (widget.spaceState == SpaceState.circle) {
      return Text('Circle');
    }
    return Text('Cross');
  }
}

enum SpaceState {
  none,
  circle,
  cross
}