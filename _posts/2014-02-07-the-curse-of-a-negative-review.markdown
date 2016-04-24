---
layout: post
title: "The curse of a negative review"
date: 2014-02-07 19:23
comments: true
categories: phd
---

EDIT (2014-02-18): Added feedback from the Firefox community.

----

Imagine the following sequence of events:

1. You **submit a patch** for a bug and ask for a developer to review your code.
2. The reviewer **rejects your patch** -- because you didn't follow code conventions, or violated the architecture, or missed a corner case...
3. You fix the issues and **submit a new patch**.
4. The reviewer **accepts your new patch**.
5. Your patch is integrated into the code base and the bug is considered **resolved**.

What are the **odds** that the bug report is **reopened** after that? It shouldn't matter that your patch was rejected at first, since it was ultimately accepted, right?

As it turns out, bugs that received a patch that was **rejected** by a reviewer are 1.4 to 3.0x **more likely to be reopened** *even after the patch is improved* and accepted (compared to bugs whose patch was accepted right away). Here's some data:

```
|      project      | odds1 | odds2 | ratio | p-value |
| ----------------- | ----- | ----- | ----- | ------- |
| Eclipse/Platform  | 17%   | 5%    |   3.0 |   0.003 |
| Firefox (Desktop) | 10%   | 7%    |   1.4 | < 0.001 |
| Firefox (Mobile)  | 11%   | 7%    |   1.5 |   0.008 |
```

Notes:

* `odds1` is the odds that the bug is reopened given that it received **at least one negative review** (i.e., a patch was rejected)
* `odds2` is the odds that the bug is reopened given that it received **only positive reviews**.
* `ratio` is the ratio between `odds1` and `odds2`
* `p-value` is the p-value for Fisher's exact test for count data; all test results were statistically significative (p < 0.05).

## Explanation

Why are bug reports that received at least one negative review more likely to be reopened even after they receive a positively-reviewed patch? Some hypotheses:

* In Eclipse/Platform, some negative reviews mention that the patch is too risky for the next release; obviously, risky patches are more likely to be buggy.
* Maybe negative reviews attract the attention of developers, who become more suspicious about the patch even after it is accepted.
* Maybe when a reviewer finds a flaw in a patch, he/she becomes oblivious of other potential problems; once the flaw is fixed, the patch is accepted.

## Consequences

So what? Here's a suggestion that could reduce the reopening rate: after a patch is rejected, the next one would be reviewed by another person -- supposedly, fresh eyes are more likely to find initially undetected problems.

## Feedback from the Firefox community

From <https://mail.mozilla.org/pipermail/firefox-dev/2014-February/001422.html>:

> My first guess would be that this could be skewed by small/easy changes -- they'd be less likely to cause fallout, and more likely to pass review the first time. It might be interesting to see if reopening is correlated with the size (or number-of-lines changed) in the patch.

> Another complicating factor is that many people are reluctant to give
> r- on patches because it feels too blunt. If they didn't like the
> patch, they might just clear the review flag, or alternatively give f+
> instead.

> (...) within my working set, r- is a very strong sign that your approach, rather than your implementation, is wrong.
