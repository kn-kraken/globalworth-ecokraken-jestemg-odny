import 'package:flutter/material.dart';
import 'package:jestem_glodny/screens/points_info_popup_screen.dart';
import 'package:jestem_glodny/style/constants.dart';
import 'package:jestem_glodny/widgets/eat_list_tile.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class MealShareActionScreen extends StatefulWidget {
  const MealShareActionScreen({super.key});

  @override
  State<MealShareActionScreen> createState() => _MealShareActionScreenState();
}

class _MealShareActionScreenState extends State<MealShareActionScreen> {
  bool isEatSelected = true;
  DateTime? selectedDate;
  File? _imageFile;
  String selectedTag = '';
  final List<String> availableTags = [
    'wege',
    'mięsne',
    'wegetariańskie',
    'bez glutenu',
    'ostre',
  ];

  final List<Map<String, dynamic>> eatItems = [
    {
      'title': 'Sałatka',
      'date': '01/04',
      'author': 'Kasia',
      'quantity': 3,
      'points': 25,
      'type': 'wege',
      'description':
          'Świeża sałatka z mixem sałat, pomidorkami cherry, ogórkiem, czerwoną cebulą i sosem vinaigrette. Idealna jako lekki lunch lub dodatek do dania głównego.',
    },
    {
      'title': 'Lasagne',
      'date': '01/04',
      'author': 'Marek',
      'quantity': 2,
      'points': 50,
      'type': 'mięsne',
      'description':
          'Tradycyjna włoska lasagne z sosem bolońskim, beszamelem i serem. Zapiekana z dodatkiem świeżych ziół. Porcja bardzo sycąca.',
    },
    {
      'title': 'Hummus',
      'date': '01/04',
      'author': 'Anna',
      'quantity': 4,
      'points': 20,
      'type': 'wege',
      'description':
          'Kremowy hummus z ciecierzycy z dodatkiem tahini, oliwy z oliwek i kuminu. Świetny jako dip do warzyw lub dodatek do kanapek.',
    },
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 30)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primary1,
              onPrimary: Colors.white,
              surface: AppColors.background2,
              onSurface: AppColors.text1,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);

      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      print("Błąd podczas wybierania zdjęcia: $e");
    }
  }

  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.background2,
          title: Text(
            'Wybierz źródło zdjęcia',
            style: AppStyles.mainBold.copyWith(fontSize: 18),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt, color: AppColors.primary1),
                title: Text('Aparat', style: TextStyle(color: AppColors.text1)),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library, color: AppColors.primary1),
                title: Text(
                  'Galeria',
                  style: TextStyle(color: AppColors.text1),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTagSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Typ dania',
          style: TextStyle(color: AppColors.text2, fontSize: 14),
        ),
        SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children:
              availableTags.map((tag) {
                final isSelected = selectedTag == tag;
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedTag = tag;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color:
                          isSelected
                              ? AppColors.primary1
                              : AppColors.background2,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color:
                            isSelected
                                ? AppColors.primary1
                                : AppColors.text2.withOpacity(0.3),
                      ),
                    ),
                    child: Text(
                      tag,
                      style: TextStyle(
                        color: isSelected ? Colors.white : AppColors.text1,
                        fontSize: 14,
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }

  Widget _buildImageSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Zdjęcie dania (opcjonalne)',
          style: TextStyle(color: AppColors.text2, fontSize: 14),
        ),
        SizedBox(height: 8),
        InkWell(
          onTap: _showImageSourceDialog,
          child: Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: AppColors.background2,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.text2.withOpacity(0.3),
                width: 1,
              ),
            ),
            child:
                _imageFile != null
                    ? ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          Image.file(
                            _imageFile!,
                            width: double.infinity,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            right: 8,
                            top: 8,
                            child: IconButton(
                              icon: Icon(Icons.close, color: Colors.white),
                              onPressed: () {
                                setState(() {
                                  _imageFile = null;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                    : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt_outlined,
                          size: 40,
                          color: AppColors.text2,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Dodaj zdjęcie dania',
                          style: TextStyle(
                            color: AppColors.text2,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Kliknij aby wybrać z galerii lub zrobić nowe',
                          style: TextStyle(
                            color: AppColors.text2.withOpacity(0.7),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddMealForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Dodaj danie', style: AppStyles.mainBold.copyWith(fontSize: 24)),
          SizedBox(height: 24),
          _buildImageSection(),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Nazwa dania',
              labelStyle: TextStyle(color: AppColors.text2),
              filled: true,
              fillColor: AppColors.background2,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            maxLines: 3,
            decoration: InputDecoration(
              labelText: 'Opis',
              labelStyle: TextStyle(color: AppColors.text2),
              filled: true,
              fillColor: AppColors.background2,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Ilość porcji',
                    labelStyle: TextStyle(color: AppColors.text2),
                    filled: true,
                    fillColor: AppColors.background2,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: InkWell(
                  onTap: () => _selectDate(context),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    decoration: BoxDecoration(
                      color: AppColors.background2,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      selectedDate != null
                          ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                          : "Wybierz datę",
                      style: TextStyle(
                        color:
                            selectedDate != null
                                ? AppColors.text1
                                : AppColors.text2,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Image.asset(
                'assets/images/leaf.png',
                height: 40,
                width: 40,
              ),
              labelText: 'Wycena',
              labelStyle: TextStyle(color: AppColors.text2),
              filled: true,
              fillColor: AppColors.background2,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 16),
          _buildTagSelector(),
          SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Implementacja dodawania dania
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary1,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Dodaj danie',
                style: AppStyles.mainBold.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.text1),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Jadłodzielenie',
          style: AppStyles.mainBold.copyWith(fontSize: 20),
        ),
        backgroundColor: AppColors.background2,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: AppColors.background1,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 8, top: 16),
            child: Row(
              children: [
                Card(
                  color: AppColors.background2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    width: 100,
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/ramen.png',
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "3",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: AppColors.text1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Card(
                  color: AppColors.background2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    width: 100,
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/leaf.png',
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "300",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: AppColors.text1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    GestureDetector(
                      child: Icon(Icons.info, size: 33),
                      onTap:
                          () => showDialog<String>(
                            context: context,
                            builder:
                                (BuildContext context) => AlertDialog(
                                  content: PointsInfoPopupScreen(),
                                ),
                          ),
                    ),
                  ],
                ),
                SizedBox(width: 20),
              ],
            ),
          ),
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
                    onTap: () => setState(() => isEatSelected = true),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color:
                            isEatSelected
                                ? AppColors.primary1
                                : Colors.transparent,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        'Zjedz',
                        textAlign: TextAlign.center,
                        style: AppStyles.mainBold.copyWith(
                          fontSize: 16,
                          color: isEatSelected ? Colors.white : AppColors.text1,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => isEatSelected = false),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color:
                            !isEatSelected
                                ? AppColors.primary1
                                : Colors.transparent,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        'Gotuj',
                        textAlign: TextAlign.center,
                        style: AppStyles.mainBold.copyWith(
                          fontSize: 16,
                          color:
                              !isEatSelected ? Colors.white : AppColors.text1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child:
                isEatSelected
                    ? ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemCount: eatItems.length,
                      itemBuilder: (context, index) {
                        final item = eatItems[index];
                        return EatListTile(
                          title: item['title'],
                          date: item['date'],
                          author: item['author'],
                          quantity: item['quantity'],
                          points: item['points'],
                          type: item['type'],
                          description: item['description'],
                        );
                      },
                    )
                    : SingleChildScrollView(child: _buildAddMealForm()),
          ),
        ],
      ),
    );
  }
}
