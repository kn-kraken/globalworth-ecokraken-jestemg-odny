import 'package:flutter/material.dart';
import 'package:jestem_glodny/models/group_order.dart';
import 'package:jestem_glodny/models/restaurant.dart';
import 'package:jestem_glodny/models/user.dart';
import 'package:jestem_glodny/style/constants.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool isCreateOrder = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Zamówienia grupowe',
            style: AppStyles.mainBold.copyWith(fontSize: 20),
          ),
          backgroundColor: AppColors.background2,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: AppColors.background1,
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.background2,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isCreateOrder = true),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color:
                              isCreateOrder
                                  ? AppColors.primary1
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          'Utwórz',
                          textAlign: TextAlign.center,
                          style: AppStyles.mainBold.copyWith(
                            fontSize: 16,
                            color:
                                isCreateOrder ? Colors.white : AppColors.text1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isCreateOrder = false),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color:
                              !isCreateOrder
                                  ? AppColors.primary1
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          'Dołącz',
                          textAlign: TextAlign.center,
                          style: AppStyles.mainBold.copyWith(
                            fontSize: 16,
                            color:
                                !isCreateOrder ? Colors.white : AppColors.text1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Content based on selection
            Expanded(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child:
                    isCreateOrder ? CreateOrderContent() : JoinOrderContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateOrderContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CreateOrderScreen();
  }
}

class JoinOrderContent extends StatelessWidget {
  // Example active orders
  final List<GroupOrder> activeOrders = [
    GroupOrder(
      id: '1',
      restaurant: Restaurant(
        id: '1',
        name: 'McDonald\'s',
        isInGlobalworth: false,
        address: 'ul. Czerniakowska 124',
      ),
      creator: User(id: '1', name: 'Jan Kowalski'),
      deadline: DateTime.now().add(Duration(hours: 1)),
      description: 'Zamawiamy burgery, kto dołącza?',
      participants: [],
      status: OrderStatus.active,
      createdAt: DateTime.now(),
    ),
    // Add more example orders as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: activeOrders.length,
      itemBuilder: (context, index) {
        final order = activeOrders[index];
        return Card(
          margin: EdgeInsets.only(bottom: 16),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderDetailsScreen(order: order),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        order.restaurant.isInGlobalworth
                            ? Icons.star
                            : Icons.restaurant,
                        color:
                            order.restaurant.isInGlobalworth
                                ? AppColors.gold
                                : null,
                      ),
                      SizedBox(width: 8),
                      Text(
                        order.restaurant.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(order.description),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Deadline: ${order.deadline.hour}:${order.deadline.minute.toString().padLeft(2, '0')}',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      Text(
                        'Uczestnicy: ${order.participants.length}',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CreateOrderScreen extends StatefulWidget {
  @override
  _CreateOrderScreenState createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  Restaurant? selectedRestaurant;
  DateTime orderDeadline = DateTime.now().add(Duration(hours: 1));
  String orderDescription = '';

  final List<Restaurant> nearbyRestaurants = [
    Restaurant(
      id: '1',
      name: 'Subway',
      isInGlobalworth: true,
      address: 'Globalworth Tower, parter',
    ),
    Restaurant(
      id: '2',
      name: 'Salad Box',
      isInGlobalworth: true,
      address: 'Globalworth Plaza, parter',
    ),
    Restaurant(
      id: '3',
      name: 'McDonald\'s',
      isInGlobalworth: false,
      address: 'ul. Czerniakowska 124, 350m',
    ),
    Restaurant(
      id: '4',
      name: 'Berlin Döner Kebap',
      isInGlobalworth: false,
      address: 'ul. Domaniewska 37, 400m',
    ),
    Restaurant(
      id: '5',
      name: 'Istanbul Kebab',
      isInGlobalworth: false,
      address: 'ul. Wołoska 12, 550m',
    ),
    Restaurant(
      id: '6',
      name: 'KFC',
      isInGlobalworth: false,
      address: 'ul. Marynarska 15, 600m',
    ),
    Restaurant(
      id: '7',
      name: 'Burger King',
      isInGlobalworth: false,
      address: 'ul. Domaniewska 48, 700m',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Restaurant selection section
            Card(
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Wybierz restaurację',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Image.asset(
                          'assets/images/leaf.png',
                          width: 24,
                          height: 24,
                        ),
                        Text('× 5', style: TextStyle(color: AppColors.text1)),
                      ],
                    ),
                    SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: nearbyRestaurants.length,
                        separatorBuilder:
                            (context, index) => Divider(height: 1),
                        itemBuilder: (context, index) {
                          final restaurant = nearbyRestaurants[index];
                          return ListTile(
                            leading: Icon(
                              restaurant.isInGlobalworth
                                  ? Icons.star
                                  : Icons.restaurant,
                              color:
                                  restaurant.isInGlobalworth
                                      ? AppColors.gold
                                      : null,
                            ),
                            title: Text(
                              restaurant.name,
                              style: TextStyle(
                                fontWeight:
                                    selectedRestaurant?.id == restaurant.id
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                              ),
                            ),
                            subtitle: Text(restaurant.address),
                            selected: selectedRestaurant?.id == restaurant.id,
                            onTap: () {
                              setState(() {
                                selectedRestaurant = restaurant;
                              });
                            },
                            tileColor:
                                selectedRestaurant?.id == restaurant.id
                                    ? Colors.blue[50]
                                    : null,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // Order description section
            Card(
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Opis zamówienia',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Np. Zamawiamy pizze, kto dołącza?',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: AppColors.background2,
                      ),
                      maxLines: 3,
                      onChanged: (value) {
                        setState(() {
                          orderDescription = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // Deadline section
            Card(
              elevation: 2,
              child: InkWell(
                onTap: _selectDeadline,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deadline na zamówienia',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.access_time, color: Colors.blue),
                          SizedBox(width: 8),
                          Text(
                            '${orderDeadline.day}/${orderDeadline.month}/${orderDeadline.year} ${orderDeadline.hour}:${orderDeadline.minute.toString().padLeft(2, '0')}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 24),

            // Create order button
            ElevatedButton(
              onPressed: _canCreateOrder() ? _createOrder : null,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Utwórz zamówienie grupowe',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _canCreateOrder() {
    return selectedRestaurant != null &&
        orderDescription.isNotEmpty &&
        orderDeadline.isAfter(DateTime.now());
  }

  void _selectDeadline() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: orderDeadline,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 7)),
    );

    if (date != null) {
      final TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(orderDeadline),
      );

      if (time != null) {
        setState(() {
          orderDeadline = DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
          );
        });
      }
    }
  }

  void _createOrder() {
    if (selectedRestaurant == null) return;

    final currentUser = User(id: '1', name: 'Current User');

    final order = GroupOrder(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      restaurant: selectedRestaurant!,
      creator: currentUser,
      deadline: orderDeadline,
      description: orderDescription,
      participants: [],
      status: OrderStatus.active,
      createdAt: DateTime.now(),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => OrderDetailsScreen(order: order)),
    );
  }
}

class OrderDetailsScreen extends StatefulWidget {
  final GroupOrder order;

  const OrderDetailsScreen({Key? key, required this.order}) : super(key: key);

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  String userOrder = '';
  bool isJoiningOnly = false;

  @override
  Widget build(BuildContext context) {
    final bool isActive =
        widget.order.status == OrderStatus.active &&
        widget.order.deadline.isAfter(DateTime.now());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Szczegóły zamówienia'), elevation: 2),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Restaurant header
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          widget.order.restaurant.isInGlobalworth
                              ? Icons.star
                              : Icons.restaurant,
                          color:
                              widget.order.restaurant.isInGlobalworth
                                  ? AppColors.gold
                                  : null,
                          size: 30,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.order.restaurant.name,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                widget.order.restaurant.address,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Status indicator
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: isActive ? Colors.green[100] : Colors.red[100],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        isActive ? 'Aktywne' : 'Zakończone',
                        style: TextStyle(
                          color: isActive ? Colors.green[700] : Colors.red[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(height: 16),

                    // Order description
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Opis zamówienia',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              widget.order.description,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 16),

                    // Deadline card
                    Card(
                      elevation: 2,
                      child: ListTile(
                        leading: Icon(
                          Icons.access_time,
                          color: AppColors.primary2,
                        ),
                        title: Text('Deadline na zamówienia'),
                        subtitle: Text(
                          '${widget.order.deadline.day}/${widget.order.deadline.month}/${widget.order.deadline.year} ${widget.order.deadline.hour}:${widget.order.deadline.minute.toString().padLeft(2, '0')}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),

                    SizedBox(height: 16),

                    // Participants section
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Uczestnicy',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary2,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Text(
                                    '${widget.order.participants.length}',
                                    style: TextStyle(
                                      color: AppColors.background2,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            if (widget.order.participants.isEmpty)
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    'Brak uczestników',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                              )
                            else
                              ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: widget.order.participants.length,
                                separatorBuilder:
                                    (context, index) => Divider(height: 1),
                                itemBuilder: (context, index) {
                                  final participant =
                                      widget.order.participants[index];
                                  return ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.blue[100],
                                      child: Text(
                                        participant.name[0].toUpperCase(),
                                        style: TextStyle(
                                          color: Colors.blue[900],
                                        ),
                                      ),
                                    ),
                                    title: Text(participant.name),
                                    subtitle:
                                        participant.order != null
                                            ? Text(participant.order!)
                                            : Text(
                                              'Tylko dołączył/a',
                                              style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                  );
                                },
                              ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 16),

                    // Join order section
                    if (isActive)
                      Card(
                        elevation: 2,
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dołącz do zamówienia',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SwitchListTile(
                                title: Text('Tylko dołączam (nie zamawiam)'),
                                value: isJoiningOnly,
                                onChanged: (bool value) {
                                  setState(() {
                                    isJoiningOnly = value;
                                  });
                                },
                              ),
                              if (!isJoiningOnly) ...[
                                SizedBox(height: 8),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Twoje zamówienie',
                                    hintText: 'Wpisz co chcesz zamówić',
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    fillColor: Colors.grey[50],
                                  ),
                                  maxLines: 3,
                                  onChanged: (value) {
                                    setState(() {
                                      userOrder = value;
                                    });
                                  },
                                ),
                              ],
                              SizedBox(height: 16),
                              ElevatedButton(
                                onPressed:
                                    isJoiningOnly || userOrder.isNotEmpty
                                        ? _joinOrder
                                        : null,
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  isJoiningOnly
                                      ? 'Dołącz do grupy'
                                      : 'Dołącz do zamówienia',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _joinOrder() {
    final newParticipant = User(
      id: DateTime.now().toString(),
      name: 'New Participant',
      order: isJoiningOnly ? null : userOrder,
    );

    setState(() {
      widget.order.participants.add(newParticipant);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isJoiningOnly ? 'Dołączono do grupy!' : 'Dołączono do zamówienia!',
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
