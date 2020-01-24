import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PickDate extends StatefulWidget {
  @override
  _PickDateState createState() => _PickDateState();
}

class _PickDateState extends State<PickDate> {
  DateTime _selectedDate = DateTime.now();
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: 'Date',
        suffix: IconButton(
          icon: Icon(Icons.date_range),
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: _selectedDate,
              firstDate: DateTime.now().subtract(Duration(days: 30)),
              lastDate: DateTime.now().add(Duration(days: 30)),
            ).then((selectedDate) {
              if (selectedDate != null) {
                _selectedDate = selectedDate;
                _controller.text = DateFormat.yMd().format(_selectedDate);
              }
            });
          },
        ),
      ),
    );
  }
}

class PickTime extends StatefulWidget {
  @override
  _PickTimeState createState() => _PickTimeState();
}

class _PickTimeState extends State<PickTime> {
  TimeOfDay _selectedTime = TimeOfDay.now();
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
          labelText: 'Time',
          suffix: IconButton(
            icon: Icon(Icons.access_time),
            onPressed: () {
              showTimePicker(
                context: context,
                initialTime: _selectedTime,
              ).then((selectedTime) {
                if (selectedTime != null) {
                  _selectedTime = selectedTime;
                  _controller.text = _selectedTime.format(context);
                }
              });
            },
          )),
    );
  }
}
