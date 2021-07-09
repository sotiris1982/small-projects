# small-projects

##Pipeline

Aim
The purpose of this project is to design a circuit that demonstrates how a simple pipeline system works. The circuit receives four signals stores them and compare with respect to size and get the greater of all at the last stage of the pipeline along with the number of ones of the last compare.
We need registers in every stage of the design and also at the last part before getting the output in order to be synchronized at the end.

Design description

From the simulation everything seems to work properly. It is getting the greater of all and also giving correct answer with respect to ones. 

>>>>>>>>>>>![image](https://user-images.githubusercontent.com/26255619/125139749-c6c28180-e119-11eb-8be7-224cd883d611.png)

Timing
For the timing part of the design I got no violation with any negative slack and all the values were showing that the timing constrains were satisfied. After getting the timing of the longest path from vivado we can calculate how far we can go with decreasing our clock.

Vivado is giving a good time analysis that one can go through and manipulate the clock up to a point.

The arrival time was 8.362ns and the required time given form the critical path analysis was 15.654ns when subtracting them to get Warst Negative Slack(WNS) we get 7.292ns. The clock in xdc file is set to 10ns we can get 10 – 7.292= 2.708ns which is the amount that we can reduce our clock safely
