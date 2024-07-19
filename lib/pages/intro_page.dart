import 'package:flutter/material.dart';
import 'package:eyevan7285/components/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Image.asset(
              'assets/eyevan_logo.png',
              height: 250,
            ),

            const SizedBox(height: 25),

            // title
            Text(
              'EYEVAN Inc.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 10),

            // subtitle
            Text(
              'EYEWEAR FOR DRESSING',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 12,
              ),
            ),

            const SizedBox(height: 45),

            // button
            MyButton(
              onTap: () => Navigator.pushNamed(context, '/shop_page'),
              child: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
