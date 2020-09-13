Return-Path: <SRS0=sMWC=CW=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E94C43461
	for <linux-tegra@archiver.kernel.org>; Sun, 13 Sep 2020 09:51:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D0242098B
	for <linux-tegra@archiver.kernel.org>; Sun, 13 Sep 2020 09:51:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="mW9ELElO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbgIMJvv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 13 Sep 2020 05:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbgIMJvu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 13 Sep 2020 05:51:50 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BED6CC061573
        for <linux-tegra@vger.kernel.org>; Sun, 13 Sep 2020 02:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=4Lfu09LMF3J0CbNmYFr8EahUrvUMGY6J2P159wTaFeo=; b=mW9ELElO33S1fACdlrYAXlTUu9
        M/Na5Owl9axlSlIo+DVtzT8iEVZFBTt7ArjtBJ1MTHV6hqQSunZqHUrLkp2fxZ+NIa6DEmK7n32TR
        byE4EH9y1aiPTKbgH6YpXOEikI3+Bq8l1FtqLC74ogWd68ElPUaSIyNIp6PMbzjeiKTR119lmtqW/
        QG4tutiCK6mvVMnwfge9N/cUVtChFDRbEVCUGilqlRgDOYAzbtEjLY3xmC1uuY3iadqQFo2GccZIa
        Nwb73uoK5tsDHoDhBtpMz3qmV/8N/aAn3W/1qpSYL0cgGsmDFKTrs03pJKw+sPlj5Ftz8UKX4Wg4Q
        i5ENY/9w==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kHOfX-0001jl-G0; Sun, 13 Sep 2020 12:51:35 +0300
Subject: Re: [RFC PATCH v2 10/17] WIP: gpu: host1x: Add no-recovery mode
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-11-mperttunen@nvidia.com>
 <7d7a29e8-3151-12ea-da66-d8a479edda84@gmail.com>
 <c2498218-e107-4df4-41ce-c60da65ceaf7@kapsi.fi>
 <07f933b3-10d9-0318-e2f3-6dfd5b4903ac@gmail.com>
 <28f18a23-b588-004d-4945-91b7a593607a@kapsi.fi>
 <3f80aff2-23ce-9b1f-d242-e46e974fbeed@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <56c956a3-af14-559b-8022-2228a65e82a6@kapsi.fi>
Date:   Sun, 13 Sep 2020 12:51:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <3f80aff2-23ce-9b1f-d242-e46e974fbeed@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 9/13/20 12:51 AM, Dmitry Osipenko wrote:
> 12.09.2020 16:31, Mikko Perttunen пишет:
> ...
>>> I'm now taking a closer look at this patch and it raises some more
>>> questions, like for example by looking at the "On job timeout, we stop
>>> the channel, NOP all future jobs on the channel using the same syncpoint
>>> ..." through the prism of grate-kernel experience, I'm not sure how it
>>> could co-exist with the drm-scheduler and why it's needed at all. But I
>>> think we need a feature-complete version (at least a rough version), so
>>> that we could start the testing, and then it should be easier to review
>>> and discuss such things.
>>>
>>
>> The reason this is needed is that if a job times out and we don't do its
>> syncpoint increments on the CPU, then a successive job incrementing that
>> same syncpoint would cause fences to signal incorrectly. The job that
>> was supposed to signal those fences didn't actually run; and any data
>> those fences were protecting would still be garbage.
> 
> I'll need to re-read the previous discussion because IIRC, I was
> suggesting that once job is hung, all jobs should be removed from
> queue/PB and re-submitted, then the re-submitted jobs will use the
> new/updated sync point base. >
> And we probably should need another drm_tegra_submit_cmd type that waits
> for a relative sync point increment. The
> drm_tegra_submit_cmd_wait_syncpt uses absolute sync point value and it
> shouldn't be used for sync point increments that are internal to a job
> because it complicates the recovery.
> 
> All waits that are internal to a job should only wait for relative sync
> point increments. >
> In the grate-kernel every job uses unique-and-clean sync point (which is
> also internal to the kernel driver) and a relative wait [1] is used for
> the job's internal sync point increments [2][3][4], and thus, kernel
> driver simply jumps over a hung job by updating DMAGET to point at the
> start of a next job.

Issues I have with this approach:

* Both this and my approach have the requirement for userspace, that if 
a job hangs, the userspace must ensure all external waiters have timed 
out / been stopped before the syncpoint can be freed, as if the 
syncpoint gets reused before then, false waiter completions can happen.

So freeing the syncpoint must be exposed to userspace. The kernel cannot 
do this since there may be waiters that the kernel is not aware of. My 
proposal only has one syncpoint, which I feel makes this part simpler, too.

* I believe this proposal requires allocating a syncpoint for each 
externally visible syncpoint increment that the job does. This can use 
up quite a few syncpoints, and it makes syncpoints a dynamically 
allocated resource with unbounded allocation latency. This is a problem 
for safety-related systems.

* If a job fails on a "virtual channel" (userctx), I think it's a 
reasonable expectation that further jobs on that "virtual channel" will 
not execute, and I think implementing that model is simpler than doing 
recovery.

Mikko

> 
> [1]
> https://github.com/grate-driver/linux/blob/master/drivers/gpu/drm/tegra/uapi/patching.c#L367
> 
> [2]
> https://github.com/grate-driver/xf86-video-opentegra/blob/master/src/gpu/gr3d.c#L486
> [3]
> https://github.com/grate-driver/xf86-video-opentegra/blob/master/src/exa/copy_2d.c#L389
> [4]
> https://github.com/grate-driver/xf86-video-opentegra/blob/master/src/gpu/tegra_stream_v2.c#L536
> 
