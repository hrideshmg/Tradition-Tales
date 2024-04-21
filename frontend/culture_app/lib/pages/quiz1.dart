import 'package:culture_app/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          'Theyyam is a vibrant ritual art form primarily found in which region of India?',
      'options': ['Tamil Nadu', 'Karnataka', 'North Kerala', 'Andhra Pradesh'],
      'correctAnswerIndex': 2,
    },
    {
      'question':
          'Theyyam performances depict a variety of characters through elaborate costumes and makeup. What is the PRIMARY purpose of these performances?',
      'options': [
        'To showcase the beauty of traditional dance forms.',
        'To entertain audiences with vibrant costumes and music.',
        'To appease deities and spirits, seeking blessings and maintaining harmony.',
        'To reenact historical events and battles.'
      ],
      'correctAnswerIndex': 2,
    },
    {
      'question':
          'Theyyam performances are often held at specific locations during festivals.  Where are Theyyam performances MOST LIKELY to take place?',
      'options': [
        'In large stadiums with thousands of spectators.',
        'Inside grand palaces for the royal court.',
        'At temples, shrines, and sacred groves.',
        'In bustling marketplaces for public entertainment.'
      ],
      'correctAnswerIndex': 2,
    },
    {
      'question':
          'Theyyam costumes are known for their impressive size and intricate details. What material is MOST LIKELY used to create the lightweight but sturdy framework for the towering headdresses?',
      'options': [
        'Heavy metal plates',
        'Thick layers of fabric',
        'Light bamboo frames',
        'Carved wooden blocks'
      ],
      'correctAnswerIndex': 2,
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
      Navigator.pop(context);
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
          title: Text('Theyyam Quiz'),
          actions: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                // Navigate back to previous page
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                ],
              ),
              SizedBox(height: 20),
              if (_lives == 0)
                Text(
                  'Game Over!',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              // Add a button to go to the next question
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.indigo, // Changed button color to indigo
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
