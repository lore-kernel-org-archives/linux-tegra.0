Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D67BCC433C1
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 21:37:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC2BA61988
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 21:37:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231421AbhC2Vgr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Mar 2021 17:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230381AbhC2VgS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Mar 2021 17:36:18 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CB12C061574
        for <linux-tegra@vger.kernel.org>; Mon, 29 Mar 2021 14:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Wy22N1jF4sTNLDcBhxcpPYwRlOEwjfqWBMSTIw0JZu8=; b=1p18iyOCT1MSwqxm/3/f8vPnjH
        I1epAs2IfB4Q7/GjpsJq1QZVw+5mVk6ICCeCOe9kLSxWoCxssTqrZ1eNf6Z4RouiAbryLcB9X9Jho
        gdjhFTGfhN1fhiBtQqrwuybCtGzUM6WkouhRyft6BzTOsGtP3kUpMwFPMigiXAkI3kgX2ldPRGdGU
        TGSdGs07ItRI3YTgaCOm7fppKDth6f9GI5m6iSPqx8nsI1gr/2MzGgUbGfXnpvDA0p8XvbuqnTfDN
        tA8Qf03V9Thazl6S6D8O/liFIwaZA9GwBI5q1WjFIKy+Sh4Jw2VYBquqK1cVmXRGNBjyLhQB8W3fY
        KLJ7ZHvw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1lQzYU-0001ey-NG; Tue, 30 Mar 2021 00:36:14 +0300
Subject: Re: [PATCH v6 04/10] gpu: host1x: Remove cancelled waiters
 immediately
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20210329133836.2115236-1-mperttunen@nvidia.com>
 <20210329133836.2115236-5-mperttunen@nvidia.com>
 <85ddc9a2-1355-1e3b-f164-f907c7fdb67c@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <2b4342c4-ad68-5118-2887-351a62dee400@kapsi.fi>
Date:   Tue, 30 Mar 2021 00:36:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <85ddc9a2-1355-1e3b-f164-f907c7fdb67c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 3/29/21 11:27 PM, Dmitry Osipenko wrote:
> 29.03.2021 16:38, Mikko Perttunen пишет:
>> Before this patch, cancelled waiters would only be cleaned up
>> once their threshold value was reached. Make host1x_intr_put_ref
>> process the cancellation immediately to fix this.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>> v6:
>> * Call schedule instead of cpu_relax while waiting for pending
>>    interrupt processing
>> v5:
>> * Add parameter to flush, i.e. wait for all pending waiters to
>>    complete before returning. The reason this is not always true
>>    is that the pending waiter might be the place that is calling
>>    the put_ref.
>> ---
>>   drivers/gpu/host1x/intr.c   | 23 +++++++++++++++++------
>>   drivers/gpu/host1x/intr.h   |  4 +++-
>>   drivers/gpu/host1x/syncpt.c |  2 +-
>>   3 files changed, 21 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/host1x/intr.c b/drivers/gpu/host1x/intr.c
>> index 9245add23b5d..69b0e8e41466 100644
>> --- a/drivers/gpu/host1x/intr.c
>> +++ b/drivers/gpu/host1x/intr.c
>> @@ -242,18 +242,29 @@ int host1x_intr_add_action(struct host1x *host, struct host1x_syncpt *syncpt,
>>   	return 0;
>>   }
>>   
>> -void host1x_intr_put_ref(struct host1x *host, unsigned int id, void *ref)
>> +void host1x_intr_put_ref(struct host1x *host, unsigned int id, void *ref,
>> +			 bool flush)
>>   {
>>   	struct host1x_waitlist *waiter = ref;
>>   	struct host1x_syncpt *syncpt;
>>   
>> -	while (atomic_cmpxchg(&waiter->state, WLS_PENDING, WLS_CANCELLED) ==
>> -	       WLS_REMOVED)
>> -		schedule();
>> +	atomic_cmpxchg(&waiter->state, WLS_PENDING, WLS_CANCELLED);
>>   
>>   	syncpt = host->syncpt + id;
>> -	(void)process_wait_list(host, syncpt,
>> -				host1x_syncpt_load(host->syncpt + id));
>> +
>> +	spin_lock(&syncpt->intr.lock);
>> +	if (atomic_cmpxchg(&waiter->state, WLS_CANCELLED, WLS_HANDLED) ==
>> +	    WLS_CANCELLED) {
>> +		list_del(&waiter->list);
>> +		kref_put(&waiter->refcount, waiter_release);
>> +	}
>> +	spin_unlock(&syncpt->intr.lock);
> 
> Looks like we need to use IRQ-safe version of the locking here in order
> not to race with the interrupt handler(?), preventing lockup.

The potential contention is with the syncpt_thresh_work scheduled work, 
and not the actual interrupt handler, so there is no issue.

> 
> But what real bug is fixed by this patch? If no real problem is fixed,
> then maybe will be better to defer touching this code till we will just
> replace it all with a proper dma-fence handlers?
> 

It improves things in that we won't litter the waiter data structures 
with unbounded waiter entries when waits are cancelled. Also, I prefer 
working in steps when possible - next is writing dma_fences on top of 
this (which is already done) and then eventually phasing/refactoring 
code from intr.c to fence.c so eventually only dma_fences remain. In my 
experience that works better than big rewrites.

Mikko
