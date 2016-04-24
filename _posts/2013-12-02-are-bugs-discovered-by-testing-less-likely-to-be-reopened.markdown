---
layout: post
title: "Are bugs discovered by testing less likely to be reopened?"
date: 2013-12-02 20:28
comments: true
categories: 
---

Continuing my [adventures with data analysis](/blog/2013/11/20/do-shorter-releases-reduce-the-bug-reopening-rate/), I decided to investigate another question: **are bugs reported because of a failing automated test less likely to be reopened after they're fixed?**

The intuitive answer would be yes, they're less likely to be reopened. After all, automated tests provide the ultimate way to reproduce a bug:

1. run the test and see it fail;
2. fix the bug;
3. run the test and see it pass;
4. there's no 4: the bug is fixed for good (and everybody agrees, because the test passed).

To test the hypothesis, I used data from the NetBeans Platform project. In that project, bugs discovered through automated testing are tagged with the `TEST` keyword. Therefore, all I had to do was compare the reopening rate between `TEST` and non-`TEST` bugs. Results:

    Reopening rate
    ----------------------
          TEST bugs: 23.2%
      non-TEST bugs:  9.3%

Whoaa! Contrary to my belief, `TEST` bugs appear to be *more* likely to be reopened. In fact, 2.5 more likely.

As usual, I read the comments in the bug reports and [asked the community](https://netbeans.org/projects/www/lists/nbdiscuss/archive/2013-11/message/0) to explain the result. It turns out most `TEST` bugs were reopened because the corresponding tests have random or platform-dependent outcomes. Therefore, a test that passes in the developer environment may fail in the continuous integration server and thus be reopened.

The numbers are probably the result of **selection bias**: most automated tests continue to pass after they're created; the ones that started to fail probably did so either because they have random outcomes or because there was a change in the continuous integration environment.