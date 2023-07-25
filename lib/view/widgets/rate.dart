import 'package:flutter/material.dart';

class StarRate extends StatelessWidget {
  String rate;

  StarRate({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    return rate == '1'
        ? const Row(
            children: [
              Icon(
                Icons.star_rate_rounded,
                color: Colors.amber,
              ),
            ],
          )
        : rate == '2'
            ? const Row(
                children: [
                  Icon(
                    Icons.star_rate_rounded,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star_rate_rounded,
                    color: Colors.amber,
                  ),
                ],
              )
            : rate == '3'
                ? const Row(
                    children: [
                      Icon(
                        Icons.star_rate_rounded,
                        color: Colors.amber,
                      ),
                      Icon(
                        Icons.star_rate_rounded,
                        color: Colors.amber,
                      ),
                      Icon(
                        Icons.star_rate_rounded,
                        color: Colors.amber,
                      ),
                    ],
                  )
                : rate == '4'
                    ? const Row(
                        children: [
                          Icon(
                            Icons.star_rate_rounded,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star_rate_rounded,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star_rate_rounded,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star_rate_rounded,
                            color: Colors.amber,
                          ),
                        ],
                      )
                    : rate == '5'
                        ? const Row(
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: Colors.amber,
                              ),
                            ],
                          )
                        : const Text('');
  }
}
