Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED288C433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 01:36:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE0C46192F
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 01:36:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbhC3Bfy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Mar 2021 21:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbhC3Bfd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Mar 2021 21:35:33 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41BCCC061762
        for <linux-tegra@vger.kernel.org>; Mon, 29 Mar 2021 18:35:33 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id i26so21217710lfl.1
        for <linux-tegra@vger.kernel.org>; Mon, 29 Mar 2021 18:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Hiy6UNJN0YHXvtXf2RTNPSnxeoyRk4X1aAuheB2Dr5E=;
        b=NNoMRRGPR1bwyY57kZds3PVVU7DWmnxGAm5leFcAhOOItqurIcvgpKwUukrlcZMxSu
         lQ0RohRRqjw83qVZNasMp6fqQHz/JuxOwsHwGwkbGhl37Bki4wid39TZPJWXi5vwvpsJ
         dPotnYsE470awS14ywhPHGpfDEETBQ03luxZ1YF5ebuFQ1RAbk3T92dXQg2UUDKzmXSn
         7HUyLCEtuZ5CtCmVIzRTKNvMnVXqb/K9T0fDLO7ozyBHkEaaN5c/NyKRX+DuvzHLtZ1A
         1mPo0/nw9Q5lBDJ/vnuuL/06Jokw8Zzm4EVwZ4xm0XLke8UgXzx5OxUJ/nKUUlRqJ38z
         hIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Hiy6UNJN0YHXvtXf2RTNPSnxeoyRk4X1aAuheB2Dr5E=;
        b=S5DNkOEFzo56zB0k6gLcn9XpeEO2X7us7tmwhGbWY6rIfR63Ai4UkY3umbx0k8Cjtb
         K+qBvBR74G0KjJpQbs5/37OH18tHbd/+Rw7wxNGXxYigBYpbxj5u3HezAM46CMlezFL0
         gjQ5kYo771w71tULGcGpRZh0VhB39nrGeQh7WnWJPB7c9gats/VjppxwoiGbFZ4da4Pn
         LSeLuxCGNqLUP0jcTiajhpJ8VAW2WyCpANw5IiMteXz+8TV+d7zH33Qwgcy0A9kHFNcv
         WBRiMWJLwpvGKqlC8Wvi7LITbNhUrXiHFnjEcC+BnGJAfTE6AJ5u6KZXJE1Kv+oMfgmm
         a7nA==
X-Gm-Message-State: AOAM532+YeJRZmH6ybMNtHmL30rFPq7FvQER6zyokL8EqX2dqY/cAK0B
        HsF4ubLCwVBM/oN3Vidx5G8077gOSw8=
X-Google-Smtp-Source: ABdhPJwHUzCipo12Iw72jKeuOGOEqVdvUWcRYdHnQK67ozW++GZK5/RCTHnrODKJpBEab6+58NOu1Q==
X-Received: by 2002:ac2:41c4:: with SMTP id d4mr17436725lfi.334.1617068131820;
        Mon, 29 Mar 2021 18:35:31 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-98.dynamic.spd-mgts.ru. [109.252.193.98])
        by smtp.googlemail.com with ESMTPSA id j27sm2011190lfp.186.2021.03.29.18.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Mar 2021 18:35:31 -0700 (PDT)
Subject: Re: [PATCH v6 04/10] gpu: host1x: Remove cancelled waiters
 immediately
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20210329133836.2115236-1-mperttunen@nvidia.com>
 <20210329133836.2115236-5-mperttunen@nvidia.com>
 <85ddc9a2-1355-1e3b-f164-f907c7fdb67c@gmail.com>
 <2b4342c4-ad68-5118-2887-351a62dee400@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5cc4657d-e365-5b56-8108-7bf97b63c26b@gmail.com>
Date:   Tue, 30 Mar 2021 04:35:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <2b4342c4-ad68-5118-2887-351a62dee400@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.03.2021 00:36, Mikko Perttunen пишет:
> On 3/29/21 11:27 PM, Dmitry Osipenko wrote:
>> 29.03.2021 16:38, Mikko Perttunen пишет:
>>> Before this patch, cancelled waiters would only be cleaned up
>>> once their threshold value was reached. Make host1x_intr_put_ref
>>> process the cancellation immediately to fix this.
>>>
>>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>>> ---
>>> v6:
>>> * Call schedule instead of cpu_relax while waiting for pending
>>>    interrupt processing
>>> v5:
>>> * Add parameter to flush, i.e. wait for all pending waiters to
>>>    complete before returning. The reason this is not always true
>>>    is that the pending waiter might be the place that is calling
>>>    the put_ref.
>>> ---
>>>   drivers/gpu/host1x/intr.c   | 23 +++++++++++++++++------
>>>   drivers/gpu/host1x/intr.h   |  4 +++-
>>>   drivers/gpu/host1x/syncpt.c |  2 +-
>>>   3 files changed, 21 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/host1x/intr.c b/drivers/gpu/host1x/intr.c
>>> index 9245add23b5d..69b0e8e41466 100644
>>> --- a/drivers/gpu/host1x/intr.c
>>> +++ b/drivers/gpu/host1x/intr.c
>>> @@ -242,18 +242,29 @@ int host1x_intr_add_action(struct host1x *host,
>>> struct host1x_syncpt *syncpt,
>>>       return 0;
>>>   }
>>>   -void host1x_intr_put_ref(struct host1x *host, unsigned int id,
>>> void *ref)
>>> +void host1x_intr_put_ref(struct host1x *host, unsigned int id, void
>>> *ref,
>>> +             bool flush)
>>>   {
>>>       struct host1x_waitlist *waiter = ref;
>>>       struct host1x_syncpt *syncpt;
>>>   -    while (atomic_cmpxchg(&waiter->state, WLS_PENDING,
>>> WLS_CANCELLED) ==
>>> -           WLS_REMOVED)
>>> -        schedule();
>>> +    atomic_cmpxchg(&waiter->state, WLS_PENDING, WLS_CANCELLED);
>>>         syncpt = host->syncpt + id;
>>> -    (void)process_wait_list(host, syncpt,
>>> -                host1x_syncpt_load(host->syncpt + id));
>>> +
>>> +    spin_lock(&syncpt->intr.lock);
>>> +    if (atomic_cmpxchg(&waiter->state, WLS_CANCELLED, WLS_HANDLED) ==
>>> +        WLS_CANCELLED) {
>>> +        list_del(&waiter->list);
>>> +        kref_put(&waiter->refcount, waiter_release);
>>> +    }
>>> +    spin_unlock(&syncpt->intr.lock);
>>
>> Looks like we need to use IRQ-safe version of the locking here in order
>> not to race with the interrupt handler(?), preventing lockup.
> 
> The potential contention is with the syncpt_thresh_work scheduled work,
> and not the actual interrupt handler, so there is no issue.

I see now, thanks.

>> But what real bug is fixed by this patch? If no real problem is fixed,
>> then maybe will be better to defer touching this code till we will just
>> replace it all with a proper dma-fence handlers?
>>
> 
> It improves things in that we won't litter the waiter data structures
> with unbounded waiter entries when waits are cancelled. Also, I prefer
> working in steps when possible - next is writing dma_fences on top of
> this (which is already done) and then eventually phasing/refactoring
> code from intr.c to fence.c so eventually only dma_fences remain. In my
> experience that works better than big rewrites.

So this change is a cleanup and not a bugfix, which wasn't clear from
the commit description. In my experience it usually tends to help with a
review if commit message explicitly states whether it is a minor cleanup
or a critical bugfix.

The small cleanups should be okay. It could be better if you could
explicitly separate the fixes from cleanups since there is a better
chance that fixes will be picked up immediately.

I'd also suggest to try to group the cleanup changes with the new
features that benefit from them, where possible. This should make
patches to look more logical, not like it's some random change, helping
with a review.

I'll try to give a test to this series later today.
