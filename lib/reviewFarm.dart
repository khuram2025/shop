import 'package:flutter/material.dart';



class ReviewForm extends StatefulWidget {
  final Function(String comment, int rating) onSubmit;

  ReviewForm({required this.onSubmit});

  @override
  _ReviewFormState createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  int _selectedRating = 0;
  TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _commentController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Add a comment',
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return IconButton(
              icon: Icon(
                Icons.star,
                color: index < _selectedRating ? Colors.deepOrange : Colors.grey,
                size: 24,
              ),
              onPressed: () {
                setState(() {
                  _selectedRating = index + 1;
                });
              },
            );
          }),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onSubmit(_commentController.text, _selectedRating);
          },
          child: Text("Submit Review"),
        )
      ],
    );
  }
}
