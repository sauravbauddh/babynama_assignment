import 'package:babynama_assignment/features/track_vaccination/models/vaccination_card.dart';
import 'package:babynama_assignment/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VaccinationCard extends StatefulWidget {
  final VaccinationCardModel cardModel;

  const VaccinationCard({super.key, required this.cardModel});

  @override
  _VaccinationCardState createState() => _VaccinationCardState();
}

class _VaccinationCardState extends State<VaccinationCard> {
  @override
  Widget build(BuildContext context) {
    final daysRemaining =
        widget.cardModel.dueDate.difference(DateTime.now()).inDays;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      color: Palette.darkColor.withOpacity(0.8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.cardModel.name,
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    fontSize: _isLargeScreen(context) ? 18 : 16,
                    color: Palette.whiteColor,
                  ),
                ),
                _getStatusIndicator(widget.cardModel.status),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Due in: ${daysRemaining <= 0 ? 'Overdue' : '$daysRemaining days'}',
              style: GoogleFonts.openSans(
                color: Palette.greyColor.withOpacity(0.9),
              ),
            ),
            const SizedBox(height: 16),
            if (widget.cardModel.status == VaccinationStatus.overdue)
              _buildScheduleButton(context),
            const SizedBox(height: 16),
            _buildInfoButton(context),
          ],
        ),
      ),
    );
  }

  Widget _getStatusIndicator(VaccinationStatus status) {
    switch (status) {
      case VaccinationStatus.completed:
        return const Icon(Icons.check_circle, color: Palette.greenColor);
      case VaccinationStatus.upcoming:
        return const Icon(Icons.calendar_today, color: Palette.yellowColor);
      case VaccinationStatus.overdue:
        return const Icon(Icons.warning, color: Palette.redColor);
    }
  }

  Widget _buildScheduleButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Schedule Vaccination',
          style: GoogleFonts.openSans(
            fontSize: _isLargeScreen(context) ? 16 : 14,
            color: Palette.whiteColor,
          ),
        ),
        ElevatedButton(
          onPressed: () => _pickDate(context),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Palette.tealColor),
          ),
          child: Text(
            'Pick Date',
            style: GoogleFonts.openSans(
              color: Palette.whiteColor,
            ),
          ),
        ),
      ],
    );
  }

  void _pickDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 2),
    );
  }

  Widget _buildInfoButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(widget.cardModel.name),
            content: Text(
              'Detailed information about the vaccination...',
              style: GoogleFonts.openSans(
                color: Palette.whiteColor,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Palette.pinkColor),
      ),
      child: Text(
        'More Info',
        style: GoogleFonts.openSans(
          color: Palette.whiteColor,
        ),
      ),
    );
  }

  bool _isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 600;
  }
}
