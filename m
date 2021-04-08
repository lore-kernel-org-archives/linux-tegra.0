Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 605D1C43460
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Apr 2021 11:58:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C9C461158
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Apr 2021 11:58:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbhDHL6i (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Apr 2021 07:58:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbhDHL6h (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Apr 2021 07:58:37 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A50F7C061760
        for <linux-tegra@vger.kernel.org>; Thu,  8 Apr 2021 04:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=qMgn177aesAtlSMhvUPpX/Y2rtDuUrc1ktn0cuDjE5E=; b=shs0dJydx8mseb+Qghv9MkY4lW
        kyOZ/gwVMd8y+nlrF8KmGHncYQhYqoYcqmJG5N/hhoK7yXLoVB6mF5T+prcjk8V0A1anuuhIGKCig
        IM0i2cK858PY/m7aO1xuZ8Gtr2U3TITKEMrnh84VSebTh0/sc3dyxlqxe2Np3AqYqZCWrEV/hIuUC
        kFZfRPgbjUCxAHfXSi0/Fu4cgV1nSqmjn1wMhorpc74tALCufUskU4n9K3UDJ3hArpL3BuuFJxNLS
        2Yy0JitxFNwEBqHWVbzZ13rfXvhbwBSot+HyHYYeSNBaTrDyjrx6sgU2Wt0SoKvX04+3XkNlwvn5Q
        A1Q0IdPw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1lUTIe-0003sm-Fg; Thu, 08 Apr 2021 14:58:16 +0300
Subject: Re: [PATCH v5 03/21] gpu: host1x: Show number of pending waiters in
 debugfs
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>, jonathanh@nvidia.com,
        airlied@linux.ie, daniel@ffwll.ch, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, talho@nvidia.com,
        bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-4-mperttunen@nvidia.com>
 <YFm/431gaaP6wY1A@orome.fritz.box>
 <1010683e-56c9-4b06-1540-d8c60a632c70@kapsi.fi>
 <20210401211949.GA25223@qmqm.qmqm.pl>
 <7636618d-72f7-ee0f-df23-1f2ec96973b4@gmail.com>
 <20210408041344.GB19244@qmqm.qmqm.pl> <20210408042531.GC19244@qmqm.qmqm.pl>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <0c3db818-5c1f-0c7a-0937-2619997a8852@kapsi.fi>
Date:   Thu, 8 Apr 2021 14:58:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210408042531.GC19244@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 4/8/21 7:25 AM, Michał Mirosław wrote:
> On Thu, Apr 08, 2021 at 06:13:44AM +0200, Michał Mirosław wrote:
>> On Fri, Apr 02, 2021 at 07:02:32PM +0300, Dmitry Osipenko wrote:
>>> 02.04.2021 00:19, Michał Mirosław пишет:
>>>> On Fri, Mar 26, 2021 at 04:34:13PM +0200, Mikko Perttunen wrote:
>>>>> On 3/23/21 12:16 PM, Thierry Reding wrote:
>>>>>> On Mon, Jan 11, 2021 at 03:00:01PM +0200, Mikko Perttunen wrote:
>>>>>>> Show the number of pending waiters in the debugfs status file.
>>>>>>> This is useful for testing to verify that waiters do not leak
>>>>>>> or accumulate incorrectly.
>>>>>>>
>>>>>>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/host1x/debug.c | 14 +++++++++++---
>>>>>>>    1 file changed, 11 insertions(+), 3 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/host1x/debug.c b/drivers/gpu/host1x/debug.c
>>>>>>> index 1b4997bda1c7..8a14880c61bb 100644
>>>>>>> --- a/drivers/gpu/host1x/debug.c
>>>>>>> +++ b/drivers/gpu/host1x/debug.c
>>>>>>> @@ -69,6 +69,7 @@ static int show_channel(struct host1x_channel *ch, void *data, bool show_fifo)
>>>>>>>    static void show_syncpts(struct host1x *m, struct output *o)
>>>>>>>    {
>>>>>>> +	struct list_head *pos;
>>>>>>>    	unsigned int i;
>>>>>>>    	host1x_debug_output(o, "---- syncpts ----\n");
>>>>>>> @@ -76,12 +77,19 @@ static void show_syncpts(struct host1x *m, struct output *o)
>>>>>>>    	for (i = 0; i < host1x_syncpt_nb_pts(m); i++) {
>>>>>>>    		u32 max = host1x_syncpt_read_max(m->syncpt + i);
>>>>>>>    		u32 min = host1x_syncpt_load(m->syncpt + i);
>>>>>>> +		unsigned int waiters = 0;
>>>>>>> -		if (!min && !max)
>>>>>>> +		spin_lock(&m->syncpt[i].intr.lock);
>>>>>>> +		list_for_each(pos, &m->syncpt[i].intr.wait_head)
>>>>>>> +			waiters++;
>>>>>>> +		spin_unlock(&m->syncpt[i].intr.lock);
>>>>>>
>>>>>> Would it make sense to keep a running count so that we don't have to
>>>>>> compute it here?
>>>>>
>>>>> Considering this is just a debug facility, I think I prefer not adding a new
>>>>> field just for it.
>>>>
>>>> This looks like IRQ-disabled region, so unless only root can trigger
>>>> this code, maybe the additional field could save a potential headache?
>>>> How many waiters can there be in the worst case?
>>>
>>> The host1x's IRQ handler runs in a workqueue, so it should be okay.
>>
>> Why, then, this uses a spinlock (and it has 'intr' in its name)?
> 
> The critical sections are already O(n) in number of waiters, so this
> patch doesn't make things worse as I previously thought. The questions
> remain: What is the expected number and upper bound of workers?
> Shouldn't this be a mutex instead?

Everything is primarily for historical reasons. The name 'intr' is 
because this is in the part of the host1x driver that handles syncpoint 
threshold interrupts - just some of it is in interrupt context and some not.

In any case, this code is scheduled for a complete redesign once we get 
the UAPI changes done. I'll take this into account at that point.

Cheers,
Mikko

> 
> Best Regards
> Michał Mirosław
> 
