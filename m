Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C925CC433E0
	for <linux-tegra@archiver.kernel.org>; Sat, 27 Feb 2021 11:20:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 819CE64ECE
	for <linux-tegra@archiver.kernel.org>; Sat, 27 Feb 2021 11:20:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbhB0LUY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 27 Feb 2021 06:20:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbhB0LUX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 27 Feb 2021 06:20:23 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CF82C06174A
        for <linux-tegra@vger.kernel.org>; Sat, 27 Feb 2021 03:19:42 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id k12so4605393ljg.9
        for <linux-tegra@vger.kernel.org>; Sat, 27 Feb 2021 03:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/d5QFUwffS7DjVuIPYL6LkLQZXdrK9GI/3+UWs6cvL4=;
        b=YS42gCZLxNrQOhzB1b5gSk2CnLNxGXwPJGTpnnOEcfVxpdzDysCckGbqra+oX1ory6
         DJVGo0MfF2rljHCdVfD/x40M8Aw0I5B3ejIt9nJN1q0o+bNqbnXE9kb696cUcIHIOpro
         kkVCLC5tA/hA0w4+WrDWyfxbd1oie5smnB+YebqKBwmyPNrEpAtGVSHE1Fr+lSxxqX6i
         UlznB1i5OC7QzGtjlpM57amSXFcybHe72eyZ1F9oLImnHudz09h4Mf0wspVlDzdtBnzy
         TdJCVus5Wsy9A8fXxdyo2rXHPfaVKd56Vue5QylPDI3SLnmXjZNCrTVEYFuo9FNMAs1T
         8d2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/d5QFUwffS7DjVuIPYL6LkLQZXdrK9GI/3+UWs6cvL4=;
        b=pAO08EGiopOJc9G6BoXxoOC7fjZ3fpn1xlDRb2WOTy8AnQ+c6z9YlsnosIObK8NnQE
         qHkaU+G95rZiXf1KQh4tWyNQBYUoclxFn4y6lXWlg2sdt34irm8juT4Lf/QDGoSCj2a/
         QJUTb/GmjIc9x7vmT2moaOFlK/GmEo4hBdrnd8gZyG3u/WYBsi4A9WpZR5e4boIMGEuV
         WiDlevSYJbY5O5xueCyfPDMf/aM9OLGCnWJQGufbI6VhhpC0Fpdpsbrzkj/Pp6GZdIQS
         lJfVjoRJ5Fn3clX0O/wkwXCC/fQ8gp0OGL1l0mHLX1hbJEqqXLAKD0YzxL8my6aPH069
         wrww==
X-Gm-Message-State: AOAM531ZVNe4TSmyW6YDTOdAzt5P76XXQUmuZ7YmNPRFfhAfjpXjVJ2w
        1GOWxrNNjMPw8u9C83rbYe0=
X-Google-Smtp-Source: ABdhPJxa0JcEKkj91kpfBL/1yGNqTXrO1S6EcUGsfY+uAXnLfNf8kiWck9neSM/TiLgHtR+YFpDxWQ==
X-Received: by 2002:a2e:b534:: with SMTP id z20mr4244137ljm.50.1614424780761;
        Sat, 27 Feb 2021 03:19:40 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id x25sm1710720lfn.180.2021.02.27.03.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Feb 2021 03:19:40 -0800 (PST)
Subject: Re: [PATCH v5 00/21] Host1x sync point UAPI should not be used for
 tracking DRM jobs
To:     Mikko Perttunen <cyndis@kapsi.fi>,
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6211ee04-ebd6-74d3-cb5b-955b17acff5b@gmail.com>
Date:   Sat, 27 Feb 2021 14:19:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <25248139-5487-a15b-8965-1a29a71eacd7@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

03.02.2021 14:18, Mikko Perttunen пишет:
...
>> I'll need more time to think about it.
>>
> 
> How about something like this:
> 
> Turn the syncpt_incr field back into an array of structs like
> 
> #define DRM_TEGRA_SUBMIT_SYNCPT_INCR_REPLACE_SYNCOBJ        (1<<0)
> #define DRM_TEGRA_SUBMIT_SYNCPT_INCR_PATCH_DYNAMIC_SYNCPT    (1<<1)
> 
> struct drm_tegra_submit_syncpt_incr {
>     /* can be left as zero if using dynamic syncpt */
>     __u32 syncpt_id;
>     __u32 flags;
> 
>     struct {
>         __u32 syncobj;
>         __u32 value;
>     } fence;
> 
>     /* patch word as such:
>          * *word = *word | (syncpt_id << shift)
>          */
>     struct {
>         __u32 gather_offset_words;
>         __u32 shift;
>     } patch;
> };
> 
> So this will work similarly to the buffer reloc system; the kernel
> driver will allocate a job syncpoint and patch in the syncpoint ID if
> requested, and allows outputting syncobjs for each increment.

I haven't got any great ideas so far, but it feels that will be easier
and cleaner if we could have separate job paths (and job IOCTLS) based
on hardware generation since the workloads a too different. The needs of
a newer h/w are too obscure for me and absence of userspace code,
firmware sources and full h/w documentation do not help.

There still should be quite a lot to share, but things like
mapping-to-channel and VM sync points are too far away from older h/w,
IMO. This means that code path before drm-sched and path for job-timeout
handling should be separate.

Maybe later on it will become cleaner that we actually could unify it
all nicely, but for now it doesn't look like a good idea to me.

Mikko, do you have any objections to trying out variant with the
separate paths?
