Bug fixed #1:
3D vector correction feedback contaminated the gyro input signals.

Bug fixed #2:
Missing initialization of RX input signal variables. This could led to undefined RX signals if KK2 is powered up without RX connected, and then in turn cause the KK2 to arm. However no chance of motors starting because throttle is at idle as required for arming.

Changes of usage:
None.
Settings does not change when upgrading from V1.5.

Regarding bug#1:
The test quad did feel more precise after upgrade, but it was not a major change.

Regarding Self-level that looses its bearing after flying for a while:
This is a vibration problem. Get rid of the vibrations!
Also rapid flipping exceeding the rate of the gyros will cause this.

And I can confirm that the ESCs and servos, even those connected to M2-M8, (cause they load the outputs of the KK2) must be removed when using a programmer that supplies power to the KK2! Else it is a chance of bricking the KK2 due to low voltage during flashing.

And finally, remember to remove the propeller, or otherwise disable the motors when working on your multicopter. During throttle calibration the propellers MUST BE REMOVED!
Also make a habit to disarm the KK2 before approaching and picking up the multicopter.