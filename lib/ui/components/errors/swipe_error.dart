import 'package:flutter/material.dart';

class SwipeError extends StatelessWidget {
  final String text;
  const SwipeError(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Center(
        child: Column(
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 26,
                color: Colors.black,
              ),
            ),
            const Icon(
              Icons.refresh,
              color: Colors.blue,
            ),
            const Text(
              'Desliza para actualizar',
              style: TextStyle(
                fontSize: 26,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

}