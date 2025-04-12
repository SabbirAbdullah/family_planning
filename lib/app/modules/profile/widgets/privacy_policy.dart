import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 16.0,right: 16,left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Statement of Privacy'),
            _buildSectionContent(
                "We are committed to protecting the privacy and security of your personal data. The protection of your privacy in the processing of your personal data is an important concern to which we pay special attention in our business processes..."),

            _buildSectionTitle('Personal Data We Collect'),
            _buildSectionContent(
                "Personal data refers to data that allows us to know the specifics of who you are and which may be used to identify, contact, or locate you. This may include: \n- Name, age, gender \n- Mailing address, telephone number, email address \n- IP Address, location data \n- Information about your device"),

            _buildSectionTitle('How We Use Your Personal Data'),
            _buildSectionContent(
                "We process your personal data only for legitimate purposes, including fulfilling contracts, meeting legal obligations, and serving our legitimate business interests."),

            _buildSectionTitle('Marketing and Events'),
            _buildSectionContent(
                "We use personal information to send marketing and event communications across various platforms, such as email, telephone, and SMS..."),

            _buildSectionTitle('Legal Obligations'),
            _buildSectionContent(
                "We may be required to use and retain personal data for crime prevention, legal compliance, audits, and responding to government requests."),

            _buildSectionTitle('Sharing of Personal Data'),
            _buildSectionContent(
                "We do not sell or rent your personal data. However, we may share it with internal teams, business partners, and legal authorities when required by law."),

            _buildSectionTitle('Data Storage and Security'),
            _buildSectionContent(
                "We take measures to ensure that personal data is stored and processed securely, including encryption, monitoring, and regular audits."),

            _buildSectionTitle('Cookies'),
            _buildSectionContent(
                "We may use cookies to enhance user experience, personalize your experience, and securely store login credentials."),

            _buildSectionTitle('Children Under 13'),
            _buildSectionContent(
                "We do not knowingly collect personal information from children under 13 years old. If we discover that we have collected such data, we will take steps to delete it."),

            _buildSectionTitle('Your Rights'),
            _buildSectionContent(
                "You have the right to access, correct, erase, or object to the processing of your data. You can also withdraw consent and file complaints with data protection authorities."),

            _buildSectionTitle('Data Retention'),
            _buildSectionContent(
                "We retain personal data for as long as necessary for legal or business purposes, considering local laws and contractual obligations."),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        content,
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
