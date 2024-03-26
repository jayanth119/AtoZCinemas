import 'package:flutter/material.dart';

class TimeSelector extends StatefulWidget {
  final Function(String) onTimeSelected;

  const TimeSelector({required this.onTimeSelected});

  @override
  _TimeSelectorState createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  int selectedIndex = 1;

  final List<List<dynamic>> time = [
    ["01.30", 5],
    ["06.30", 10],
    ["10.30", 15]
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 17,
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.035),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: time.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: index == 0 ? 32 : 0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                  widget.onTimeSelected(time[index][0]);
                },
                child: _buildTimeItem(
                  time[index][0],
                  time[index][1],
                  index == selectedIndex,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTimeItem(String time, int price, bool active) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      padding: EdgeInsets.symmetric(horizontal: 20.0 * 0.75),
      decoration: BoxDecoration(
        border: Border.all(
          color: active ? Colors.red : Colors.white,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              text: time,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: active ? Colors.red : Colors.white,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' PM',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: active ? Colors.red : Colors.white,
                  ),
                )
              ],
            ),
          ),
          Text(
            "from \$$price",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
