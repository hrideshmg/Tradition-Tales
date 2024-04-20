import 'package:flutter/material.dart';

class QuestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quest: The Return of Mahabali'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QuestQuestion(
              question:
                  'As Mahabali, you seek counsel about your absence from Kerala. Who do you consult?',
              options: [
                'Villagers in the marketplace',
                'Sages in the temple',
                'Royal advisors in the palace',
                'None of the above'
              ],
            ),
            SizedBox(height: 20),
            QuestQuestion(
              question:
                  'During your journey back to Kerala, you encounter obstacles. What challenges do you face?',
              options: [
                'Treacherous caverns',
                'Formidable foes',
                'Perplexing puzzles',
                'Only Treacherous caverns and Formidable foes'
              ],
            ),
            SizedBox(height: 20),
            // Add more QuestQuestions here as needed
          ],
        ),
      ),
    );
  }
}

class QuestQuestion extends StatefulWidget {
  final String question;
  final List<String> options;

  const QuestQuestion({required this.question, required this.options});

  @override
  _QuestQuestionState createState() => _QuestQuestionState();
}

class _QuestQuestionState extends State<QuestQuestion> {
  late String selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.question,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.options.map((option) {
            return ListTile(
              title: Text(option),
              leading: Radio(
                value: option,
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
