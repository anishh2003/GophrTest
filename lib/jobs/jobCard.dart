import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gophr/jobs/jobLogic.dart';
import 'package:gophr/model/drop_off_model.dart';
import 'package:gophr/model/pickup_model.dart';
import 'package:gophr/ui/common/constants.dart';
import 'package:gophr/ui/components/app_colours.dart';
import 'package:provider/provider.dart';

class JobCard extends StatelessWidget {
  JobCard(
      {Key? key,
      required this.index,
      required this.jobTitle,
      required this.pickUpLocation,
      required this.dropOffLocation,
      required this.deliveryDate,
      required this.buttonsVisible})
      : super(key: key);

  int index;
  String jobTitle;
  PickUpModel pickUpLocation;
  DropOffModel dropOffLocation;
  String deliveryDate;
  bool buttonsVisible = true;

  String expectedDeliveryFormat(String deliveryDate) {
    String date;
    int idx = deliveryDate.indexOf("T");
    date = deliveryDate.substring(0, idx).trim();
    date = date.replaceAll('-', '/');
    var chars = date.split('/');
    date= chars.reversed.join('/');
    return date;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: buttonsVisible ? kCardHeightWithButtons : kCardHeightWithoutButtons,
        child: Card(
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jobTitle,
                  style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 18.0),
                ),
                const SizedBox(height: 5.0),
                Text(
                  'Pick-up: ${pickUpLocation.address_line_1!} , ${pickUpLocation.postcode!} ',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(height: 5.0),
                Text(
                  'Drop-off: ${dropOffLocation.address_line_1!}, ${dropOffLocation.postcode!} ',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(height: 5.0),
                Text(
                  'Expected delivery date:' + expectedDeliveryFormat(deliveryDate),
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                const SizedBox(height: 20.0),
                Visibility(
                  visible: buttonsVisible,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RejectButton(index: index),
                      const SizedBox(width: 16.0),
                      AcceptButton(index: index),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AcceptButton extends StatelessWidget {
  const AcceptButton({
    required this.index,
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kCardHeight,
      width: kCardWidth,
      child: RawGestureDetector(
        gestures: <Type, GestureRecognizerFactory>{
          LongPressGestureRecognizer: GestureRecognizerFactoryWithHandlers<LongPressGestureRecognizer>(
            () => LongPressGestureRecognizer(
              debugOwner: this,
              duration: const Duration(seconds: kButtonPressTimeInSec),
            ),
            (LongPressGestureRecognizer instance) {
              instance.onLongPress = () => Provider.of<Jobs>(context, listen: false).acceptJob(index);
            },
          ),
        },
        child: Material(
          color: Colors.black,
          clipBehavior: Clip.antiAlias,
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(
                10,
              ),
            ),
          ),
          child: Center(
            child: Text('ACCEPT',
                style: Theme.of(context).textTheme.button?.copyWith(
                      color: AppColors.white,
                    )),
          ),
        ),
      ),
    );
  }
}

class RejectButton extends StatelessWidget {
  const RejectButton({
    required this.index,
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kCardHeight,
      width: kCardWidth,
      child: RawGestureDetector(
        gestures: <Type, GestureRecognizerFactory>{
          LongPressGestureRecognizer: GestureRecognizerFactoryWithHandlers<LongPressGestureRecognizer>(
            () => LongPressGestureRecognizer(
              debugOwner: this,
              duration: const Duration(seconds: kButtonPressTimeInSec),
            ),
            (LongPressGestureRecognizer instance) {
              instance.onLongPress = () => Provider.of<Jobs>(context, listen: false).rejectJob(index);
            },
          ),
        },
        child: Material(
          clipBehavior: Clip.antiAlias,
          shape: const BeveledRectangleBorder(
            side: BorderSide(
              color: AppColors.black,
            ),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(
                10,
              ),
            ),
          ),
          child: Center(
            child: Text('REJECT', style: Theme.of(context).textTheme.button),
          ),
        ),
      ),
    );
  }
}
