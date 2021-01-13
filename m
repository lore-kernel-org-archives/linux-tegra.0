Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4753C433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 13 Jan 2021 18:16:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8598E233ED
	for <linux-tegra@archiver.kernel.org>; Wed, 13 Jan 2021 18:16:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728003AbhAMSQu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 13 Jan 2021 13:16:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727963AbhAMSQu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 13 Jan 2021 13:16:50 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB996C061575
        for <linux-tegra@vger.kernel.org>; Wed, 13 Jan 2021 10:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=fxk8FC/4d2crn+3zm1zGej5xKLXNtBBzyvyv/Y3Jjb8=; b=P29jVlBJb8/tSoZzi9BTOby85f
        bfW7U+7Rk8+3nkjfYlZ+IWGlexj2XIrFSk4RvTlqqlY7opSjxaOVi3odBildZJSYehUIr6qkb70Zq
        c+M3qwENQMKQ+cr1TE6wSHm3SoUDR48RLar8YoFfteoH2my8PQCW1ob/ygZ25fHyb6nShBm9RyiJi
        VFu8Sece24kXgDbYwUl7Mp0xxBZkZ3aLQHIPUv9jsRt9JfmEgVrDNh6e11/hNfGzRPRlLuJT9a8ym
        0tKUKE1F0QT6onXJI+CXzNBsjuty84JiHIRNCM+IkLcwQg3MCE6LansyIbU2iwQiCgwMLKvBI38gy
        S73SNZ/w==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kzkgd-0006bW-Ju; Wed, 13 Jan 2021 20:16:03 +0200
Subject: Re: [PATCH v5 04/21] gpu: host1x: Remove cancelled waiters
 immediately
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-5-mperttunen@nvidia.com>
 <1c2c4a31-68a2-c938-fe65-6059d9889126@gmail.com>
 <1f98ce42-dc6b-299c-f55e-f6dd87b99cab@kapsi.fi>
 <b0a983a1-6379-1a27-5c8d-05fee58e696a@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <0711f02f-8995-50c7-736d-4a8669bad288@kapsi.fi>
Date:   Wed, 13 Jan 2021 20:16:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <b0a983a1-6379-1a27-5c8d-05fee58e696a@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 1/13/21 6:29 PM, Dmitry Osipenko wrote:
> 13.01.2021 01:20, Mikko Perttunen пишет:
>> On 1/13/21 12:07 AM, Dmitry Osipenko wrote:
>>> 11.01.2021 16:00, Mikko Perttunen пишет:
>>>> -void host1x_intr_put_ref(struct host1x *host, unsigned int id, void
>>>> *ref)
>>>> +void host1x_intr_put_ref(struct host1x *host, unsigned int id, void
>>>> *ref,
>>>> +             bool flush)
>>>>    {
>>>>        struct host1x_waitlist *waiter = ref;
>>>>        struct host1x_syncpt *syncpt;
>>>>    -    while (atomic_cmpxchg(&waiter->state, WLS_PENDING,
>>>> WLS_CANCELLED) ==
>>>> -           WLS_REMOVED)
>>>> -        schedule();
>>>> +    atomic_cmpxchg(&waiter->state, WLS_PENDING, WLS_CANCELLED);
>>>>          syncpt = host->syncpt + id;
>>>> -    (void)process_wait_list(host, syncpt,
>>>> -                host1x_syncpt_load(host->syncpt + id));
>>>> +
>>>> +    spin_lock(&syncpt->intr.lock);
>>>> +    if (atomic_cmpxchg(&waiter->state, WLS_CANCELLED, WLS_HANDLED) ==
>>>> +        WLS_CANCELLED) {
>>>> +        list_del(&waiter->list);
>>>> +        kref_put(&waiter->refcount, waiter_release);
>>>> +    }
>>>> +    spin_unlock(&syncpt->intr.lock);
>>>> +
>>>> +    if (flush) {
>>>> +        /* Wait until any concurrently executing handler has
>>>> finished. */
>>>> +        while (atomic_read(&waiter->state) != WLS_HANDLED)
>>>> +            cpu_relax();
>>>> +    }
>>>
>>> A busy-loop shouldn't be used in kernel unless there is a very good
>>> reason. The wait_event() should be used instead.
>>>
>>> But please don't hurry to update this patch, we may need or want to
>>> retire the host1x-waiter and then these all waiter-related patches won't
>>> be needed.
>>>
>>
>> Yes, we should improve the intr code to remove all this complexity. But
>> let's merge this first to get a functional baseline and do larger design
>> changes in follow-up patches.
>>
>> It is cumbersome for me to develop further series (of which I have
>> several under work and planning) with this baseline series not being
>> merged. The uncertainty on the approval of the UAPI design also makes it
>> hard to know whether it makes sense for me to work on top of this code
>> or not, so I'd like to focus on what's needed to get this merged instead
>> of further redesign of the driver at this time.
> 
> Is this patch (and some others) necessary for the new UAPI? If not,
> could we please narrow down the patches to the minimum that is needed
> for trying out the new UAPI?
> 

Yes, it is necessary. I tried to revert it and half the tests in the 
test suite start failing.

I think patches 01, 03, 14 and 17 are not strictly required, though 
reverting 03 will cause one of the syncpoint tests to fail.

Mikko
