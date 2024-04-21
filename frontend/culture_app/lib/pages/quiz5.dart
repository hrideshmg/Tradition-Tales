import 'package:culture_app/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuizScreen5 extends StatefulWidget {
  @override
  _QuizScreen5State createState() => _QuizScreen5State();
}

class _QuizScreen5State extends State<QuizScreen5> {
  int _currentIndex = 0;
  int _correctAnswers = 0;
  int _wrongAnswers = 0;
  int _lives = 3;

  List<Map<String, dynamic>> _questions = [
    {
      'question':
          'During Rama\'s exile, a golden deer led him away, allowing Ravana to abduct Sita. What action by Rama led to this?',
      'options': [
        'He ignored Lakshmana\'s warnings and chased the deer.',
        'He left Sita alone to investigate a sound.',
        'He sent Lakshmana away on an errand.',
        'He believed the deer was a magical creature.'
      ],
      'correctAnswerIndex': 0,
      'image':
          'https://example.com/ramayana_image.jpg', // Replace with your image URL
    },
    {
      'question':
          'Jatayu, the giant vulture, reveals a crucial detail to Rama after witnessing Sita\'s abduction. What information does Jatayu share?',
      'options': [
        'The direction Ravana flew towards with Sita.',
        'The identity of the kidnapper but not the location.',
        'A secret weapon to defeat Ravana.',
        'The direction Ravana flew towards with Sita.'
      ],
      'correctAnswerIndex': 3,
    },
    {
      'question':
          'Rama helps Sugriva regain his throne in Kishkindha. How does this alliance benefit Rama\'s search for Sita?',
      'options': [
        'Sugriva offers Hanuman, his loyal advisor, to help find Sita.',
        'The alliance grants Rama access to a hidden treasure.',
        'Sugriva joins Rama\'s army to fight Ravana.',
        'Sugriva offers Hanuman, his loyal advisor, to help find Sita.'
      ],
      'correctAnswerIndex': 3,
    },
    {
      'question':
          'Building the bridge to Lanka presented a significant challenge. What best describes the difficulty faced during construction?',
      'options': [
        'Demons from Lanka constantly disrupted the effort.',
        'The bridge was built quickly and effortlessly.',
        'Lack of resources slowed down construction.',
        'Demons from Lanka constantly disrupted the effort.'
      ],
      'correctAnswerIndex': 0,
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
          title: Text('Ramayana Quiz'),
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
