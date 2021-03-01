Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 714C6C433E0
	for <linux-tegra@archiver.kernel.org>; Mon,  1 Mar 2021 08:20:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 172C264E46
	for <linux-tegra@archiver.kernel.org>; Mon,  1 Mar 2021 08:20:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232728AbhCAIUJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 1 Mar 2021 03:20:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232685AbhCAIUG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 1 Mar 2021 03:20:06 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C3CC06174A
        for <linux-tegra@vger.kernel.org>; Mon,  1 Mar 2021 00:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=VBhVOW7QddtMZpz+i56Kuzuo/t/oTeHJKm9TIPy0ZrU=; b=KvojWjMs7Rqo59UeM8TaVNO7NA
        r+EMH+klyQOf9zUwGCJItMjEJ9wl9G6SCL2pC08mH+y2rin7yioNEKj7ddTgP9GottnYPJqoQHJzk
        C3qCcIl4hfPADOYEFn7w6/XCKPYmcHYQwE2u/cBOcx6S3aXhzqhvJaAlC46/JRXmiuizGu3mB7jsF
        XKeVYUaoNP6ixZqx4Qw6JoILG+AZglZkkAXGcp8rg3dq+GFaE+Xrja75S6tsSc3MaIfJMIPIzT13X
        thO7+DtjoNVTSblVaS20jKlJm/3+PLZsaniyFeTWhuLu2wpedph0m1/qLLWpnXTJ9lwOPFY+6+hrQ
        hTMsScZQ==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1lGdll-0006AF-6M; Mon, 01 Mar 2021 10:19:09 +0200
Subject: Re: [PATCH v5 00/21] Host1x sync point UAPI should not be used for
 tracking DRM jobs
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>, jonathanh@nvidia.com,
        airlied@linux.ie, daniel@ffwll.ch, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, talho@nvidia.com,
        bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
 <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
 <2ee12338-bd5a-4b99-f86d-13da0d2a899b@gmail.com>
 <8504c239-d5df-3033-934c-7b3fab52e387@kapsi.fi> <YBLtPv/1mGXwtibX@ulmo>
 <1ff922b2-161d-c8b9-7b08-4454ff7329f8@gmail.com>
 <25248139-5487-a15b-8965-1a29a71eacd7@kapsi.fi>
 <6211ee04-ebd6-74d3-cb5b-955b17acff5b@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <25beafda-8dd2-aeb9-1497-2c17907fbfd3@kapsi.fi>
Date:   Mon, 1 Mar 2021 10:19:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6211ee04-ebd6-74d3-cb5b-955b17acff5b@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2/27/21 1:19 PM, Dmitry Osipenko wrote:
> 03.02.2021 14:18, Mikko Perttunen пишет:
> ...
>>> I'll need more time to think about it.
>>>
>>
>> How about something like this:
>>
>> Turn the syncpt_incr field back into an array of structs like
>>
>> #define DRM_TEGRA_SUBMIT_SYNCPT_INCR_REPLACE_SYNCOBJ        (1<<0)
>> #define DRM_TEGRA_SUBMIT_SYNCPT_INCR_PATCH_DYNAMIC_SYNCPT    (1<<1)
>>
>> struct drm_tegra_submit_syncpt_incr {
>>      /* can be left as zero if using dynamic syncpt */
>>      __u32 syncpt_id;
>>      __u32 flags;
>>
>>      struct {
>>          __u32 syncobj;
>>          __u32 value;
>>      } fence;
>>
>>      /* patch word as such:
>>           * *word = *word | (syncpt_id << shift)
>>           */
>>      struct {
>>          __u32 gather_offset_words;
>>          __u32 shift;
>>      } patch;
>> };
>>
>> So this will work similarly to the buffer reloc system; the kernel
>> driver will allocate a job syncpoint and patch in the syncpoint ID if
>> requested, and allows outputting syncobjs for each increment.
> 
> I haven't got any great ideas so far, but it feels that will be easier
> and cleaner if we could have separate job paths (and job IOCTLS) based
> on hardware generation since the workloads a too different. The needs of
> a newer h/w are too obscure for me and absence of userspace code,
> firmware sources and full h/w documentation do not help.
> 
> There still should be quite a lot to share, but things like
> mapping-to-channel and VM sync points are too far away from older h/w,
> IMO. This means that code path before drm-sched and path for job-timeout
> handling should be separate.
> 
> Maybe later on it will become cleaner that we actually could unify it
> all nicely, but for now it doesn't look like a good idea to me.
> 
> Mikko, do you have any objections to trying out variant with the
> separate paths?
> 

I'm on vacation for the next two weeks. I'll think about it and post a 
proposal once I'm back to work.

Mikko
