---
layout: post
title: "Mozilla release process from the point of view of a data scientist"
date: 2013-09-08 08:49
comments: true
categories: phd
---

Mozilla is the free software community responsible for the development of Firefox, Thunderbird, Bugzilla and a number of other projects. [In early 2011](http://arstechnica.com/information-technology/2011/03/mozilla-outlines-16-week-firefox-development-cycle/), when the development of Firefox 5 started, Mozilla [adopted a rapid release process](http://mozilla.github.io/process-releases/), with 6 weeks between releases.

In this document, I try to describe the release process and the quality process used in the development of Firefox for Android, and how the process reflects itself in bug reports. Although we focus on Firefox for Android, most observations are likely to apply to all major Mozilla products.

Special thanks to [Lucas Rocha](http://lucasr.org/), UI engineer at Mozilla working on Firefox for Android, who patiently explained me the process and pointed me to the right documentation.

## Overall release process

The new process is sometimes called the **train model**. Each new feature or bug fix flows through three channels -- central (or nightly), aurora (or experimental), and beta -- before being integrated in the release channel, that is used to generate officially released binaries. Each channel is more stable than the previous one (i.e., later channels have stricter change policies). 

Every 6 weeks there's the **merge day**, when patches in central are merged into aurora, patches in aurora are merged into beta, and patches in beta become part of the next release. Therefore, each new release takes no more than 18 weeks to develop, as patches flows through all channels.

![Mozilla's train model](http://mozilla.github.io/process-releases/draft/development_specifics/img/new_versions.png)

You can see from the picture that multiple versions are developed in parallel. For example, while version 5.0 is being tested in the beta channel, version 6.0 is in aurora and developers are already working in version 7.0 in the central channel. Meanwhile, the majority of users are using the latest official release, 4.0.

The train model allows patches to reach increasingly larger user bases, as the number of users is expected to grow about 10 times from one channel to the next. The central channel is used to build nightly versions of Mozilla's products, that are typically used by their developers and power users. In the case of Firefox, this represents about 100,000 people. One million people are expected to use aurora builds, 10 million to use beta builds, and more than 100 million to use official releases.

## Overall quality process

All patches that become part of a release undergo peer review, automated testing, and manual testing.

When a **developer** fixes a bug, he attaches the patch to the corresponding bug report in Bugzilla and asks a specific colleague to **review** it (setting the `review(...)?` flag). See the example from [bug #787078](https://bugzilla.mozilla.org/show_bug.cgi?id=787078):

![Patch review request](/images/mozilla/flag-review-request.png)

If the **reviewer** approves the patch (by setting the `review+` flag), the developer integrates it into the `inbound` channel (a temporary channel before patches go to the central channel).

![Patch approval](/images/mozilla/flag-review-response.png)
![Patch approval](/images/mozilla/push-inbound.png)

Patches in this channel undergo **automated testing**, which includes unit, integrations, and interface tests. If all tests pass, the **[build sheriff](https://wiki.mozilla.org/Sheriff_Duty)** merges the patch into the central channel and changes the bug status to `RESOLVED` and the resolution to `FIXED`.

![Merging to central](/images/mozilla/merge-central.png)

After that, a **[tester](https://wiki.mozilla.org/QA/SoftVision)** picks a nightly build and manually test it to check if everything works as expected. If this is the case, he marks the bug report as `VERIFIED`.

![Verifying the bug fix](/images/mozilla/verification.png)

The aurora and beta builds are manually tested as well to check for regression bugs.

Unlike testers, that take care of verifying each individual patch, [quality team leaders](https://wiki.mozilla.org/QA/Fennec) are usually concerned with bug triage and bug reporting.

## Details

**Backout**. When a patch is considered innapropriate after being merged into a repository, it is backed out, i.e., removed from the repository.

![Backout](/images/mozilla/backout.png)

**Uplift**. Sometimes, a patch fixes a feature that was already merged into aurora or beta. If the patch is considered important enough and the risk of merging the patch is low (e.g., it is unlikely to break the build or introduce regression bugs), the developer sets the flag `approval-mozilla-aurora?` or `approval-mozilla-beta?`.

![Uplift](/images/mozilla/uplift.png)

If the request is approved, the developer can merge the patch into aurora or beta right away, instead of waiting up to 6 weeks for the merge day.

![Uplift approved](/images/mozilla/uplift-approved.png)
![Push to aurora and beta](/images/mozilla/push-to-aurora.png)

When the patch is verified in aurora or beta channels, the flag `status-firefoxNN` (where `NN` is the Firefox version) is set to "verified".

![Status flags](/images/mozilla/status-firefox.png)

In the example, Firefox 17 was in aurora and Firefox 16 was in beta.

## See also

* Khomh, Foutse, et al. "[Do faster releases improve software quality? An empirical case study of Mozilla Firefox](http://post.queensu.ca/~khomhf/docs/Khomh-MSR-2012.pdf)." Mining Software Repositories (MSR), 2012 9th IEEE Working Conference on. IEEE, 2012.
* [Mozilla Release Processes](http://mozilla.github.io/process-releases/)
* [Mozilla Releases](https://wiki.mozilla.org/Releases)
* [Keyword/Flag usage](https://quality.mozilla.org/docs/bugzilla/starter-kit/keywordflag-usage/)
