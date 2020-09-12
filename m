Return-Path: <SRS0=YHIj=CV=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 306F4C43461
	for <linux-tegra@archiver.kernel.org>; Sat, 12 Sep 2020 13:32:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97AA2207FB
	for <linux-tegra@archiver.kernel.org>; Sat, 12 Sep 2020 13:32:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="XibWX2OF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbgILNcC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 12 Sep 2020 09:32:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgILNbw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 12 Sep 2020 09:31:52 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BCBEC061573
        for <linux-tegra@vger.kernel.org>; Sat, 12 Sep 2020 06:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ddacKGL97I74ZStIHKqHFVEiRrwAsDG8WpYCuGniG44=; b=XibWX2OFNuK5/XyCkjIE1wwCJq
        I9BtPUeOhCcvs1toNZDBt35qo2inUvKpV9XA3I8GjmddinYD32Aokn25+T8ZkVMS3ULjhq2z0wN/J
        S0Ab8ac4BMTZYRfVXgCJQk7UKXv3FNyLnDs2ub1LZYcoVx6n1lYxdPsjjrk/pf8aJu8LXaI5ZYFCX
        6fS0MOfPn9g36OJiqE4DmbzeIEVeA3lOrQLKIPVWi+RUZWa+NkEnL0vM6ra+FYAPyM0WmsFqFGAJm
        mqzUtXcaVFKVZAii05C4NbA4kaGwAU23zPE2OWNQF5h5S8iKTdF8V3r+TjW2A1sxHTnejOd0mwTBJ
        m0rbo75w==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kH5d1-0000ko-JT; Sat, 12 Sep 2020 16:31:43 +0300
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
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <28f18a23-b588-004d-4945-91b7a593607a@kapsi.fi>
Date:   Sat, 12 Sep 2020 16:31:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <07f933b3-10d9-0318-e2f3-6dfd5b4903ac@gmail.com>
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

On 9/12/20 3:53 PM, Dmitry Osipenko wrote:
> 12.09.2020 01:11, Mikko Perttunen пишет:
>> On 9/11/20 7:40 PM, Dmitry Osipenko wrote:
>>> 05.09.2020 13:34, Mikko Perttunen пишет:
>>>> +    } else {
>>>> +        struct host1x_job *failed_job = job;
>>>> +
>>>> +        host1x_job_dump(dev, job);
>>>> +
>>>> +        host1x_syncpt_set_locked(job->syncpt);
>>>> +        failed_job->cancelled = true;
>>>> +
>>>> +        list_for_each_entry_continue(job, &cdma->sync_queue, list) {
>>>> +            unsigned int i;
>>>> +
>>>> +            if (job->syncpt != failed_job->syncpt)
>>>> +                continue;
>>>> +
>>>> +            for (i = 0; i < job->num_slots; i++) {
>>>> +                unsigned int slot = (job->first_get/8 + i) %
>>>> +                            HOST1X_PUSHBUFFER_SLOTS;
>>>> +                u32 *mapped = cdma->push_buffer.mapped;
>>>> +
>>>> +                mapped[2*slot+0] = 0x1bad0000;
>>>> +                mapped[2*slot+1] = 0x1bad0000;
>>>
>>> The 0x1bad0000 is a valid memory address on Tegra20.
>>>
>>> The 0x60000000 is invalid phys address for all hardware generations.
>>> It's used by grate-kernel [1] and VDE driver [2]. Note that the 0x6 <<
>>> 28 is also invalid Host1x opcode, while 0x1 should break CDMA parser
>>> during of PB debug-dumping.
>>>
>>> [1]
>>> https://github.com/grate-driver/linux/blob/master/drivers/gpu/drm/tegra/gem.h#L16
>>>
>>>
>>> [2]
>>> https://elixir.bootlin.com/linux/v5.9-rc4/source/drivers/staging/media/tegra-vde/iommu.c#L99
>>>
>>>
>>> The VDE driver reserves the trapping IOVA addresses, I assume the Host1x
>>> driver should do the same.
>>>
>>
>> The 0x1bad0000's are not intended to be memory addresses, they are NOOP
>> opcodes (INCR of 0 words to offset 0xbad). I'll fix this to use proper
>> functions to construct the opcodes and add some comments. These need to
>> be NOOP opcodes so the command parser skips over these "cancelled" jobs
>> when the channel is resumed.
>>
>> BTW, 0x60000000 is valid on Tegra194 and later.
> 
> At a quick glance it looked like a memory address :)

It does look a bit like one :) I'll add a comment to make it clear.

> 
> I'm now taking a closer look at this patch and it raises some more
> questions, like for example by looking at the "On job timeout, we stop
> the channel, NOP all future jobs on the channel using the same syncpoint
> ..." through the prism of grate-kernel experience, I'm not sure how it
> could co-exist with the drm-scheduler and why it's needed at all. But I
> think we need a feature-complete version (at least a rough version), so
> that we could start the testing, and then it should be easier to review
> and discuss such things.
> 

The reason this is needed is that if a job times out and we don't do its 
syncpoint increments on the CPU, then a successive job incrementing that 
same syncpoint would cause fences to signal incorrectly. The job that 
was supposed to signal those fences didn't actually run; and any data 
those fences were protecting would still be garbage.
