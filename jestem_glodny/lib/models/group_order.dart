// models/group_order.dart
import 'package:jestem_glodny/models/restaurant.dart';
import 'package:jestem_glodny/models/user.dart';

enum OrderStatus { active, completed, cancelled }

class GroupOrder {
  final String id;
  final Restaurant restaurant;
  final User creator;
  final DateTime deadline;
  final String description;
  final List<User> participants;
  final OrderStatus status;
  final DateTime createdAt;

  GroupOrder({
    required this.id,
    required this.restaurant,
    required this.creator,
    required this.deadline,
    required this.description,
    required this.participants,
    required this.status,
    required this.createdAt,
  });
}

// models/user.dart
