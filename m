Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA614C433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 26 Jan 2021 19:22:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F7EB22A84
	for <linux-tegra@archiver.kernel.org>; Tue, 26 Jan 2021 19:22:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbhAZFrV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 26 Jan 2021 00:47:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732297AbhAZCqs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 25 Jan 2021 21:46:48 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F19BAC0613D6
        for <linux-tegra@vger.kernel.org>; Mon, 25 Jan 2021 18:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=0AiauGDiGc0aqm9Js8Z08cj0Lke6k6BchWRBqlU0f68=; b=EPI4iBPFudZU67QHTHTNW9pcC0
        65WCXXytDwRuuaxK6T0P1NhExdWVZ8s7Ysg/d/STgUMv4XNjE37EDFUK73vXlwjWoFx9eH6lCqULx
        pT6ox1oouKm0VkZrqr8k5XvbF6Pf0HviD0ozzbTWWpxTDWywAlnlY6ojuYbhZZua1M3/EXhYfNakI
        rL8RekyQKbqGFrKXM4694p964CZS7pPRTZXjagOfTSfHGq5P6Jvi4j3ytvWjzspIUQ/sZO7VTUztj
        I+hdnQYqJdNdeINVPitZIqvnI2u/It+pqiQE+dVEapu1x9xCiWLtYK097EOalersGdWl3RMu1mBpl
        D+Odvryw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1l4EMi-0002kh-QK; Tue, 26 Jan 2021 04:46:00 +0200
Subject: Re: [PATCH v5 00/21] Host1x/TegraDRM UAPI
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
Date:   Tue, 26 Jan 2021 04:45:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 1/20/21 12:29 AM, Dmitry Osipenko wrote:
> 11.01.2021 15:59, Mikko Perttunen пишет:
>> Hi all,
>>
>> here's the fifth revision of the Host1x/TegraDRM UAPI proposal,
>> containing primarily small bug fixes. It has also been
>> rebased on top of recent linux-next.
>>
>> vaapi-tegra-driver has been updated to support the new UAPI
>> as well as Tegra186:
>>
>>    https://github.com/cyndis/vaapi-tegra-driver
>>
>> The `putsurface` program has been tested to work.
>>
>> The test suite for the new UAPI is available at
>> https://github.com/cyndis/uapi-test
>>
>> The series can be also found in
>> https://github.com/cyndis/linux/commits/work/host1x-uapi-v5.
>>
>> Older versions:
>> v1: https://www.spinics.net/lists/linux-tegra/msg51000.html
>> v2: https://www.spinics.net/lists/linux-tegra/msg53061.html
>> v3: https://www.spinics.net/lists/linux-tegra/msg54370.html
>> v4: https://www.spinics.net/lists/dri-devel/msg279897.html
>>
>> Thank you,
>> Mikko
> 
> The basic support for the v5 UAPI is added now to the Opentegra driver.
>   In overall UAPI works, but there are couple things that we need to
> improve, I'll focus on them here.
> 
> Problems
> ========
> 
> 1. The channel map/unmap API needs some more thought.
> 
> The main problem is a difficulty to track liveness of BOs and mappings.
>   The kernel driver refs BO for each mapping and userspace needs to track
> both BO and its mappings together, it's too easy to make mistake and
> leak BOs without noticing.
> 
> 2. Host1x sync point UAPI should not be used for tracking DRM jobs.  I
> remember we discussed this previously, but this pops up again and I
> don't remember where we ended previously.
> 
> This creates unnecessary complexity for userspace.  Userspace needs to
> go through a lot of chores just to get a sync point and then to manage
> it for the jobs.
> 
> Nothing stops two different channels to reuse a single sync point and
> use it for a job, fixing this will only add more complexity to the
> kernel driver instead of removing it.
> 
> 3. The signalling of DMA fences doesn't work properly in v5 apparently
> because of the host1x waiter bug.  I see that sync point interrupt
> happens, but waiter callback isn't invoked.
> 
> 4. The sync_file API is not very suitable for DRM purposes because of
> -EMFILE "Too many open files", which I saw while was running x11perf.
> It also adds complexity to userspace, instead of removing it.  This
> approach not suitable for DRM scheduler as well.
> 
> 5. Sync points have a dirty hardware state when allocated / requested.
> The special sync point reservation is meaningless in this case.
> 
> 6. I found that the need to chop cmdstream into gathers is a bit
> cumbersome for userspace of older SoCs which don't have h/w firewall.
> Can we support option where all commands are collected into a single
> dedicated cmdstream for a job?
> 
> Possible solutions for the above problems
> =========================================
> 
> 1. Stop to use concept of "channels". Switch to DRM context-only.
> 
> Each DRM context should get access to all engines once DRM context is
> created.  Think of it like "when DRM context is opened, it opens a
> channel for each engine".
> 
> Then each DRM context will get one instance of mapping per-engine for
> each BO.
> 
> enum tegra_engine {
> 	TEGRA_GR2D,
> 	TEGRA_GR3D,
> 	TEGRA_VIC,
> 	...
> 	NUM_ENGINES
> };
> 
> struct tegra_bo_mapping {
> 	dma_addr_t ioaddr;
> 	...
> };
> 
> struct tegra_bo {
> 	...
> 	struct tegra_bo_mapping *hw_maps[NUM_ENGINES];
> };
> 
> Instead of DRM_IOCTL_TEGRA_CHANNEL_MAP we should have
> DRM_IOCTL_TEGRA_GEM_MAP_TO_ENGINE, which will create a BO mapping for a
> specified h/w engine.
> 
> Once BO is closed, all its mappings should be closed too.  This way
> userspace doesn't need to track both BOs and mappings.
> 
> Everything that userspace needs to do is:
> 
> 	1) Open DRM context
> 	2) Create GEM
> 	3) Map GEM to required hardware engines
> 	4) Submit job that uses GEM handle
> 	5) Close GEM
> 
> If GEM wasn't mapped prior to the job's submission, then job will fail
> because kernel driver won't resolve the IO mapping of the GEM.
Perhaps we can instead change the reference counting such that if you 
close the GEM object, the mappings will be dropped as well automatically.

> 
> 2. We will probably need a dedicated drm_tegra_submit_cmd for sync point
> increments.  The job's sync point will be allocated dynamically when job
> is submitted.  We will need a fag for the sync_incr and wait_syncpt
> commands, saying "it's a job's sync point increment/wait"

Negative. Like I have explained in previous discussions, with the 
current way the usage of hardware resources is much more deterministic 
and obvious. I disagree on the point that this is much more complicated 
for the userspace. Separating syncpoint and channel allocation is one of 
the primary motivations of this series for me.

> 
> 3. We should use dma-fence API directly and waiter-shim should be
> removed.  It's great that you're already working on this.
> 
> 4. Sync file shouldn't be needed for the part of DRM API which doesn't
> interact with external non-DRM devices.  We should use DRM syncobj for
> everything related to DRM, it's a superior API over sync file, it's
> suitable for DRM scheduler.

Considering the issues with fileno limits, I suppose there is no other 
choice. Considering the recent NTSYNC proposal by Wine developers, maybe 
we should also have NTHANDLEs to get rid of restrictions of file 
descriptors. DRM syncobjs may have some advantages over sync files, but 
also disadvantages. They cannot be poll()ed, so they cannot be combined 
with waits for other resources.

I'll look into this for v6.

> 
> 5. The hardware state of sync points should be reset when sync point is
> requested, not when host1x driver is initialized.

This may be doable, but I don't think it is critical for this UAPI, so 
let's consider it after this series.

The userspace should anyway not be able to assume the initial value of 
the syncpoint upon allocation. The kernel should set it to some high 
value to catch any issues related to wraparound.

Also, this makes code more complicated since it now needs to ensure all 
waits on the syncpoint have completed before freeing the syncpoint, 
which can be nontrivial e.g. if the waiter is in a different virtual 
machine or some other device connected via PCIe (a real usecase).

> 
> 6. We will need to allocate a host1x BO for a job's cmdstream and add a
> restart command to the end of the job's stream.  CDMA will jump into the
> job's stream from push buffer.
> 
> We could add a flag for that to drm_tegra_submit_cmd_gather, saying that
> gather should be inlined into job's main cmdstream.
> 
> This will remove a need to have a large push buffer that will easily
> overflow, it's a real problem and upstream driver even has a bug where
> it locks up on overflow.
> 
> How it will look from CDMA perspective:
> 
> PUSHBUF |
> ---------
> ...     |      | JOB   |
>          |      ---------       | JOB GATHER |
> RESTART	------> CMD    |       --------------
>          |      |GATHER -------> DATA        |
> ... <---------- RESTART|       |            |
>          |      |       |
> 

Let me check if I understood you correctly:
- You would like to have the job's cmdbuf have further GATHER opcodes 
that jump into smaller gathers?

I assume this is needed because currently WAITs are placed into the 
pushbuffer, so the job will take a lot of space in the pushbuffer if 
there are a lot of waits (and GATHERs in between these waits)?

If so, perhaps as a simpler alternative we could change the firewall to 
allow SETCLASS into HOST1X for waiting specifically, then userspace 
could just submit one big cmdbuf taking only little space in the 
pushbuffer? Although that would only allow direct ID/threshold waits.

In any case, it seems that this can be added in a later patch, so we 
should omit it from this series for simplicity. If it is impossible for 
the userspace to deal with it, we could disable the firewall 
temporarily, or implement the above change in the firewall.

> 
> What's missing
> ==============
> 
> 1. Explicit and implicit fencing isn't there yet, we need to support DRM
> scheduler for that.
> 
> 2. The "wait" command probably should be taught to take a syncobj handle
> in order to populate it with a dma-fence by kernel driver once job is
> submitted.  This will give us intermediate fences of a job and allow
> utilize the syncobj features like "wait until job is submitted to h/w
> before starting to wait for timeout", which will be needed by userspace
> when DRM scheduler will be supported.
> 
> Miscellaneous
> =============
> 
> 1. Please don't forget to bump driver version.  This is important for
> userspace.

Sure. I didn't do it this time since it's backwards compatible and it's 
easy to detect if the new UAPI is available by checking for /dev/host1x. 
I can bump it in v6 if necessary.

> 
> 2. Please use a proper kernel coding style, use checkpatch.
> 
>     # git format-patch -v5 ...
>     # ./scripts/checkpatch.pl --strict v5*

Looks like I accidentally placed some spaces into firewall.c. Otherwise 
the warnings it prints do not look critical.

> 
> 3. Kernel driver needs a rich error messages for each error condition
> and it should dump submitted job when firewall fails.  It's very tedious
> to re-add it all each time when something doesn't work.

Yes, that's true. Will take a look for v6.

> 
> 4. Previously firewall was using the client's class if is_valid_class
> wasn't specified in tegra_drm_client_ops, you changed it and now
> firewall fails for GR3D because it doesn't have the is_valid_class() set
> in the driver.  See [1].
> 
> 5. The CDMA class should be restored to the class of a previous gather
> after the wait command in submit_gathers() and not to the class of the
> client.  GR2D supports multiple classes.  See [1].

Will take a look at these two for v6.

> 
> [1]
> https://github.com/grate-driver/linux/commit/024cba369c9c0e2762e9890068ff9944cb10c44f
> 

Mikko
