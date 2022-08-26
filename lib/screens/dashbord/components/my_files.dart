import 'package:admin/models/MyFiles.dart';
import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'files_info_card.dart';

class MyFiles extends StatelessWidget {
  const MyFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            Text(
              "My Files",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Spacer(),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("Add New"),
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5,
                    vertical: Responsive.isMobile(context)
                        ? defaultPadding / 2
                        : defaultPadding),
              ),
            )
          ],
        ),
        SizedBox(height: defaultPadding),
        Responsive(
          mobile: FilesInfoCardGridView(
              childAspectRatio: size.width < 650 ? 1.3 : 1,
              crossAxisCount: size.width < 650 ? 2 : 4),
          tablet: FilesInfoCardGridView(childAspectRatio: 1),
          desktop: FilesInfoCardGridView(
              childAspectRatio: size.width < 1400 ? 1.1 : 1.4),
        ),
      ],
    );
  }
}

class FilesInfoCardGridView extends StatelessWidget {
  const FilesInfoCardGridView({
    Key? key,
    this.childAspectRatio = 1,
    this.crossAxisCount = 4,
  }) : super(key: key);

  final double childAspectRatio;
  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: demoMyFiels.length,
      itemBuilder: (context, index) => FilesInfoCard(info: demoMyFiels[index]),
    );
  }
}
