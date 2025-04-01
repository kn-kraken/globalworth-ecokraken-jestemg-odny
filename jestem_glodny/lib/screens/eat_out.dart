import 'package:flutter/material.dart';
import 'package:jestem_glodny/style/constants.dart';

class LunchListWidget extends StatefulWidget {
  @override
  _LunchListWidgetState createState() => _LunchListWidgetState();
}

class _LunchListWidgetState extends State<LunchListWidget> {
  List<LunchEvent> lunchEvents = [
    LunchEvent(name: "Obiad w restauracji A", time: DateTime.now()),
    LunchEvent(
      name: "Pizza w miejscu B",
      time: DateTime.now().add(Duration(hours: 1)),
    ),
    LunchEvent(
      name: "Sushi w miejscu C",
      time: DateTime.now().add(Duration(hours: 2)),
    ),
  ];

  final TextEditingController _nameController = TextEditingController();
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wyjście na lunch'), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddLunchDialog(context),
        // backgroundColor: AppColors.primary1,
        // foregroundColor: AppColors.background2,
        child: Icon(Icons.add),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[100]),
        child: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: lunchEvents.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
              child: ListTile(
                leading: Icon(Icons.restaurant, color: AppColors.primary1),
                title: Text(
                  lunchEvents[index].name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "${lunchEvents[index].time.hour.toString().padLeft(2, '0')}:${lunchEvents[index].time.minute.toString().padLeft(2, '0')}",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () => _showOptionsDialog(context),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _showAddLunchDialog(BuildContext context) async {
    _nameController.clear();
    _selectedTime = TimeOfDay.now();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            'Dodaj nowe wyjście',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nazwa miejsca',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary1,
                  foregroundColor: AppColors.background2,
                  minimumSize: Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Wybierz godzinę', style: TextStyle(fontSize: 16)),
                onPressed: () async {
                  final TimeOfDay? time = await showTimePicker(
                    context: context,
                    initialTime: _selectedTime,
                  );
                  if (time != null) {
                    setState(() {
                      _selectedTime = time;
                    });
                  }
                },
              ),
              SizedBox(height: 16),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.background2,
                  foregroundColor: AppColors.primary1, // Text color
                  side: BorderSide(color: Colors.pink, width: 2),
                  minimumSize: Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Dodaj', style: TextStyle(fontSize: 16)),
                onPressed: () {
                  if (_nameController.text.isNotEmpty) {
                    setState(() {
                      final now = DateTime.now();
                      final newDateTime = DateTime(
                        now.year,
                        now.month,
                        now.day,
                        _selectedTime.hour,
                        _selectedTime.minute,
                      );
                      lunchEvents.add(
                        LunchEvent(
                          name: _nameController.text,
                          time: newDateTime,
                        ),
                      );
                    });
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showOptionsDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            'Co chcesz zrobić?',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary1,
                  foregroundColor: AppColors.background2,
                  minimumSize: Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Idę', style: TextStyle(fontSize: 16)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 12),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.pink, // Text color
                  side: BorderSide(
                    color: Colors.pink,
                    width: 2,
                  ), // Border color
                  minimumSize: Size(double.infinity, 45),
                  backgroundColor: Colors.white, // Button background
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ), // Padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Wracam",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary3,
                  foregroundColor: AppColors.background2,
                  minimumSize: Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Poczekajcie chwilę',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  _showWaitTimeDialog(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showWaitTimeDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            'Wybierz czas oczekiwania',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTimeButton(context, '5 minut', AppColors.primary1),
              SizedBox(height: 8),
              _buildTimeButton(context, '10 minut', AppColors.primary3),
              SizedBox(height: 8),
              _buildTimeButton(context, '15 minut', AppColors.primary4),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTimeButton(BuildContext context, String text, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: AppColors.background2,
        minimumSize: Size(double.infinity, 45),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(text, style: TextStyle(fontSize: 16)),
      onPressed: () {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      },
    );
  }
}

class LunchEvent {
  final String name;
  final DateTime time;

  LunchEvent({required this.name, required this.time});
}
