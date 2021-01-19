Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32676C433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 22:30:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A54E23109
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 22:30:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728679AbhASWaK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 17:30:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728588AbhASWaE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 17:30:04 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D322C061573
        for <linux-tegra@vger.kernel.org>; Tue, 19 Jan 2021 14:29:23 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id o13so31418767lfr.3
        for <linux-tegra@vger.kernel.org>; Tue, 19 Jan 2021 14:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gfvPC/OfKQm0WszlW9GmFgoRPlhvY5JQwFhmkr33QEU=;
        b=unTeKrUukHB5UZKIoMHXWV8M64KMF9whvxZj2rVA6Pc1Xb36Px1QwvNiNbWDtYpP0r
         kG5kXcmfxyreOzHq7FfaGS29fxNW4ke+ZORKc8Xp9playYKllEabVdYasAkJ9r5pD0KQ
         2dw3L4LsuH+OaRp1P6F8cOIvsZ/y89sXc282os/Je7Xhu45ffxYjEJRbsIZpGOF/yCgn
         0mGCjXusmPbF0aJsiRjlzx9RIlFRYMqtukLRcei35D5GoN/TsFQ+DvSgTZ1JPc0JYohO
         BFkvQpdZpFXsnVV4EnwhshJTlTYdviEKeTq7IAFNha4VEKzPTOuALKYuYQ4k9Nq6IETZ
         fjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gfvPC/OfKQm0WszlW9GmFgoRPlhvY5JQwFhmkr33QEU=;
        b=gQLCKB8aPY6a955n26isrkVBKpbJJciRfiTO+Wfvug0TIX6jf1TsJI7YUCPEaRMSpV
         O57oRAu8/hNRhfeoRYsDu6BW/vV3JkSFBEZybPJKL4H/QKlq5fT9u3+zKa3VwexHOP8T
         sKiCtxdaFgLfUq8/juW8uzAskYuf0PA37Ivf//egevRd4Gjc0CE0sPev3ho/SAfQ9SA/
         zaiH3HJ61K41/qHIBbKFYckJQcD+QUlF5JkCrQ6AAk7AuSAuXQbsKHyqZ8ZnJcCER+6/
         4rNoPSSqaY2lMMkeam3vJB5NJTsOnm2P3K6Xgq0YZJeNsqq6vAODebkOrZGQoZbo5Wl+
         RubA==
X-Gm-Message-State: AOAM532XFHwJ1QfVDXEXfHCEnjTh+YpNbrdwzXW42cwiW4CAb0h7Hf1l
        Bo+ucCNIFQUwiJRUqTrdBjE=
X-Google-Smtp-Source: ABdhPJyx8x7gu4P7oE5KAk6xg8xDr54N8Q3FAZ6Nqz2UM8VtBwHDr478AaY6OY4v8pgus3J7jsMpYQ==
X-Received: by 2002:ac2:418e:: with SMTP id z14mr2883646lfh.126.1611095362069;
        Tue, 19 Jan 2021 14:29:22 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id r81sm12698lff.215.2021.01.19.14.29.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jan 2021 14:29:21 -0800 (PST)
Subject: Re: [PATCH v5 00/21] Host1x/TegraDRM UAPI
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
Date:   Wed, 20 Jan 2021 01:29:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210111130019.3515669-1-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

11.01.2021 15:59, Mikko Perttunen пишет:
> Hi all,
> 
> here's the fifth revision of the Host1x/TegraDRM UAPI proposal,
> containing primarily small bug fixes. It has also been
> rebased on top of recent linux-next.
> 
> vaapi-tegra-driver has been updated to support the new UAPI
> as well as Tegra186:
> 
>   https://github.com/cyndis/vaapi-tegra-driver
> 
> The `putsurface` program has been tested to work.
> 
> The test suite for the new UAPI is available at
> https://github.com/cyndis/uapi-test
> 
> The series can be also found in
> https://github.com/cyndis/linux/commits/work/host1x-uapi-v5.
> 
> Older versions:
> v1: https://www.spinics.net/lists/linux-tegra/msg51000.html
> v2: https://www.spinics.net/lists/linux-tegra/msg53061.html
> v3: https://www.spinics.net/lists/linux-tegra/msg54370.html
> v4: https://www.spinics.net/lists/dri-devel/msg279897.html
> 
> Thank you,
> Mikko

The basic support for the v5 UAPI is added now to the Opentegra driver.
 In overall UAPI works, but there are couple things that we need to
improve, I'll focus on them here.

Problems
========

1. The channel map/unmap API needs some more thought.

The main problem is a difficulty to track liveness of BOs and mappings.
 The kernel driver refs BO for each mapping and userspace needs to track
both BO and its mappings together, it's too easy to make mistake and
leak BOs without noticing.

2. Host1x sync point UAPI should not be used for tracking DRM jobs.  I
remember we discussed this previously, but this pops up again and I
don't remember where we ended previously.

This creates unnecessary complexity for userspace.  Userspace needs to
go through a lot of chores just to get a sync point and then to manage
it for the jobs.

Nothing stops two different channels to reuse a single sync point and
use it for a job, fixing this will only add more complexity to the
kernel driver instead of removing it.

3. The signalling of DMA fences doesn't work properly in v5 apparently
because of the host1x waiter bug.  I see that sync point interrupt
happens, but waiter callback isn't invoked.

4. The sync_file API is not very suitable for DRM purposes because of
-EMFILE "Too many open files", which I saw while was running x11perf.
It also adds complexity to userspace, instead of removing it.  This
approach not suitable for DRM scheduler as well.

5. Sync points have a dirty hardware state when allocated / requested.
The special sync point reservation is meaningless in this case.

6. I found that the need to chop cmdstream into gathers is a bit
cumbersome for userspace of older SoCs which don't have h/w firewall.
Can we support option where all commands are collected into a single
dedicated cmdstream for a job?

Possible solutions for the above problems
=========================================

1. Stop to use concept of "channels". Switch to DRM context-only.

Each DRM context should get access to all engines once DRM context is
created.  Think of it like "when DRM context is opened, it opens a
channel for each engine".

Then each DRM context will get one instance of mapping per-engine for
each BO.

enum tegra_engine {
	TEGRA_GR2D,
	TEGRA_GR3D,
	TEGRA_VIC,
	...
	NUM_ENGINES
};

struct tegra_bo_mapping {
	dma_addr_t ioaddr;
	...
};

struct tegra_bo {
	...
	struct tegra_bo_mapping *hw_maps[NUM_ENGINES];
};

Instead of DRM_IOCTL_TEGRA_CHANNEL_MAP we should have
DRM_IOCTL_TEGRA_GEM_MAP_TO_ENGINE, which will create a BO mapping for a
specified h/w engine.

Once BO is closed, all its mappings should be closed too.  This way
userspace doesn't need to track both BOs and mappings.

Everything that userspace needs to do is:

	1) Open DRM context
	2) Create GEM
	3) Map GEM to required hardware engines
	4) Submit job that uses GEM handle
	5) Close GEM

If GEM wasn't mapped prior to the job's submission, then job will fail
because kernel driver won't resolve the IO mapping of the GEM.

2. We will probably need a dedicated drm_tegra_submit_cmd for sync point
increments.  The job's sync point will be allocated dynamically when job
is submitted.  We will need a fag for the sync_incr and wait_syncpt
commands, saying "it's a job's sync point increment/wait"

3. We should use dma-fence API directly and waiter-shim should be
removed.  It's great that you're already working on this.

4. Sync file shouldn't be needed for the part of DRM API which doesn't
interact with external non-DRM devices.  We should use DRM syncobj for
everything related to DRM, it's a superior API over sync file, it's
suitable for DRM scheduler.

5. The hardware state of sync points should be reset when sync point is
requested, not when host1x driver is initialized.

6. We will need to allocate a host1x BO for a job's cmdstream and add a
restart command to the end of the job's stream.  CDMA will jump into the
job's stream from push buffer.

We could add a flag for that to drm_tegra_submit_cmd_gather, saying that
gather should be inlined into job's main cmdstream.

This will remove a need to have a large push buffer that will easily
overflow, it's a real problem and upstream driver even has a bug where
it locks up on overflow.

How it will look from CDMA perspective:

PUSHBUF |
---------
...     |      | JOB   |
        |      ---------       | JOB GATHER |
RESTART	------> CMD    |       --------------
        |      |GATHER -------> DATA        |
... <---------- RESTART|       |            |
        |      |       |


What's missing
==============

1. Explicit and implicit fencing isn't there yet, we need to support DRM
scheduler for that.

2. The "wait" command probably should be taught to take a syncobj handle
in order to populate it with a dma-fence by kernel driver once job is
submitted.  This will give us intermediate fences of a job and allow
utilize the syncobj features like "wait until job is submitted to h/w
before starting to wait for timeout", which will be needed by userspace
when DRM scheduler will be supported.

Miscellaneous
=============

1. Please don't forget to bump driver version.  This is important for
userspace.

2. Please use a proper kernel coding style, use checkpatch.

   # git format-patch -v5 ...
   # ./scripts/checkpatch.pl --strict v5*

3. Kernel driver needs a rich error messages for each error condition
and it should dump submitted job when firewall fails.  It's very tedious
to re-add it all each time when something doesn't work.

4. Previously firewall was using the client's class if is_valid_class
wasn't specified in tegra_drm_client_ops, you changed it and now
firewall fails for GR3D because it doesn't have the is_valid_class() set
in the driver.  See [1].

5. The CDMA class should be restored to the class of a previous gather
after the wait command in submit_gathers() and not to the class of the
client.  GR2D supports multiple classes.  See [1].

[1]
https://github.com/grate-driver/linux/commit/024cba369c9c0e2762e9890068ff9944cb10c44f
