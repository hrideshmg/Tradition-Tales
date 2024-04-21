import 'package:culture_app/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class QuizScreen4 extends StatefulWidget {
  @override
  _QuizScreen4State createState() => _QuizScreen4State();
}

class _QuizScreen4State extends State<QuizScreen4> {
  int _currentIndex = 0;
  int _correctAnswers = 0;
  int _wrongAnswers = 0;
  int _lives = 3;

  List<Map<String, dynamic>> _questions = [
    {
      'question': 'Diwali, also known as the Festival of Lights, is a major celebration in India. What religion is most closely associated with Diwali?',
      'options': [
        'Hinduism ',
        'Buddhism',
        'Sikhism',
        'Jainism'
      ],
      'correctAnswerIndex': 0,
      
    },
    {
      'question': 'During Diwali, homes are decorated with diyas, small clay lamps filled with oil. What is the symbolic meaning of lighting diyas?',
      'options': [
        'To ward off evil spirits and usher in good fortune ',
        'To celebrate the harvest season',
        'To honor specific deities',
        'To create a festive atmosphere'
      ],
      'correctAnswerIndex': 0,
      
    },
    {
      'question': 'Fireworks are a popular tradition during Diwali.  What does the explosion of light represent during the festival?',
      'options': [
        'The triumph of good over evil ',
        'Welcoming the arrival of spring',
        'Celebrating a bountiful harvest',
        'Honoring ancestors'
      ],
      'correctAnswerIndex': 0,
      
    },
    {
      'question': 'Diwali is a time for feasting and exchanging gifts.  What is a traditional sweet treat associated with Diwali?',
      'options': [
        'Spicy samosas',
        'Savory pakoras',
        'Sweet and colorful mithai ',
        'Tangy chutneys'
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
          title: Text('Diwali Quiz'),
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
