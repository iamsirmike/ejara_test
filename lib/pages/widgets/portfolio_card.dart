import 'package:crypto_app/utils/colors.dart';
import 'package:flutter/material.dart';

class PortfolioCard extends StatelessWidget {
  const PortfolioCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(40),
      width: double.infinity,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('🤞🏾'),
              SizedBox(
                width: 10,
              ),
              Text(
                'holding portfolio',
                style: _themeData.textTheme.caption!.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Spacer(),
              Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\$10,864.52",
                    style: _themeData.textTheme.caption!.copyWith(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.arrow_drop_up,
                        color: Colors.green,
                      ),
                      Text(
                        "\$2,864 - 26%",
                        style: _themeData.textTheme.caption!.copyWith(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                width: 40,
              ),
              Icon(
                Icons.trending_up,
                size: 30,
                color: Colors.white,
              ),
            ],
          )
        ],
      ),
    );
  }
}
