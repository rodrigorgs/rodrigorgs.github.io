---
layout: post
title: "Summary of processes as recorded in bug reports"
date: 2014-02-14 21:51
comments: true
categories: phd
---

TODO: process modeling (using BPMN?)

TODO: release cycle (6 weeks etc.)

TODO: how often each bug status (/transition) is fired in each project. For example: what percentage of bugs are VERIFIED? CLOSED? Peer reviewed?

# Overall

|               x                |     NetBeans    |       Eclipse        |      Firefox       |
| ------------------------------ | --------------- | -------------------- | ------------------ |
| Quality Engineering team       | yes             | no                   | yes                |
| Release cycle                  | variable        | 6 weeks (milestones) | 6 weeks            |
| ------------------------------ | --------------- | -------------------- | ------------------ |
| Who reports, mostly            | QE team         |                      |                    |
| ------------------------------ | --------------- | -------------------- | ------------------ |
| How often are patches attached | rare?           | rare?                | often              |
| Code/peer review (review flag) | rare            | rare                 | frequent           |
| Code review tool               | none?           | Gerrit (feb 2013+)   | none?              |
| ------------------------------ | --------------- | -------------------- | ------------------ |
| Automated testing              | yes (4.0+)      | yes                  | yes                |
| When are auto. tests run       | nightly?        | weekly               | nightly            |
| ------------------------------ | --------------- | -------------------- | ------------------ |
| Who marks RESOLVED             | developer       |                      | sheriff            |
| When marks RESOLVED            | commit to repo  |                      | passed auto. tests |
| Dedicated manual testers       | yes             | no                   | yes                |
| ------------------------------ | --------------- | -------------------- | ------------------ |
| Who marks VERIFIED             | QE team         | peer programmer      | tester             |
| What VERIFIED means            | manually tested | manually tested      | manually tested    |
| ------------------------------ | --------------- | -------------------- | ------------------ |
| Who marks CLOSED               |                 |                      |                    |
| What CLOSED means              |                 |                      |                    |
| How often is CLOSED            |                 |                      |                    |

**NetBeans**: Dedicated testing team.

**Eclipse**: No dedicated testing team (eat your own dogfood)

**Firefox**: Dedicated testing team.

## NEW

**NetBeans**: new bugs are most often reported by the quality engineers.

**Eclipse**:

**Firefox**:

## attach a patch

**NetBeans**:

**Eclipse**:

**Firefox**: most bug fixes are first attached to the bug report.

## peer review

**NetBeans**: 

**Eclipse**:

**Firefox**: most often, the fixer requests specific colleagues for a review.

## commit

**NetBeans**:

**Eclipse**:

**Firefox**: after the patch is reviewed, the fixer commits it into a temporary code repository.

## automated testing

**NetBeans**:

**Eclipse**:

**Firefox**: nightly, automated tests are run; the build sheriff merges sucessfull patches into another repository

## RESOLVED

**NetBeans**:

**Eclipse**:

**Firefox**: the build sheriff marks the bug as FIXED (if it passes the tests)

## manual testing

**NetBeans**:

**Eclipse**:

**Firefox**: a specialized tester try to reproduce the bug in a build.

## VERIFIED

**NetBeans**:

**Eclipse**:

**Firefox**: the specialized tester marks the bug as VERIFIED.

## CLOSED

**NetBeans**:

**Eclipse**:

**Firefox**:

