import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}
String? selectedOption = 'Please select';

List<String> options = ['Please select', 'JAN', 'FEB' , 'MAR' , 'APR', 'MAY' , 'JUN', 'JULY', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'];

class _AppState extends State<App> {

  //CalendarController _calendarController = CalendarController();

  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  void dispose() {
   // _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text('Attendance'),
        backgroundColor: Color(0xff764adc),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 300,
                  child: DropdownButton<String>(
                    value: selectedOption,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedOption = newValue;
                      });
                    },
                    items: options.map<DropdownMenuItem<String>>((String option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xff764adc),
                    border: Border.all(color: Color(0xff764adc)),
                  ),
                  child: TextButton(
                    onPressed: () {
                      print('Add button pressed with selected option: $selectedOption');
                    },
                    style: TextButton.styleFrom(
                      primary: Color(0xff764adc),
                    ),
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            height: 200.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                final day = _focusedDay.add(Duration(days: index - 3));
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 390,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: TableCalendar(
                     // calendarController: _calendarController,
                      focusedDay: day,
                      firstDay: DateTime(2000),
                      lastDay: DateTime(2100),
                      calendarFormat: CalendarFormat.week,
                      onPageChanged: (focusedDay) {
                        setState(() {
                          _focusedDay = focusedDay;
                        });
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hello World', style: TextStyle(fontSize: 18.0)),
              SizedBox(width: 85.0),
              ElevatedButton(
                onPressed: () {
                  // Handle the "Present" button press here
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Colors.green),
                ),
                child: Text('Present'),
              ),
              SizedBox(width: 1.5),
              ElevatedButton(
                onPressed: () {
                  // Handle the "Absent" button press here
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Colors.red),
                ),
                child: Text('Absent'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
