---
layout: post
title: "Bug Miner's Toolbox"
date: 2014-02-11 05:56
comments: true
categories: phd
---

original data:

* bugs
* events

derived data:

* users
* dates.users
* episodes

## shift.vector, nextv, prevv

`shift.vector(v, by)` shifts the position of vector `v`'s elements. `nextv` and `prevv` are convenience functions.

It's useful to analyze temporal series. For example, if you need to analyze transitions, e.g., find all 0s followed by 1s:

```
x <- c(0, 1, 2, 0, 1, 3, 0, 1)
x[x == 0 & nextv(x) == 1]
```

## .simple.temporal.analysis, .temporal.event.analysis

`.simple.temporal.analysis(data, on, compute)`

Given `data`, compute `compute` on rows that match `on` (in fact, it is computed on all rows, but unmatched rows are computed as NA).

`.temporal.event.analysis(data, rows, sel, expr)`

The expression `expr` is computed only on rows that match `rows`; among those, those not matched by `sel` return NA.

`.temporal.analysis` is deprecated.

## carryForward, carry.events

`carryForward(vec, which, restart)` carries forward the values in `vec` that match `which`. It restarts the carrying forward when it finds a row matched by `restart`. `which` and `restart` are logical vectors.

Example: find current resolution for a bug

...

`carry.events(events, valid, column)` is more specialized. It carries forward the value of the `column` of rows match by `valid` (an expression).


## within.bug.last et al.

within.bug.last
within.bug.first
within.episode.first
within.episode.last

## bugs.with.event

bugs.with.event
n.bugs.with.event

roll.up.events.to.users ...

.data.excluding.these.bugs
.data.including.only.these.bugs

last.resolution