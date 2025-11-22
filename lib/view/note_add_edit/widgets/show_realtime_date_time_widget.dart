import 'package:flutter/material.dart';

class ShowRealtimeDateTimeWidget extends StatelessWidget {
  const ShowRealtimeDateTimeWidget({
    super.key,
    required DateTime currentTime,
  }) : _currentTime = currentTime;

  final DateTime _currentTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${_currentTime.day}-${_currentTime.month}-${_currentTime.year}    <|>       ${_currentTime.hour} : ${_currentTime.minute} : ${_currentTime.second}",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}