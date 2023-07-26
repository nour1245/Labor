import 'package:flutter/material.dart';
import 'package:laboar/generated/l10n.dart';
import 'package:laboar/main.dart';

import '../styles/colors.dart';

class AddressCard extends StatefulWidget {
  final int index;
  bool selectedAdress;
  AddressCard({super.key, required this.index, required this.selectedAdress});

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        setState(() {
          widget.selectedAdress = !widget.selectedAdress;
        });
      },
      child: Card(
        color: widget.selectedAdress ? greenColor : Colors.white,
        child: Padding(
          padding: EdgeInsets.all(media.width * .04),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor:
                        widget.selectedAdress ? Colors.white : greenColor,
                    child: Icon(
                      Icons.location_on_outlined,
                      color:
                          widget.selectedAdress ? Colors.amber : Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: media.width * 0.04,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      S.of(context).City,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: widget.selectedAdress
                              ? Colors.white
                              : Colors.amber),
                    ),
                    Text(address!.getAt(widget.index)['city'],
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                    Text(
                      S.of(context).Street,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: widget.selectedAdress
                              ? Colors.white
                              : Colors.amber),
                    ),
                    Text(address!.getAt(widget.index)['street'],
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
              SizedBox(
                width: media.width * 0.04,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      S.of(context).buildnumber,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: widget.selectedAdress
                              ? Colors.white
                              : Colors.amber),
                    ),
                    Text(address!.getAt(widget.index)['building'],
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                    Text(
                      S.of(context).Area,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: widget.selectedAdress
                              ? Colors.white
                              : Colors.amber),
                    ),
                    Text(
                      address!.getAt(widget.index)['area'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
