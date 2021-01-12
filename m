Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E71C433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 22:23:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B358A2312A
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 22:23:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391776AbhALWWq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jan 2021 17:22:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404787AbhALWV0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 17:21:26 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFEAEC061795
        for <linux-tegra@vger.kernel.org>; Tue, 12 Jan 2021 14:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=V94ogXIZBF2XJYNvk89lShmRj0frGCY/ix5JRIAL8RY=; b=Kfw6cMPL9TnBbkksgk9/ZlWsQ6
        pVtXM+G6YCyPSI5Jw1U+DV4Ib8CiPibF0wft17GlU7EDjY0NHIISU4x7J8ojOlmY4jqgq+K80j0pi
        DI4I9easErv/PehZL08pUuCPzvW2GXyFha6/A7Jevl0m8DaJ2gzUwxa5HM3wViCPtPWmwbRxvZdtz
        77bTQSfrLY2LIf7GgzjVfi0sKzBIZElr9Y5iDCNWXSpi2YpiZfsWCc7euALgKjLzZ7xPYoO2ZFzVb
        SUDPNV1s3GIA9SASzKZH9ovej1SdDvu0H4klXTZzBV3vlRt+uUZkRcJ2H1RqmNNhjH7HJCqQY6egI
        wSPcEubA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kzS1n-0008QT-JS; Wed, 13 Jan 2021 00:20:39 +0200
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
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <1f98ce42-dc6b-299c-f55e-f6dd87b99cab@kapsi.fi>
Date:   Wed, 13 Jan 2021 00:20:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1c2c4a31-68a2-c938-fe65-6059d9889126@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 1/13/21 12:07 AM, Dmitry Osipenko wrote:
> 11.01.2021 16:00, Mikko Perttunen пишет:
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
>> +
>> +	if (flush) {
>> +		/* Wait until any concurrently executing handler has finished. */
>> +		while (atomic_read(&waiter->state) != WLS_HANDLED)
>> +			cpu_relax();
>> +	}
> 
> A busy-loop shouldn't be used in kernel unless there is a very good
> reason. The wait_event() should be used instead.
> 
> But please don't hurry to update this patch, we may need or want to
> retire the host1x-waiter and then these all waiter-related patches won't
> be needed.
> 

Yes, we should improve the intr code to remove all this complexity. But 
let's merge this first to get a functional baseline and do larger design 
changes in follow-up patches.

It is cumbersome for me to develop further series (of which I have 
several under work and planning) with this baseline series not being 
merged. The uncertainty on the approval of the UAPI design also makes it 
hard to know whether it makes sense for me to work on top of this code 
or not, so I'd like to focus on what's needed to get this merged instead 
of further redesign of the driver at this time.

Mikko
