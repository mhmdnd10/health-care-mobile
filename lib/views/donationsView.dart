import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcareapp/controllers/donationController.dart';

class DonationsView extends StatefulWidget {
  const DonationsView({super.key});

  @override
  State<DonationsView> createState() => _DonationsViewState();
}

class _DonationsViewState extends State<DonationsView> {
  DonationController controller = Get.put(DonationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Blood Donations',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Requests near you',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 20),
            Expanded(
                child: ListView.builder(
              itemCount: controller.donations.length,
              itemBuilder: (context, index) {
                final donation = controller.donations[index];
                return ListTile(
                  title: Text(donation['hospital_name']!),
                  subtitle: Text(
                    donation['blood_type']!,
                    style: TextStyle(color: Colors.blue),
                  ),
                  trailing: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Donate',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
