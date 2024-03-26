import 'package:atoz_cinema/widgets/build_chairs.dart';
import 'package:flutter/material.dart';

class SeatSelector extends StatefulWidget {
  final Function(List<String>) onSeatsSelected;
  final Function(int) onAmountUpdated;

  const SeatSelector({
    required this.onSeatsSelected,
    required this.onAmountUpdated,
  });

  @override
  _SeatSelectorState createState() => _SeatSelectorState();
}

class _SeatSelectorState extends State<SeatSelector> {
  Widget _chairList() {
    Size size = MediaQuery.of(context).size;

    var _chairStatus = [
      [1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 3, 1, 1],
      [1, 1, 1, 1, 1, 3, 3],
      [2, 2, 2, 1, 3, 1, 1],
      [1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1],
    ];

    List<String> selectedSeats = [];

    return Container(
      child: Column(
        children: <Widget>[
          for (int i = 0; i < 6; i++)
            Container(
              margin: EdgeInsets.only(top: i == 3 ? size.height * .02 : 0),
              child: Row(
                children: <Widget>[
                  for (int x = 0; x < 9; x++)
                    Expanded(
                      flex: x == 0 || x == 8 ? 2 : 1,
                      child: x == 0 ||
                              x == 8 ||
                              (i == 0 && x == 1) ||
                              (i == 0 && x == 7) ||
                              (x == 4)
                          ? Container()
                          : GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (_chairStatus[i][x - 1] == 1) {
                                    _chairStatus[i][x - 1] = 2;
                                    selectedSeats.add('Seat ${i + 1}-${x}');
                                  } else if (_chairStatus[i][x - 1] == 2) {
                                    _chairStatus[i][x - 1] = 1;
                                    selectedSeats.remove('Seat ${i + 1}-${x}');
                                  }
                                  widget.onAmountUpdated(
                                      selectedSeats.length * 10);
                                  widget.onSeatsSelected(selectedSeats);
                                });
                              },
                              child: Container(
                                height: size.width / 11 - 10,
                                margin: const EdgeInsets.all(5),
                                child:
                                    BuildChairs.chair(_chairStatus[i][x - 1]),
                              ),
                            ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      flex: 47,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size.width,
          ),

          //Movie Colors.white Screen starts

          Positioned(
            top: 48,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.65,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50.0),
                        topLeft: Radius.circular(50.0),
                      ),
                      gradient: LinearGradient(
                        colors: [Colors.white, Colors.transparent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0, 1],
                      )),
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.55,
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(
                    width: 6.0,
                    color: Colors.white,
                  ))),
                ),
              ],
            ),
          ),

          //Movie Colors.white Screen ends

          Positioned(
            bottom: size.height * .02,
            child: Container(
              width: size.width,
              child: _chairList(),
            ),
          ),
        ],
      ),
    );
  }
}
