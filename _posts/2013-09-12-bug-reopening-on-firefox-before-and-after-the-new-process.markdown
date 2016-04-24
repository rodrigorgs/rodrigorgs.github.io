---
layout: post
title: "Bug Reopening on Firefox for Android (Before and After the New Process) [DRAFT]"
date: 2013-09-12 16:16
comments: true
categories: phd
---

In early 2011, the Mozilla Foundation [adopted a faster release process](http://arstechnica.com/information-technology/2011/03/mozilla-outlines-16-week-firefox-development-cycle/), dubbed *train model*, with new releases every 6 weeks. It wasn't until the following year, though, that Firefox for Android jumped on the bandwagon. Due to the need to rebuild the user interface, they decided to hold the switch to the train model until June, 2012. Before that, they only shipped a new version when it met quality and performance criteria -- even if this meant missing the next train/release date.

How the process change affected Firefox for Android's quality? I've computed some quality metrics (specifically metrics related to bug reopening) on its bug reports before and after the switch to the train model to try to answer this question.

We estimated that the process change occured near June 26th, 2012, when [Firefox for Android 14 was released](https://wiki.mozilla.org/Releases/Old/2012). We classified bug reports based on whether they were created before or after the date.

<!-- TODO: recompute metrics -->

Here's the computed metrics:
<!-- 
 **Metric**                           | **Before** | **After**
                                      |            |
 Number of issues                     | 2449       | 7192  
 Days                                 | 1257       | 468   
 % verifications by test team         | 79%        | 55%   
 % of bugs reopened after FIXED       | 11%        | 5%    
 % of bugs reopened after VERIFIED    | 4%         | 1%    
 Days btw FIXED and REOPENED (avg)    | 14         | 11    
 Days btw VERIFIED and REOPENED (avg) | 28         | 18    
 % of time fixing bugs                | 92%        | 94%   
 % of time bugs are latent            | 4.5%       | 2.2%  
 -->

 **Metric**                           | **Before** | **After**
--------------------------------------|------------|----------
 Number of issues                     | 5005       | 4636  
 % verifications by test team         | 56%        | 38%   
 % of bugs reopened after FIXED       | 9%         | 4%    
 % of bugs reopened after VERIFIED    | 3.5%       | 1.5%    
 Days btw FIXED and REOPENED (avg)    | 12         | 14    
 Days btw VERIFIED and REOPENED (avg) | 24         | 18    
 % of time fixing bugs                | 92%        | 94%   
 % of time bugs are latent            | 4.5%       | 2.2%  

To interpret the results, it is useful to know a little bit about the [Mozilla release process](http://mozilla.github.io/process-releases/) and [how it is reflected in bug reports](/blog/2013/09/08/mozilla-process/). For instance, keep in mind that when a bug is marked `FIXED`, its patch has undergone peer review and automated testing; when it is marked `VERIFIED`, it has additionally undergone manual integration testing.

From the table, we can see that the number of bugs reports that are reopened after being fixed dropped by more than half in the rapid release process (**TODO: why?**). The same can be said about the proportion of bugs that are reopened after being manually tested. <!-- A more dramatic change can be observed within bugs that were manually tested: now they are reopened 4x less often. -->

After a bug is considered fixed, the time it takes for people to notice that it should be reopened is called latent time. With the new process, the average latent time has increased a little, from 12 to 14 days. If we consider the lifetime of all bug reports over the two periods analyzed, 3.5% of the time used to be spent thinking that a bug was fixed when it was actually latent; now, this time was reduced to 2.5%.

A curious fact from the table regards the test team, automatically identified as the group of people whose work is specialized in manual testing (which appears in bug reports as the `VERIFIED` status). The test team used to be responsible for about 56% of the verifications; now the verification effort seems more evenly distributed, as the test team only performs 38% of the verifications. (**TODO: why?**)

## See also

* [Bringing Android Native Firefox to Beta](https://blog.mozilla.org/futurereleases/2012/01/25/bringing-android-native-firefox-to-beta/)
* [Firefox for mobile – tracking progress](http://irinasandu.com/2012/03/12/firefox-for-mobile-tracking-progress/)
