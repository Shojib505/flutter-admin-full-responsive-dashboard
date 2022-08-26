import 'package:admin/constants.dart';
import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';

import 'components/header.dart';
import 'components/my_files.dart';
import 'components/recent_fiels.dart';
import 'components/storage_details.dart';

class DashbordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: defaultPadding),
                child: Header(),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        const MyFiles(),
                        const SizedBox(height: defaultPadding),
                        const RecentFiels(),
                        if (Responsive.isMobile(context))
                          const SizedBox(height: defaultPadding),
                        if (Responsive.isMobile(context)) StorageDetails(),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                    const SizedBox(width: defaultPadding),
                  if (!Responsive.isMobile(context))
                    const Expanded(
                      flex: 2,
                      child: StorageDetails(),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
