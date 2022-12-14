import 'package:cr_calendar/cr_calendar.dart';
import 'package:register/res/colors.dart';
import 'package:register/utils/constants.dart';
import 'package:register/utils/extensions.dart';
import 'package:register/widgets/create_event_dialog.dart';
import 'package:register/widgets/day_events_bottom_sheet.dart';
import 'package:register/widgets/day_item_widget.dart';
import 'package:register/widgets/event_widget.dart';
import 'package:register/widgets/week_days_widget.dart';
import 'package:flutter/material.dart';

/// Main calendar page.
class CalendarPage extends StatefulWidget {
  static String tag = 'CalendarPage';
  const CalendarPage({super.key});

  @override
  _CalendarPage createState() => _CalendarPage();
}

class _CalendarPage extends State<CalendarPage>
    with SingleTickerProviderStateMixin {
  final _currentDate = DateTime.now();

  late CrCalendarController _calendarController;
  late String _appbarTitle;
  late String _monthName;
  @override
  void initState() {
    _setTexts(_currentDate.year, _currentDate.month);
    _createExampleEvents();

    super.initState();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Calendar web app'),
        actions: [
          IconButton(
            tooltip: 'Ir al dia actual',
            icon: const Icon(Icons.calendar_today),
            onPressed: _showCurrentMonth,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addEvent,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          /// Calendar control row.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  _changeCalendarPage(showNext: false);
                },
              ),
              Text(
                _monthName,
                style: const TextStyle(
                    fontSize: 16, color: green, fontWeight: FontWeight.w600),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  _changeCalendarPage(showNext: true);
                },
              ),
            ],
          ),

          /// Calendar view.
          Expanded(
            child: CrCalendar(
              firstDayOfWeek: WeekDay.monday,
              eventsTopPadding: 32,
              initialDate: _currentDate,
              maxEventLines: 3,
              controller: _calendarController,
              forceSixWeek: true,
              dayItemBuilder: (builderArgument) =>
                  DayItemWidget(properties: builderArgument),
              weekDaysBuilder: (day) => WeekDaysWidget(day: day),
              eventBuilder: (drawer) => EventWidget(drawer: drawer),
              onDayClicked: _showDayEventsInModalSheet,
              minDate: DateTime.now().subtract(const Duration(days: 1000)),
              maxDate: DateTime.now().add(const Duration(days: 180)),
            ),
          ),
        ],
      ),
    );
  }

  /// Control calendar with arrow buttons.
  void _changeCalendarPage({required bool showNext}) => showNext
      ? _calendarController.swipeToNextMonth()
      : _calendarController.swipeToPreviousPage();

  void _onCalendarPageChanged(int year, int month) {
    setState(() {
      _setTexts(year, month);
    });
  }

  /// Set app bar text and month name over calendar.
  void _setTexts(int year, int month) {
    final date = DateTime(year, month);
    _appbarTitle = date.format(kAppBarDateFormat);
    _monthName = date.format(kMonthFormat);
  }

  /// Show current month page.
  void _showCurrentMonth() {
    _calendarController.goToDate(_currentDate);
  }

  /// Show [CreateEventDialog] with settings for new event.
  Future<void> _addEvent() async {
    final event = await showDialog(
        context: context, builder: (context) => const CreateEventDialog());
    if (event != null) {
      _calendarController.addEvent(event);
    }
  }

  void _createExampleEvents() {
    final now = _currentDate;
    _calendarController = CrCalendarController(
      onSwipe: _onCalendarPageChanged,
      events: [
        CalendarEventModel(
          name: 'Conferencia Amar a madrazos 8am 9pm/ Diana Flores Ahuatzin ',
          begin: DateTime(now.year, now.month, (now.day).clamp(1, 2)),
          end: DateTime(now.year, now.month, (now.day).clamp(1, 1)),
          eventColor: eventColors[0],
        ),
        CalendarEventModel(
          name: 'Clases de dansa edificio P 9am 10pm/ Francisco Javier',
          begin: DateTime(now.year, now.month, (now.day).clamp(1, 2)),
          end: DateTime(now.year, now.month, (now.day).clamp(1, 2)),
          eventColor: eventColors[1],
        ),
        CalendarEventModel(
          name: 'Reunion con alumnos de DENAM 10am 12pm/ Francisco Javier',
          begin: DateTime(now.year, now.month, (now.day).clamp(1, 3)),
          end: DateTime(now.year, now.month, (now.day).clamp(1, 2)),
          eventColor: eventColors[2],
        ),
        CalendarEventModel(
          name: 'Reuinion con laumnos de IDGS 11am 12pm/ Francisco Javier',
          begin: DateTime(now.year, now.month, (now.day).clamp(1, 1)),
          end: DateTime(now.year, now.month, (now.day).clamp(1, 1)),
          eventColor: eventColors[3],
        ),
        CalendarEventModel(
          name: 'Demostracion de competencias 10am 12pm/ Francisco Javier',
          begin: DateTime(now.year, now.month, (now.day).clamp(2, 2)),
          end: DateTime(now.year, now.month, (now.day).clamp(2, 2)),
          eventColor: eventColors[4],
        ),
      ],
    );
  }

  void _showDayEventsInModalSheet(
      List<CalendarEventModel> events, DateTime day) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8))),
        isScrollControlled: true,
        context: context,
        builder: (context) => DayEventsBottomSheet(
              events: events,
              day: day,
              screenHeight: MediaQuery.of(context).size.height,
            ));
  }
}
