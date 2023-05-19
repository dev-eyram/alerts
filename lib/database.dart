import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DatabaseProvider {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addExpense(
    double amount,
    String category,
    DateTime date,
    String userId,
  ) async {
    try {
      await _firestore.collection('expenses').add({
        'amount': amount,
        'category': category,
        'date': date,
        'userId': userId,
      });
    } catch (error) {
      if (kDebugMode) {
        print('Error occurred while adding an expense: $error');
      }
      // Handle the error here, display an error message, or re-throw the error
    }
  }

// Implement other database operations as needed
}
