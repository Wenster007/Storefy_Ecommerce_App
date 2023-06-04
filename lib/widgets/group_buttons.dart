import 'package:flutter/material.dart';

class GroupButtons extends StatefulWidget {
  const GroupButtons({Key? key, required this.onGroupButtonClick}) : super(key: key);
  final void Function (int index) onGroupButtonClick;

  @override
  State<GroupButtons> createState() => _GroupButtonsState();
}

class _GroupButtonsState extends State<GroupButtons> {
  int _activeButton = 0;

  void _onButtonPressed(int buttonIndex) {
    setState(() {
      _activeButton = buttonIndex;
      widget.onGroupButtonClick(buttonIndex);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () => _onButtonPressed(0),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              _activeButton == 0 ? Colors.green : Colors.white,
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
    _activeButton == 0 ? Colors.white : Colors.black,
    ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Set the border radius here
              ),
            ),
            minimumSize: MaterialStateProperty.all<Size>(
              Size(100, 40), // Set the desired width and height of the button
            ),
          ),
          child: const Text('All'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () => _onButtonPressed(1),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              _activeButton == 1 ? Colors.green : Colors.white,
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              _activeButton == 1 ? Colors.white : Colors.black,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Set the border radius here
              ),
            ),
            minimumSize: MaterialStateProperty.all<Size>(
              Size(100, 40), // Set the desired width and height of the button
            ),
          ),
          child: const Text('Cookies'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () => _onButtonPressed(2),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              _activeButton == 2 ? Colors.green : Colors.white,
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              _activeButton == 2 ? Colors.white : Colors.black,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Set the border radius here
              ),
            ),
            minimumSize: MaterialStateProperty.all<Size>(
              Size(100, 40), // Set the desired width and height of the button
            ),
          ),
          child: const Text('Candies'),
        ),
      ],
    );
  }
}
