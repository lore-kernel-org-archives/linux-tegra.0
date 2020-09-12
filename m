Return-Path: <SRS0=YHIj=CV=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E60AC433E2
	for <linux-tegra@archiver.kernel.org>; Sat, 12 Sep 2020 21:51:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01EC8207FB
	for <linux-tegra@archiver.kernel.org>; Sat, 12 Sep 2020 21:51:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SddZNpt6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbgILVvI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 12 Sep 2020 17:51:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbgILVvG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 12 Sep 2020 17:51:06 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B17BC061573
        for <linux-tegra@vger.kernel.org>; Sat, 12 Sep 2020 14:51:04 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id u21so15413877ljl.6
        for <linux-tegra@vger.kernel.org>; Sat, 12 Sep 2020 14:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x7NtD2cqmVyAb0mvqEzYpWxVCY3t1I1LATgOhBQ2Smk=;
        b=SddZNpt6cKbqkDivdqi+qiv5AXVgdJ8qpaJns97YxglFowZBloOhrCiH74qgP+kUYb
         CBoW2wyg5TqQMwOlMrQtShVVmBhFV6Q/sURG8pfMrXthT/0965lGp4DvuRTuSOAcPyxa
         YPMVNtBLpZ15BCDjqLlEwZVc4M7MX+zGn6bKIUEIbYKsvbeNHODLE0FIy0LYLFJ783d2
         IkHpXWfktgscsQErCfbJMN+/rZSEG8kupUv5K48OvjgI0Ktl/tOTEtUDDonGB22gyaXY
         JfeJkdKJXDpQ3tlFn6huBuawB5WPwf/zlY3gSFAzS2FsWCM5EIuGxdXjDSF8TXuTagP2
         zi/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x7NtD2cqmVyAb0mvqEzYpWxVCY3t1I1LATgOhBQ2Smk=;
        b=d24ko+giMXa5JUUpMrCry0PiBDDQGUTfXv4jUD+MNVT/MW7GyOfc4MEDOaZiiI/JIt
         CTiN3MPjLOXCSiThm6cLtcQny1/tATx9uD8hrT1JUBeWfuRNAZJGVDj97ElGUKy3ZvH0
         whoJIvHth01lskbyjt5gmxf6p3O0bQBObsSUPftttIPQZF3qx7MrpLbMOqxhUpII40fe
         ufBkZLZa5CLvHWJqLR6BAoOvWv2WrnzjfbOoKEZBBNHJBV96ldA88++yWjwGimj2MAzu
         VkGSGYsYTB6siL0rVEbNaqNGWUZgOPw3FWlfuI8GNOXvb+iNPwXrfUN2XCv8Ik/nygwa
         Bgwg==
X-Gm-Message-State: AOAM531sAyM1NlMR0csTDH+TRS4fjM2MP6XNOSFQzSuvJkszJ4SHPWQ9
        ID8nJBrTS2WSRHeFIRMpUeWTCmTfLYk=
X-Google-Smtp-Source: ABdhPJw39OlgjMmz4lqL6T+rgdndiDsRzGiObFwyXkfYqPKxIRfleS1zXw3PNnFmnlobyxOIky7uMQ==
X-Received: by 2002:a2e:9b99:: with SMTP id z25mr3003635lji.403.1599947463050;
        Sat, 12 Sep 2020 14:51:03 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id g30sm1816912lfj.74.2020.09.12.14.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2020 14:51:02 -0700 (PDT)
Subject: Re: [RFC PATCH v2 10/17] WIP: gpu: host1x: Add no-recovery mode
To:     Mikko Perttunen <cyndis@kapsi.fi>,
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3f80aff2-23ce-9b1f-d242-e46e974fbeed@gmail.com>
Date:   Sun, 13 Sep 2020 00:51:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <28f18a23-b588-004d-4945-91b7a593607a@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

12.09.2020 16:31, Mikko Perttunen пишет:
...
>> I'm now taking a closer look at this patch and it raises some more
>> questions, like for example by looking at the "On job timeout, we stop
>> the channel, NOP all future jobs on the channel using the same syncpoint
>> ..." through the prism of grate-kernel experience, I'm not sure how it
>> could co-exist with the drm-scheduler and why it's needed at all. But I
>> think we need a feature-complete version (at least a rough version), so
>> that we could start the testing, and then it should be easier to review
>> and discuss such things.
>>
> 
> The reason this is needed is that if a job times out and we don't do its
> syncpoint increments on the CPU, then a successive job incrementing that
> same syncpoint would cause fences to signal incorrectly. The job that
> was supposed to signal those fences didn't actually run; and any data
> those fences were protecting would still be garbage.

I'll need to re-read the previous discussion because IIRC, I was
suggesting that once job is hung, all jobs should be removed from
queue/PB and re-submitted, then the re-submitted jobs will use the
new/updated sync point base.

And we probably should need another drm_tegra_submit_cmd type that waits
for a relative sync point increment. The
drm_tegra_submit_cmd_wait_syncpt uses absolute sync point value and it
shouldn't be used for sync point increments that are internal to a job
because it complicates the recovery.

All waits that are internal to a job should only wait for relative sync
point increments.

In the grate-kernel every job uses unique-and-clean sync point (which is
also internal to the kernel driver) and a relative wait [1] is used for
the job's internal sync point increments [2][3][4], and thus, kernel
driver simply jumps over a hung job by updating DMAGET to point at the
start of a next job.

[1]
https://github.com/grate-driver/linux/blob/master/drivers/gpu/drm/tegra/uapi/patching.c#L367

[2]
https://github.com/grate-driver/xf86-video-opentegra/blob/master/src/gpu/gr3d.c#L486
[3]
https://github.com/grate-driver/xf86-video-opentegra/blob/master/src/exa/copy_2d.c#L389
[4]
https://github.com/grate-driver/xf86-video-opentegra/blob/master/src/gpu/tegra_stream_v2.c#L536
