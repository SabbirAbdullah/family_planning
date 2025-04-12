import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GuidelinesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guidelines'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Bangladesh's Family Planning Guidelines"),
            _buildGuidelineItem("Community Engagement", "Involve religious leaders, civil society organizations, and elected community leaders."),
            _buildGuidelineItem("Communication", "Use communication to address the needs of adolescents, young people, and women and men of reproductive age."),
            _buildGuidelineItem("Contraceptive Security", "Ensure that contraceptives are available at all levels."),
            _buildGuidelineItem("Public-Private Partnership", "Work together to coordinate family planning services."),
            _buildGuidelineItem("Training", "Train service providers and regional managers on community-based family planning services."),
            _buildGuidelineItem("Facility-Based Services", "Ensure that family planning services are available at the facility level."),
            _buildGuidelineItem("Health Information System", "Manage and report family planning information."),
            _buildGuidelineItem("Family Planning Workforce", "Ensure that health care providers are competent and that midwives are supported."),

            _buildSectionTitle("Challenges to Family Planning in Bangladesh"),
            _buildGuidelineItem("High Adolescent Fertility Rate", "Many adolescents experience early pregnancies."),
            _buildGuidelineItem("High Discontinuation Rates for Contraceptives", "Many users discontinue contraceptive methods prematurely."),
            _buildGuidelineItem("Unmet Need for Family Planning Services", "Some individuals lack access to family planning options."),
            _buildGuidelineItem("Low Use of Long-Acting or Permanent Methods", "Few people use long-term contraceptive solutions."),
            _buildGuidelineItem("Regional Variations in Contraceptive Prevalence Rate", "Contraceptive usage varies across different regions."),

            _buildSectionTitle("Methods of Contraception"),
            _buildGuidelineItem("Implants", "A small rod inserted under the skin that releases hormones."),
            _buildGuidelineItem("Intrauterine Devices (IUDs)", "A device placed in the uterus to prevent pregnancy."),
            _buildGuidelineItem("Injections", "Hormonal injections given at intervals to prevent pregnancy."),
            _buildGuidelineItem("Pills", "Oral contraceptive pills taken daily."),
            _buildGuidelineItem("Vaginal Rings", "A flexible ring placed inside the vagina to release hormones."),
            _buildGuidelineItem("Barrier Methods", "Condoms and diaphragms that prevent sperm from reaching the egg."),
            _buildGuidelineItem("Sterilization", "Permanent methods such as tubal ligation and vasectomy."),
            _buildGuidelineItem("Emergency Contraception", "Pills taken after unprotected intercourse to prevent pregnancy."),
            _buildGuidelineItem("Natural Methods", "Techniques such as fertility awareness and withdrawal."),
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

  Widget _buildGuidelineItem(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            content,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}