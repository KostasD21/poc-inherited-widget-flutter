class TravelPeriod {
  final int id;
  final String location;
  final int persons;  // Add this field
  final String currency;
  final String status;

  TravelPeriod(
    this.id,
    this.location, 
    this.currency,
    this.status,
    {this.persons = 1}  // Default to 1 person
  );

  @override
  String toString() {
    return 'TravelPeriod(id: $id, location: $location, currency: $currency, status: $status, persons: $persons)';
  }
}