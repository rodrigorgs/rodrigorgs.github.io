---
layout: post
title: "Bugzilla REST API"
date: 2013-10-02 18:47
comments: true
categories: phd
---

Newer Bugzilla versions (like the one used by Mozilla) has a REST API that makes easy to gather some statistics. For example, [number of bugs reported for Firefox](https://api-dev.bugzilla.mozilla.org/latest/count?product=Firefox), or [number of bugs in Firefox with last status = REOPENED](https://api-dev.bugzilla.mozilla.org/latest/count?product=Firefox&status=REOPENED). See more examples at <https://wiki.mozilla.org/Bugzilla:REST_API>.