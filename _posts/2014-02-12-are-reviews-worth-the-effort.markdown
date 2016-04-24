---
layout: post
title: "Are reviews worth the effort?"
date: 2014-02-12 20:37
comments: true
categories: phd
---

EDIT (2014-02-17): improved the text.

EDIT 2 (2014-02-18): this analysis contains serious flaws, as [pointed out by the Firefox community](https://mail.mozilla.org/pipermail/firefox-dev/2014-February/001422.html). See the comments in the last section.

----

## Hypothesis

When a bug fix is reviewed before it is integrated, the bug is less likely to be reopened. 

(The rationale is that code review can catch problems before they manifest themselves in running code.)

## Data

Cleaned bug data from Eclipse/Platform, Firefox (Desktop), and Firefox (Mobile). 

The data is cleaned the following ways:

* enhancement requests are removed;
* bugs that were mass verified are removed;
* bugs that were created less than 60 days before the last date in the data set are removed;
* bugs that were not fixed are removed.

## Analysis

Bugs were classified in two dimensions:

* whether they were reviewed
* whether they were reopened

We used Fisher's exact test to assess the association between the two dimensions.

## Results

```
|      project      | odds ratio | p-value | % reviewed |
| ----------------- | ---------- | ------- | ---------- |
| Eclipse/Platform  |       0.96 | 0.85    | 3.11%      |
| Firefox (Mobile)  |       1.06 | 0.79    | 84.24%     |
| Firefox (Desktop) |       1.45 | < 0.001 | 67.13%     |
```

In Eclipse/Platform and Firefox (Mobile), reviewed bug fixes are as likely to be reopened as any other bug fix (p-value > 0.05).

In Firefox (Desktop), though, reviewed bug fixes are **45% more likely** to be reopened.

Just for context, the table also shows the percentage of bugs that were reviewed in each project.

## Discussion

Results suggest that code review does not play a role in avoiding bug reopening; instead, in one of the projects, it appears to be associated with higher reopening rates. Of course, it would be unreasonable to suppose that reviews *cause* reopening; maybe the fact that a bug is difficult to resolve raises both the odds that a bug is reviewed and the odds that it is reopened. This is a case of selection bias.

Also, even if code review is actually ineffective in preventing bug reopening, it may help to improve the code maintainability, which ultimately prevents new bugs from being introduced.

## Feedback from the Firefox community

From <https://mail.mozilla.org/pipermail/firefox-dev/2014-February/001422.html>:

> In some components, the majority of work is not conducted through Bugzilla attachments and review flags. That is: your use of Bugzilla review flags as an indicator for whether code has been reviewed is incorrect.

> Some bugs that are marked RESOLVED FIXED do not have attachments. They might be procedural, analytical, fixed by some other issue but not a dupe, etc. That is, your use of the resolution of a bug as an indicator for code landing is incorrect.

> I'd guess the rate of landing code that actually ships (not testing or build harness) without review is ~1-2%, perhaps even lower.