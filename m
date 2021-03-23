Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA56DC433C1
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 19:58:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 60C0D619CB
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 19:58:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232784AbhCWT5u (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 15:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232388AbhCWT5n (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 15:57:43 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E548C061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 12:57:43 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id o126so18962782lfa.0
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 12:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tLOU7baKB0TYVPxYLVj2OaWVh+GaLnQyuWYWA6+PT4w=;
        b=H/78cF+CHO2lJGWLn0yukJwkg57ETsgxkCbMSy+SkH20iIfme6uC8yMEJoIsMnE9Ke
         WaBriPpJtgsI6hY2EOx2oYab4i/XJs/W9XHYYteIoUOfTTXgGeKwRCu0cnfTvfUj70aK
         8gRCdMrNt8p48t6MGkWmGrDDJ508tKtlkT71IPE7F7dMGb/6nG+UiDS6vby1GR5/TcPf
         iF1crsKz+E5FqoJxXjO6njfi7ugZSSvxpZkrpQclnPekzCWNVCw//hGU+8CAUTHf6e1o
         gMsaJp9yosmhuKSbaDldAjHCOtO5MpB6KyV4I3pHhetpCkebaxSu8stmmXbAn25iesvw
         BAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tLOU7baKB0TYVPxYLVj2OaWVh+GaLnQyuWYWA6+PT4w=;
        b=K7MIz6+d4wqAJjvRiCBXynaOSwEoCqQHPafVCzLRdFEBSx2kHLSF3iL+akycjL406g
         HCgPSuThz1+ZowTqFiCi79CiYhV3otLFMttyc3NteETYkZRZfw688SkkEkg7Fk30V1FV
         tldcYs5JwYUyk3YgYLNkXc1lAEZXMA3J3vNB0zsey+PLAf6usVFnJlhmB2CIz/Kj8+t2
         klrOsyKXYvJhv55rOZzquhCA+xMp6wxwjX9WwyY3hXxDExjUKYZlnZBRk9kMNd1kx3Tj
         ZcRl7PzKjjs9nicViW8ITYKvnd+EZVp4hH829GIdJjUq3MFo/CplpNHh04/ZvEcM3HlH
         T5uQ==
X-Gm-Message-State: AOAM5329urg+HUx7DT605NLSK8d3n3O/SrMpl1zKZD6aKeho+LASbJwl
        qILtseg+O5Wrz58I/zJJFx8=
X-Google-Smtp-Source: ABdhPJxH0FUacW/96OqiDqn48v6VceKlvxQOtMlHHK0hOO8Bim7HYtdO8CuIxwiZ1QKO5ZdqDeY8pw==
X-Received: by 2002:ac2:5973:: with SMTP id h19mr3359749lfp.120.1616529461559;
        Tue, 23 Mar 2021 12:57:41 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-60.dynamic.spd-mgts.ru. [109.252.193.60])
        by smtp.googlemail.com with ESMTPSA id k5sm3555ljb.78.2021.03.23.12.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 12:57:41 -0700 (PDT)
Subject: Re: [PATCH v5 00/21] Host1x sync point UAPI should not be used for
 tracking DRM jobs
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>, jonathanh@nvidia.com,
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
 <YFoxxiMGFcSg3kk+@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8ff1a2f1-92bb-861a-31fd-f3af983baff0@gmail.com>
Date:   Tue, 23 Mar 2021 22:57:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFoxxiMGFcSg3kk+@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

23.03.2021 21:21, Thierry Reding пишет:
> On Sat, Feb 27, 2021 at 02:19:39PM +0300, Dmitry Osipenko wrote:
>> 03.02.2021 14:18, Mikko Perttunen пишет:
>> ...
>>>> I'll need more time to think about it.
>>>>
>>>
>>> How about something like this:
>>>
>>> Turn the syncpt_incr field back into an array of structs like
>>>
>>> #define DRM_TEGRA_SUBMIT_SYNCPT_INCR_REPLACE_SYNCOBJ        (1<<0)
>>> #define DRM_TEGRA_SUBMIT_SYNCPT_INCR_PATCH_DYNAMIC_SYNCPT    (1<<1)
>>>
>>> struct drm_tegra_submit_syncpt_incr {
>>>     /* can be left as zero if using dynamic syncpt */
>>>     __u32 syncpt_id;
>>>     __u32 flags;
>>>
>>>     struct {
>>>         __u32 syncobj;
>>>         __u32 value;
>>>     } fence;
>>>
>>>     /* patch word as such:
>>>          * *word = *word | (syncpt_id << shift)
>>>          */
>>>     struct {
>>>         __u32 gather_offset_words;
>>>         __u32 shift;
>>>     } patch;
>>> };
>>>
>>> So this will work similarly to the buffer reloc system; the kernel
>>> driver will allocate a job syncpoint and patch in the syncpoint ID if
>>> requested, and allows outputting syncobjs for each increment.
>>
>> I haven't got any great ideas so far, but it feels that will be easier
>> and cleaner if we could have separate job paths (and job IOCTLS) based
>> on hardware generation since the workloads a too different. The needs of
>> a newer h/w are too obscure for me and absence of userspace code,
>> firmware sources and full h/w documentation do not help.
>>
>> There still should be quite a lot to share, but things like
>> mapping-to-channel and VM sync points are too far away from older h/w,
>> IMO. This means that code path before drm-sched and path for job-timeout
>> handling should be separate.
>>
>> Maybe later on it will become cleaner that we actually could unify it
>> all nicely, but for now it doesn't look like a good idea to me.
> 
> Sorry for jumping in rather randomly here and elsewhere, but it's been a
> long time since the discussion and I just want to share my thoughts on a
> couple of topics in order to hopefully help move this forward somehow.
> 
> For UAPI, "unifying it later" doesn't really work.

Of course I meant a "later version of this series" :) Sorry for not
making it clear.

> So I think the only
> realistic option is to make a best attempt at getting the UABI right so
> that it works for all existing use-cases and ideally perhaps even as of
> yet unknown use-cases in the future. As with all APIs this means that
> there's going to be a need to abstract away some of the hardware details
> so that we don't have to deal with too many low-level details in
> userspace, because otherwise the UAPI is just going to be a useless
> mess.
> 
> I think a proposal such as the above to allow both implicit and explicit
> syncpoints makes sense. For what it's worth, it's fairly similar to what
> we had come up with last time we tried destaging the ABI, although back
> at the time I'm not sure we had even considered explicit syncpoint usage
> yet. I think where reasonably possible this kind of optional behaviour
> is acceptable, but I don't think having two completely separate paths is
> going to help in any way. If anything it's just going to make it more
> difficult to maintain the code and get it to a usable state in the first
> place.
> 
> Like I said elsewhere, the programming model for host1x hasn't changed
> since Tegra20. It's rather evolved and gained a couple more features,
> but that doesn't change anything about how userspace uses it.

Not having a complete control over sync points state is a radical
change, IMO. I prefer not to use this legacy and error-prone way of sync
points handling at least for older h/w where it's possible to do. This
is what downstream driver did 10 years ago and what it still continues
to do. I was very happy to move away from this unnecessary complication
in the experimental grate-kernel driver and I think this will be great
to do in the mainline as well.

The need to map buffers explicitly is also a big difference. The need to
map BO for each channel is a quite big over-complication as we already
found out in the current version of UAPI.

Alright, perhaps the mapping could improved for older userspace if we
will move away from a per-channel contexts to a single DRM context like
I already was suggesting to Mikko before. I.e. instead of mapping BO "to
a channel", we will need to map BO "to h/w clients" within the DRM
context. This should allow older userspace to create a single mapping
for all channels/clients using a single IOCTL and then to have a single
"mapping handle" to care about. Objections?
