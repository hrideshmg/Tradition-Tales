import 'package:culture_app/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Holi Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  int _correctAnswers = 0;
  int _wrongAnswers = 0;
  int _lives = 3;

  List<Map<String, dynamic>> _questions = [
    {
      'question':
          'Holi, also known as the Festival of Colors, is a vibrant celebration observed in India and other parts of the world. What is the main activity associated with Holi?',
      'options': [
        'Lighting lamps and fireworks.',
        'Exchanging gifts and decorating homes.',
        'Throwing colored powder and water on each other.',
        'Participating in boat races and feasting.'
      ],
      'correctAnswerIndex': 2,
      'image':
          'https://example.com/holi_image.jpg', // Replace with your image URL
    },
    {
      'question':
          'Holi celebrates the arrival of spring and the triumph of good over evil. What legendary story is often associated with Holi?',
      'options': [
        'The birth of Lord Krishna.',
        'The victory of Lord Rama over Ravana.',
        'The churning of the cosmic ocean.',
        'The burning of Holika, the evil sister of Prahlad.'
      ],
      'correctAnswerIndex': 3,
      'image':
          'https://example.com/holi_image.jpg', // Replace with your image URL
    },
    {
      'question':
          'During Holi, people sing, dance, and throw colorful powder called "gulal" at each other. What is the significance of this playful exchange?',
      'options': [
        'To ward off bad luck for the coming year.',
        'To symbolize new beginnings and the shedding of inhibitions.',
        'To honor specific Hindu deities.',
        'To express gratitude for a bountiful harvest.'
      ],
      'correctAnswerIndex': 1,
      'image':
          'https://example.com/holi_image.jpg', // Replace with your image URL
    },
    {
      'question':
          'Holi is a time for forgiveness, reconciliation, and community bonding.  What food is traditionally associated with Holi?',
      'options': [
        'Spicy vindaloo curry',
        'Sweet and savory samosas',
        'Gujiya, a sweet filled dumpling.',
        'Tangy yogurt dip (raita)'
      ],
      'correctAnswerIndex': 2,
      'image':
          'https://example.com/holi_image.jpg', // Replace with your image URL
    },
  ];

  void _checkAnswer(int selectedIndex) {
    int correctAnswerIndex = _questions[_currentIndex]['correctAnswerIndex'];
    bool isCorrect = selectedIndex == correctAnswerIndex;
    if (isCorrect) {
      setState(() {
        _correctAnswers++;
      });
    } else {
      setState(() {
        _wrongAnswers++;
        _lives--;
      });
    }
    _showNextQuestion();
  }

  void _showNextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      // End of quiz, you can show a result screen or any other action here
      print('Quiz Ended!');
      print('Correct Answers: $_correctAnswers');
      print('Wrong Answers: $_wrongAnswers');
      // Navigate back to previous page when the game is over
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailsPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Handle back button press
        if (_lives == 0) {
          // Navigate back to previous page if lives reach 0
          Navigator.pop(context);
          return true; // Allow back navigation
        } else {
          return false; // Prevent back navigation
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Holi Quiz'),
          actions: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                // Navigate back to previous page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailsPage()),
                );
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                _questions[_currentIndex]['image'],
                width: 200, // Adjust the width as needed
                height: 200, // Adjust the height as needed
                fit: BoxFit.cover, // Adjust the BoxFit as needed
              ),
              SizedBox(height: 20),
              Text(
                _questions[_currentIndex]['question'],
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 20),
              Column(
                children: List.generate(
                  _questions[_currentIndex]['options'].length,
                  (index) => GestureDetector(
                    onTap: () {
                      _checkAnswer(index);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      margin: EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.indigo, // Changed color to indigo
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        _questions[_currentIndex]['options'][index],
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Lives: $_lives',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    'Timer: --:--', // Placeholder for timer
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              SizedBox(height: 20),
              if (_lives == 0)
                Text(
                  'Game Over!',
                  style: TextStyle(
                      fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              // Add a button to go to the next question
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo, // Changed button color to indigo
                ),
                onPressed: () {
                  _showNextQuestion();
                },
                child: Text(
                  'Next Question',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
