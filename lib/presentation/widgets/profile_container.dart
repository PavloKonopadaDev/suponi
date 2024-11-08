import 'package:flutter/material.dart';

class ProfileSelectionContainer extends StatelessWidget {
  final String? firstLabel;
  final String? firstValue;
  final VoidCallback? firstOnTap;
  final String secondLabel;
  final String? secondValue;
  final VoidCallback? secondOnTap;

  const ProfileSelectionContainer({
    super.key,
    this.firstLabel,
    this.firstValue,
    this.firstOnTap,
    required this.secondLabel,
    this.secondValue,
    this.secondOnTap,
  });

  @override
  Widget build(BuildContext context) {
    final isFirstLabelEmpty = firstLabel == null || firstLabel!.isEmpty;

    return Container(
      width: 343,
      height: isFirstLabelEmpty ? 56 : 112,
      decoration: BoxDecoration(
        color: const Color(0x4B405373),
        borderRadius: BorderRadius.circular(8),
      ),
      child: isFirstLabelEmpty
          ? GestureDetector(
              onTap: secondOnTap,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      secondLabel,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    if (secondValue != null)
                      Text(
                        secondValue!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                  ],
                ),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: firstOnTap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            firstLabel ?? "",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          if (firstValue != null)
                            Text(
                              firstValue!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Divider(
                  color: Color(0x3E3744),
                  thickness: 1,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: secondOnTap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            secondLabel,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          if (secondValue != null)
                            Text(
                              secondValue!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
