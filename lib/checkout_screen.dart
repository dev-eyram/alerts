import 'package:flutter/material.dart';
import 'purchase_tracker.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        automaticallyImplyLeading: true,
        scrolledUnderElevation: 2,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            handlePurchase(context);
          },
          child: const Text('Make Purchase'),
        ),
      ),
    );
  }

  void handlePurchase(BuildContext context) {
    // Code to process the purchase
    // ...

    // Create an instance of PurchaseTracker
    PurchaseTracker purchaseTracker = PurchaseTracker();

    // Add the purchase to the tracker
    purchaseTracker.addPurchase();

    // Check if impulse buying alert should be displayed
    if (purchaseTracker.isImpulseBuying()) {
      // Display the impulse buying alert
      showImpulseBuyingAlert(context);
    }
  }

  void showImpulseBuyingAlert(BuildContext context) {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      channelDescription: 'your_channel_description',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    flutterLocalNotificationsPlugin.show(
      0,
      'Impulse Buying Alert',
      'You have been making frequent purchases. Take a moment to reconsider.',
      platformChannelSpecifics,
      payload: 'alert',
    );
  }
}
