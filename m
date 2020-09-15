Return-Path: <SRS0=iMCN=CY=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D871AC433E2
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Sep 2020 10:59:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D9B6206DC
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Sep 2020 10:59:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="hwBuVZbs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgIOK66 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Sep 2020 06:58:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbgIOK6M (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Sep 2020 06:58:12 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 460CEC06174A
        for <linux-tegra@vger.kernel.org>; Tue, 15 Sep 2020 03:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=xP8x+rJt/TDG2zJOATSck7z/xoasmq8xmsbnci0vekA=; b=hwBuVZbsJMj7BYuovOczCmWmJO
        +stzJG5cE13CJx9193Mr1QqrLnyIYFr2dEBTNvH4uS4OfvxU/d70aeA3FWpW/OG3S5az3GX1oqWXf
        Gy3l6+SOIMchyV7itseuSvP9I8VAnHy0cgi7qVnFPEAiTJ4TPmHovyatcKq2uChQLEwNKW4lKlPQb
        bPsBCRtOyhAR3vYn4xTxonvGxpw4Cf/Kk+V1JDib+7E1XX8bpmAMoL0wt3Ia+hVdhEm6PNGB2530b
        trYEYdAotwlfHVeLzwnFUVq8L4yY/uQriT+AByVq3MoY41ZFU/5DG8rNBkmlkgs6iYBnWqfTU0aWq
        y2teu5yQ==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kI8et-0001i2-0o; Tue, 15 Sep 2020 13:57:59 +0300
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
 <56c956a3-af14-559b-8022-2228a65e82a6@kapsi.fi>
 <fe626343-6f10-96bd-171c-7876917d570b@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <3e8abd77-6d33-98fa-7df0-17b9c10596eb@kapsi.fi>
Date:   Tue, 15 Sep 2020 13:57:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <fe626343-6f10-96bd-171c-7876917d570b@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 9/13/20 9:37 PM, Dmitry Osipenko wrote:
> 13.09.2020 12:51, Mikko Perttunen пишет:
> ...
>>> All waits that are internal to a job should only wait for relative sync
>>> point increments. >
>>> In the grate-kernel every job uses unique-and-clean sync point (which is
>>> also internal to the kernel driver) and a relative wait [1] is used for
>>> the job's internal sync point increments [2][3][4], and thus, kernel
>>> driver simply jumps over a hung job by updating DMAGET to point at the
>>> start of a next job.
>>
>> Issues I have with this approach:
>>
>> * Both this and my approach have the requirement for userspace, that if
>> a job hangs, the userspace must ensure all external waiters have timed
>> out / been stopped before the syncpoint can be freed, as if the
>> syncpoint gets reused before then, false waiter completions can happen.
>>
>> So freeing the syncpoint must be exposed to userspace. The kernel cannot
>> do this since there may be waiters that the kernel is not aware of. My
>> proposal only has one syncpoint, which I feel makes this part simpler, too.
>>
>> * I believe this proposal requires allocating a syncpoint for each
>> externally visible syncpoint increment that the job does. This can use
>> up quite a few syncpoints, and it makes syncpoints a dynamically
>> allocated resource with unbounded allocation latency. This is a problem
>> for safety-related systems.
> 
> Maybe we could have a special type of a "shared" sync point that is
> allocated per-hardware engine? Then shared SP won't be a scarce resource
> and job won't depend on it. The kernel or userspace driver may take care
> of recovering the counter value of a shared SP when job hangs or do
> whatever else is needed without affecting the job's sync point.

Having a shared syncpoint opens up possibilities for interference 
between jobs (if we're not using the firewall, the HW cannot distinguish 
between jobs on the same channel), and doesn't work if there are 
multiple channels using the same engine, which we want to do for newer 
chips (for performance and virtualization reasons).

Even then, even if we need to allocate one syncpoint per job, the issue 
seems to be there.

> 
> Primarily I'm not feeling very happy about retaining the job's sync
> point recovery code because it was broken the last time I touched it and
> grate-kernel works fine without it.

I'm not planning to retain it any longer than necessary, which is until 
the staging interface is removed. Technically I can already remove it 
now -- that would cause any users of the staging interface to 
potentially behave weirdly if a job times out, but maybe we don't care 
about that all that much?

> 
>> * If a job fails on a "virtual channel" (userctx), I think it's a
>> reasonable expectation that further jobs on that "virtual channel" will
>> not execute, and I think implementing that model is simpler than doing
>> recovery.
> 
> Couldn't jobs just use explicit fencing? Then a second job won't be
> executed if first job hangs and explicit dependency is expressed. I'm
> not sure that concept of a "virtual channel" is applicable to drm-scheduler.

I assume what you mean is that each job incrementing a syncpoint would 
first wait for the preceding job incrementing that syncpoint to 
complete, by waiting for the preceding job's fence value.

I would consider what I do in this patch to be an optimization of that. 
Let's say we detect a timed out job and just skip that job in the CDMA 
pushbuffer (but do not CPU-increment syncpoints), then at every 
subsequent job using that syncpoint, we will be detecting a timeout and 
skipping it eventually. With the "NOPping" in this patch we just 
pre-emptively cancel those jobs so that we don't have to spend time 
waiting for timeouts in the future. Functionally these should be the 
same, though.

The wait-for-preceding-job-to-complete thing should already be there in 
form of the "serialize" operation if the jobs use the same syncpoint.

So, if DRM scheduler's current operation is just skipping the timing out 
job and continuing from the next job, that's functionally fine. But we 
could improve DRM scheduler to allow for also cancelling future jobs 
that we know will time out. That would be in essence "virtual channel" 
support.

Userspace still has options -- if it puts in other prefences, timeouts 
will happen as usual. If it wants to have multiple "threads" of 
execution where a timeout on one doesn't affect the others, it can use 
different syncpoints for them.

> 
> I'll need to see a full-featured driver implementation and the test
> cases that cover all the problems that you're worried about because I'm
> not aware about all the T124+ needs and seeing code should help. Maybe
> in the end yours approach will be the best, but for now it's not clear :)
> 

My primary goal is simplicity of programming model and implementation. 
Regarding the resource management concerns, I can of course create a 
test case that allocates a lot of resources, but what I'm afraid about 
is that once we put this into a big system, with several VMs with their 
own resource reservations (including syncpoints), and the GPU and camera 
subsystems using hundreds of syncpoints, dynamic usage of those 
resources will create uncertainty in the system, and bug reports.

And of course, if we want to make a safety-related system, you also need 
to document before-hand how you are ensuring that e.g. job submission 
(including syncpoint allocation if that is dynamic) happens under x 
microseconds.

I don't think the model used in the grate host1x driver is bad, and I 
think the code there and its integration with the existing kernel 
frameworks are beautiful, and that is definitely a goal for the mainline 
driver as well. But I think we can make things even simpler overall and 
more reliable.

Mikko
