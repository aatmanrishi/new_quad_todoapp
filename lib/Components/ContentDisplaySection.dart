import 'package:flutter/material.dart';

import 'package:new_quad_todoapp/Components/DataDisplaySection.dart';

class ContentDisplaySection extends StatelessWidget {
  const ContentDisplaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width < 800 ? 20.0 : 20,
        20,
        MediaQuery.of(context).size.width < 550 ? 20.0 : 60,
        20,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [DataDisplaySection()],
        ),
      ),
    );
  }
}
