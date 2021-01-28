Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD29C433DB
	for <linux-tegra@archiver.kernel.org>; Thu, 28 Jan 2021 11:47:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C357C64DDB
	for <linux-tegra@archiver.kernel.org>; Thu, 28 Jan 2021 11:47:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbhA1Lrc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 28 Jan 2021 06:47:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbhA1Lrb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 28 Jan 2021 06:47:31 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C728C061573
        for <linux-tegra@vger.kernel.org>; Thu, 28 Jan 2021 03:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=dCyaZBCtvjV1qTeH92823cziiRnr3JFyyEXR29NWh0Q=; b=jxJOoaJh+F/a/xzG22iFj0HTkA
        vVal6qmTshH4Pb4FvhFDfOY7cYfdeWzvC7u6hAFAveGa34W/AvrJzk+fcAe6doQpq9n+N8inu1iEe
        6/MWhxoHfYE25LzF/sU7GhbjG+VcKgbc5US9bdqme4gBxFGQ6znE2PlU22GjBdDb60ZRXwwyejGmc
        qcWSuhiLB8Rf2u6J/p2eO08vuh+fl8QAGTeDwrF0T4AOuUGaqBKwPLWVeusyf/wVOEl1lSxUWXJhp
        34G4h1H3XEPWbgEPDzNp3CdnH8624fFqF9NBm6DH7+7AeRS/uB8Mj1a7XxUdNpMoXX307+B7VozLc
        ucHRN+ew==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1l55l8-0006i2-Pw; Thu, 28 Jan 2021 13:46:46 +0200
Subject: Re: [PATCH v5 00/21] Host1x/TegraDRM UAPI
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
 <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
 <638c1aeb-921b-0ea2-5258-16c6d3183306@gmail.com>
 <9f755e95-97fc-4f57-5e8d-426af589c857@kapsi.fi>
 <007d123f-526a-c68a-3c52-aba165172cdf@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <dcec75d6-3aeb-f4ea-ad11-815ee56b384f@kapsi.fi>
Date:   Thu, 28 Jan 2021 13:46:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <007d123f-526a-c68a-3c52-aba165172cdf@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 1/28/21 12:06 AM, Dmitry Osipenko wrote:
> 28.01.2021 00:57, Mikko Perttunen пишет:
>>
>>
>> On 1/27/21 11:26 PM, Dmitry Osipenko wrote:
>>> 26.01.2021 05:45, Mikko Perttunen пишет:
>>>>> 5. The hardware state of sync points should be reset when sync point is
>>>>> requested, not when host1x driver is initialized.
>>>>
>>>> This may be doable, but I don't think it is critical for this UAPI, so
>>>> let's consider it after this series.
>>>>
>>>> The userspace should anyway not be able to assume the initial value of
>>>> the syncpoint upon allocation. The kernel should set it to some high
>>>> value to catch any issues related to wraparound.
>>>
>>> This is critical because min != max when sync point is requested.
>>
>> That I would just consider a bug, and it can be fixed. But it's
>> orthogonal to whether the value gets reset every time the syncpoint is
>> allocated.
>>
>>>
>>>> Also, this makes code more complicated since it now needs to ensure all
>>>> waits on the syncpoint have completed before freeing the syncpoint,
>>>> which can be nontrivial e.g. if the waiter is in a different virtual
>>>> machine or some other device connected via PCIe (a real usecase).
>>>
>>> It sounds to me that these VM sync points should be treated very
>>> separately from a generic sync points, don't you think so? Let's not mix
>>> them and get the generic sync points usable first.
>>>
>>
>> They are not special in any way, I'm just referring to cases where the
>> waiter (consumer) is remote. The allocator of the syncpoint (producer)
>> doesn't necessarily even need to know about it. The same concern is
>> applicable within a single VM, or single application as well. Just
>> putting out the point that this is something that needs to be taken care
>> of if we were to reset the value.
> 
> Will kernel driver know that it deals with a VM sync point? >
> Will it be possible to get a non-VM sync point explicitly?
> 
> If driver knows that it deals with a VM sync point, then we can treat it
> specially, avoiding the reset and etc.
> 

There is no distinction between a "VM syncpoint" and a "non-VM 
syncpoint". To provide an example on the issue, consider we have VM1 and 
VM2. VM1 is running some camera software that produces frames. VM2 runs 
some analysis software that consumes those frames through shared memory. 
In between there is some software that takes the postfences of the 
camera software and transmits them to the analysis software to be used 
as prefences. Only this transmitting software needs to know anything 
about multiple VMs being in use.

At any time, if we want to reset the value of the syncpoint in question, 
we must ensure that all fences waiting on that syncpoint have observed 
the fence's threshold first.

Consider an interleaving like this:

VM1 (Camera)				VM2 (Analysis)
-------------------------------------------------------
Send postfence (threshold=X)
					Recv postfence (threshold=X)
Increment syncpoint value to X
Free syncpoint
Reset syncpoint value to Y
					Wait on postfence
-------------------------------------------------------

Now depending on the relative values of X and Y, either VM2 progresses 
(correctly), or gets stuck. If we didn't reset the syncpoint, the race 
could not occur (unless VM1 managed to increment the syncpoint 2^31 
times before VM2's wait starts, which is very unrealistic).

We can remove "VM1" and "VM2" everywhere here, and just consider two 
applications in one VM, too, or two parts of one application. Within one 
VM the issue is of course easier because the driver can have knowledge 
about fences and solve the race internally, but I'd always prefer not 
having such special cases.

Now, admittedly this is probably not a huge problem unless we are 
freeing syncpoints all the time, but nevertheless something to consider.

Mikko
