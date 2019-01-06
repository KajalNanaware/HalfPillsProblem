# HalfPillsProblem
We are interested in tracking the ratio of half pills to all the pills left in the jar. When you start with a new jar of N whole pills, there are no half pills at all, so the ratio is 0/N. When you get down to the last half pill in the jar (and no whole pills), then the ratio is 1/1. In between, what does that ratio look like? You are going to use random simulation to find out.

Start with a full jar of all whole pills. (Perhaps you should use an array for this; each entry in the array would be able to record if a pill was a half or a whole pill.) Randomly pick one of the pills left in the jar. If  that pill is a whole pill, change it to a half pill. If that pill is a half pill, then remove that pill from the jar. (Somehow that array entry should “disappear,” and the array should become shorter; there are different ways to do this.)

After each pill is chosen, determine the ratio of half pills to all pills. For a jar holding N whole pills, your simulation will randomly choose a pill 2*N times before the jar is empty. 

Assume at first that your jar holds 50 pills. Fill up the jar with 50 whole pills, and empty that jar, keeping track of the ratio each time a pill is chosen. You should finish with an empty jar after 100 simulated days. Now do the same experiment 3 more times, yielding 400 data points. 

Now take the average of the 4 data points on day 1, day 2, and so one for all 100 days. Now you will have 500 data points in 5 series. 
Finally, do exactly the same thing, but this time use 100 pills. Again, do 4 repetitions, and then average.

