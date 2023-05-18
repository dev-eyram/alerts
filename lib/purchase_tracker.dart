class PurchaseTracker {
  List<DateTime> purchaseTimestamps = [];

  void addPurchase() {
    purchaseTimestamps.add(DateTime.now());
  }

  bool isImpulseBuying() {
    // Set your thresholds for triggering an impulse buying alert
    const int maxPurchaseCount =
        3; // Maximum number of purchases within the time frame
    const Duration maxDuration = Duration(
        minutes: 60); // Maximum time frame for impulse buying (e.g., 1 hour)

    // Check if the number of purchases exceeds the threshold
    if (purchaseTimestamps.length > maxPurchaseCount) {
      return true;
    }

    // Check if the duration between the first and last purchase exceeds the threshold
    if (purchaseTimestamps.isNotEmpty &&
        purchaseTimestamps.last.difference(purchaseTimestamps.first) >
            maxDuration) {
      return true;
    }

    return false;
  }
}
