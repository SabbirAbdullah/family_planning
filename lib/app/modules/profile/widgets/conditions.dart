import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conditions'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildConditionTitle('Early Marriage'),
            _buildConditionContent('Many women marry before the legal age of 18.'),

            _buildConditionTitle('Low Contraceptive Use'),
            _buildConditionContent('The contraceptive prevalence rate (CPR) is low, especially in the eastern regions.'),

            _buildConditionTitle('High Adolescent Fertility Rate'),
            _buildConditionContent('Married adolescents have a lower CPR than other age groups.'),

            _buildConditionTitle('Over-Reliance on Temporary Contraception'),
            _buildConditionContent('Most women use temporary methods like the pill and injectables.'),

            _buildConditionTitle('High Population Growth Potential'),
            _buildConditionContent('Bangladesh\'s population has a large growth potential due to low mortality rates and high fertility rates.'),
          ],
        ),
      ),
    );
  }

  Widget _buildConditionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildConditionContent(String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        content,
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
