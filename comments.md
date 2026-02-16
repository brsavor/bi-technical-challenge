Question 1: How many customers do we have today?

* I consider company as customer if *lifecycle\_stage* column in hubspot\_contacts.csv has value '**customer**' ?



Question 2: What is our Average Contract Value (ACV)?

* Assumption is that ACV should be calculated only based on 'won' contracts in the hubspot\_deals.csv? Should I consider *is\_closed\_*won *or is\_closed* column in hubspot\_deals.csv saying whether contract is signed or not when looking for ACV? Also, there are some cases where *is\_closed* is true, *is\_closed\_won* is false, and there is *date\_entered\_closed\_won* value. What does that mean?



Question 3: What is the retention of our users?

* how do you define the retention of the user? Do you look at that like for example the percentage of users who did some activity in the app in the next x days/months after the user was created
