---
layout: page
title: "PhD Dashboard"
date: 2013-06-19 07:37
comments: true
sharing: true
footer: true
---

## Current activity

### hypotheses

  * **Shorter releases lower reopening rate**: **false**. Read [the report](/blog/2013/11/20/do-shorter-releases-reduce-the-bug-reopening-rate/).
    <!-- * rationale: ? -->
    <!-- * howto: use Firefox for Desktop, before and after the train model. -->
  * **Bugs reported because of a failing test are less prone to reopening: false**. Read [the report](/blog/2013/12/02/are-bugs-discovered-by-testing-less-likely-to-be-reopened/).
    <!-- * rationale: they can be verified by running the test. -->
    <!-- * howto: in NetBeans, compare bugs flagged TEST with the other ones. -->
  * **Bugs that receive a code review are less prone to reopening**: **false**. Read [the report](/blog/2014/02/12/are-reviews-worth-the-effort/)
    <!-- * rationale: code review may catch corner cases and integration problems. -->
    <!-- * howto: in NetBeans, bugs with keyword \*API\* (since March, 2004) or \*\_HR\_\* (since March, 2011); in Eclipse, bugs with flag review? (or bugs reviewed in Gerrit, 2013). -->
  * **Bugs that receive a negative review are more likely to be reopened**: **true**. Read [the report](/blog/2014/02/07/the-curse-of-a-negative-review/)
  * Bugs verified by a person ≠ from the fixer are less prone to reopening.
    * rationale: catch corner cases
    * howto: trivial, all projects can be used
  * Bugs verified by a tester are less prone to reopening.
    * rationale: testers are better at testing
    * howto: in NetBeans and Firefox, use group of automatically identified testers.
  * Bugs verified by the reporter are less prone to reopening.
    * rationale: the reporter knows how to reproduce the problem.
    * howto: trivial, all projects can be used.

Other hypotheses (less relevant or more difficult to evaluate)

  * Bugs that receive a code review do not take much longer to be FIXED.
    * (vague hypothesis)
  * In the presence of automated tests, bugs are reopened earlier.
    * howto: compare NetBeans pre- and post-4.0 (when automated testing started to be run on every build)
    
We may test the hypotheses for each possible severity (see [this](http://rodrigorgs.github.io/blog/2013/09/12/objetivo3/)).

We may also build a logistic regression model that includes all factors: whether the bug was reported because of a failing test, whether it was code reviewed, whether verifier ≠ fixer, whether verifier = tester, and whether verifier = reporter.

## Previously

### try to talk with Eclipse and NetBeans developers

  * Eclipse: send message to [eclipse-dev mailing list](https://dev.eclipse.org/mailman/listinfo/eclipse-dev) ([e.g.](http://eclipse.1072660.n5.nabble.com/About-API-Tools-results-analysis-td161641.html))
    * **Done**. See the [message thread](http://dev.eclipse.org/mhonarc/lists/eclipse-dev/msg09669.html) and the [summary](https://docs.google.com/document/d/1DfcpiLTrW6gKLqApjJrNAE0L1C3l8bygpq9wr1VLYg0/edit?usp=sharing)
  * NetBeans: send message to [platform-dev mailing list](https://netbeans.org/projects/platform/lists/dev/archive)
    * **Done**. See the [message thread](https://netbeans.org/projects/www/lists/nbdiscuss/archive/2013-10/message/0) (see also replies) and the [summary](https://docs.google.com/document/d/1XJdCY6fAhOOFkV1PySjnljJVknsQMkQWo4tUYaP4D6w/edit?usp=sharing)

### download Firefox for Desktop's bugs

  * **Done**. See quantative reports:
    * [Firefox: all bugs](ff-desktop.html)
    * [Firefox before the train model](ff-desktop-before.html)
    * [Firefox after the train model](ff-desktop-after.html)
    * see also the [comparison](https://docs.google.com/spreadsheet/ccc?key=0AhqQol81uO5UdDR4SHlvc2x0UFhlOWc4QWNCLUhramc&usp=sharing)

### improve [report that characterizes reopening](https://docs.google.com/document/d/169X1hdw6Ymub1iqZsQpaP54KKBtSwluLx1BOC0gyTiY/edit?usp=sharing)

  * **Done**.

### also

* quantitative reports
  * [eclipseplatform.html](eclipseplatform.html)
  * [firefox.html](firefox.html)
  * [netbeansplatform.html](netbeansplatform.html)
  * [versioncontrol.html](versioncontrol.html)
  * [report](https://docs.google.com/document/d/169X1hdw6Ymub1iqZsQpaP54KKBtSwluLx1BOC0gyTiY/edit?usp=sharing) and the [consolidated table](https://docs.google.com/spreadsheet/ccc?key=0AhqQol81uO5UdEc0T013dEN6aXBndTNxSXVSWjJMV3c&usp=sharing) (**new!** 2013-09-18)
* compare the reopening rate of Firefox for Android before and after adopting rapid release cycles: 
  * partial result: see the [draft report](/blog/2013/09/12/bug-reopening-on-firefox-before-and-after-the-new-process/) (**new!** 2013-09-25). However, we decided to use Firefox for Desktop for this analysis.
* [Characterization of Mozilla's process](/blog/2013/09/08/mozilla-process/), result of an interview with Mozilla's developer Lucas Rocha.

## Documents

* [Exame de qualificação](/phd-dashboard/rodrigo-qualify.pdf) (in portuguese)
  * [Objetivo específico 2](/blog/2013/06/19/objective2/) (in portuguese)
  * [Objetivo específico 3](/blog/2013/09/12/objetivo3/) (in portuguese)
* [Preventing Bug Reopening With Effective Software Verification](codemine-irc-rodrigorgs.pdf) (rejected [CODEMINE](/blog/2013/06/21/microsoft-data/) proposal)

See also [posts about my PhD](/blog/categories/phd/).

## Misc

[Software engineering journals, with impact factor](http://www.cse.chalmers.se/~feldt/advice/isi_listed_se_journals.html)
