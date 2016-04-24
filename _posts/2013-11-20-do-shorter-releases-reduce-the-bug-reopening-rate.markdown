---
layout: post
title: "Do shorter releases reduce the bug reopening rate?"
date: 2013-11-20 09:26
comments: true
categories: phd
---

Short answer: **no**. Keep reading to see how my analyses led me to different answers along the way.

Since 2011-03-22\*, [the Mozilla Foundation adopted a new release process](http://arstechnica.com/information-technology/2011/03/mozilla-outlines-16-week-firefox-development-cycle/), known as the train model, in which new versions of their products are released roughly each 6 weeks. Before that, the development of a new major version [could take a full year](http://mozilla.github.io/process-releases/draft/development_overview/).

Because I'm studying bug reopening in free software projects, I soon asked myself: **did this process change affect the bug reopening rate in Firefox**, Mozilla's flagship web browser? I expected that, with shorter development cycles, bug fixes would be developed faster, and thus need to be reopened more often.

The data showed that my first assumption was true: after the train model, bugs were fixed about 70% faster than before\*\*. However, in the same period, **the reopening rate actually dropped from 7.4% to 3.8%, a 50% decrease**.

But why? Was the improvement caused by the motivational effect of a process change (i.e., the [Hawthorne effect](http://en.wikipedia.org/wiki/Hawthorne_effect))? I couldn't conceive any reasonable explanation, so I [asked the community](https://groups.google.com/forum/#!topic/mozilla.dev.planning/TrdD4uRrpL8). It turns out **my analysis failed to account for a change in how bug reopenings are reported at Mozilla**.

In the past, developers used to commit bug fixes to the central repository and at the same time change the bug status to `FIXED`. Now, they commit to a repository called inbound, and only fixes that pass the automated tests are merged into central and marked as `FIXED`. As explained by the Firefox developer Kyle Huey:

> Now we land stuff on mozilla-inbound, but still don't mark bugs as RESOLVED FIXED until mozilla-inbound gets merged to mozilla-central. And we only merge changesets that pass all the tests, so stuff now "bounces" without ever resolving (and hence reopening) the bug.

So how do we track such implicit bug reopenings? Randell Jesup provided a heuristic:

> usually you'll see a later "backout" rev, then another rev for checking it back in. 

A backout is a commit that reverts a previous commit and, thus, can be considered a bug reopening. By scanning comments in bug reports and looking for "backout", "backed out" and variations, I was able to detect bug reopenings that were not explicitly marked with the `REOPENED` status.

By considering explicit and implicit bug reopenings, I found a reopening rate of about 12%. Moreover, the figure was almost the same before and after the train model: 12.7% vs. 12.2%. Therefore I concluded that **the reopening rate was not affected by the switch to shorter releases**.

![](/images/reopening-over-time.png)
![](/images/reopening-train-model-boxplot.png)

Although this last analysis may also have its flaws (after all, it detects reopenings using a heuristic on comments written in natural language), it is based on community feedback and thus more credible. And this story **proves once again how hard it is to proper analyze bug report data**.

## Notes

\* The period from 2011-03-22 to 2011-06-21 was transitional, with even shorter development cycles; the process was stabilized at 2011-06-21, with the release of Firefox 5. See the [Firefox 5 schedule](http://mozilla.github.io/process-releases/draft/development_specifics/img/ff5_schedule.png) for more info.

\*\* To avoid influences of unknown historical factors, I focused on two 2-year periods, one just before the train model and the other just after it. 