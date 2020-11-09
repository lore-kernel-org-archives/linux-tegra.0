Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A6A2C4741F
	for <linux-tegra@archiver.kernel.org>; Mon,  9 Nov 2020 14:53:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A71F20897
	for <linux-tegra@archiver.kernel.org>; Mon,  9 Nov 2020 14:53:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="o3+wNbX+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730637AbgKIOxM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 9 Nov 2020 09:53:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730294AbgKIOxM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 9 Nov 2020 09:53:12 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D511C0613CF
        for <linux-tegra@vger.kernel.org>; Mon,  9 Nov 2020 06:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=mpS3Z0/kGKvKG810AuErEnu9AtmI1aSOA1lhKgw6pw4=; b=o3+wNbX+YpSOLEOLrqrzm4qhvi
        MQYgQMPoFWYIM7W4vK7lUi937ajrFb7qLspP6lEdIlFx1JThM7B9q6zSQ1Ps73lLLPwNw7D8SQVDw
        DCN36un56hbWG6mEt4kc4cgDbmXqvLeLqYSlyicr/ijZzKd04X1aKlUiFoJw8JxTJgOsnOQ8Ae1aY
        ex28pXk4ViRFQRG4KVDX0hQKSEIJ+N0lIu7ADzyzx0jVvabfcL1qtj71cMwP6AMDj/DFctBU4abtn
        cnE8+L4NgxN+2pl0aEP6heboRjtHdi4QOXQwerjyMi0l8O/uYYjiTabnGMKcDkDchnBeypR0uSITn
        N7FOOSPA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kc8XY-0007Tq-EV; Mon, 09 Nov 2020 16:53:04 +0200
Subject: Re: [PATCH v3 19/20] drm/tegra: Implement new UAPI
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
 <20201007171238.1795964-20-mperttunen@nvidia.com>
 <dd13ec2c-1e01-ca61-656c-b23b156b100f@gmail.com>
 <b33a5084-7dc3-a865-2f36-274ecebf2ee7@kapsi.fi>
 <1f3267a9-37b4-2cff-08a2-2ca7c905ce01@gmail.com>
 <6a7b4d4e-8d4a-416e-9789-45282b44bce5@kapsi.fi>
 <48f5bbac-3955-c227-dbe1-d987b4ec5bd0@gmail.com>
 <414b4943-265d-3735-c115-d54469018d8c@kapsi.fi>
 <e8afd710-de37-f1c5-f61c-ed97c07370bf@gmail.com>
 <6ef6337d-3bb5-bbba-f39c-6de1722ddc44@kapsi.fi>
 <0f1c8226-4960-aa35-9436-2361fc8fb6ae@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <6aad99a9-a9a2-498b-9834-9314a6fa9af6@kapsi.fi>
Date:   Mon, 9 Nov 2020 16:53:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0f1c8226-4960-aa35-9436-2361fc8fb6ae@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 10/31/20 1:13 AM, Dmitry Osipenko wrote:
> 28.10.2020 12:54, Mikko Perttunen пишет:
>> On 10/27/20 9:06 PM, Dmitry Osipenko wrote:
>>> 26.10.2020 12:11, Mikko Perttunen пишет:
>>>>>
>>>>> The first patches should be the ones that are relevant to the existing
>>>>> userspace code, like support for the waits.
>>>>
>>>> Can you elaborate what you mean by this?
>>>
>>> All features that don't have an immediate real use-case should be placed
>>> later in the series because we may defer merging of those patches until
>>> we will see userspace that uses those features since we can't really
>>> decide whether these are decisions that we won't regret later on, only
>>> practical application can confirm the correctness.
>>
>> I was more referring to the "support for waits" part, should have
>> clarified that.
> 
> The "support for waits" is support for the WAIT_SYNCPT command exposed
> to userspace, which we could utilize right now.
> 
>>>>> Partial mappings should be a separate feature because it's a
>>>>> questionable feature that needs to be proved by a real userspace first.
>>>>> Maybe it would be even better to drop it for the starter, to ease
>>>>> reviewing.
>>>>
>>>> Considering that the "no-op" support for it (map the whole buffer but
>>>> just keep track of the starting offset) is only a couple of lines, I'd
>>>> like to keep it in.
>>>
>>> There is no tracking in the current code which prevents the duplicated
>>> mappings, will we need to care about it? This a bit too questionable
>>> feature for now, IMO. I'd like to see it as a separate patch.
>>
>> I don't think there is any need to special case duplicated mappings. I
>> think this is a pretty obvious feature to have, but I can rename them to
>> reserved0 and reserved1 and require that reserved0 is zero and reserved1
>> is the size of the passed GEM object.
> 
> I'm now concerned about the reserved fields after seeing this reply from
> Daniel Vetter:
> 
> https://www.mail-archive.com/nouveau@lists.freedesktop.org/msg36324.html
> 
> If DRM IOCTL structs are zero-extended, then perhaps we won't need to
> reserve anything?

I guess for the channel_map we can drop the offset/length, I just think 
it's fairly obvious that an IOMMU mapping API lets you specify from 
where and how much you want to map. Sure, it's not a functionality 
blocker as it can simply be implemented in userspace by shifting the 
reloc offset / IOVA equivalently, but it will reduce IO address space 
usage and prevent access to memory that was not intended to be mapped to 
the engine. The latter becomes a major PITA if you need to create safety 
documentation at this level -- don't know if this is relevant on Linux 
or not..

> 
>>> ...
>>>>> I'd like to see the DRM_SCHED and syncobj support. I can help you with
>>>>> it if it's out of yours scope for now.
>>>>>
>>>>
>>>> I already wrote some code for syncobj I can probably pull in. Regarding
>>>> DRM_SCHED, help is accepted. However, we should keep using the hardware
>>>> scheduler, and considering it's a bigger piece of work, let's not block
>>>> this series on it.
>>>
>>> I'd like to see all the custom IOCTLs to be deprecated and replaced with
>>> the generic DRM API wherever possible. Hence, I think it should be a
>>> mandatory features that we need to focus on. The current WIP userspace
>>> already uses and relies on DRM_SCHED.
>>>
>>
>>  From my point of view, the ABI needs to be designed such that it can
>> replace what we have downstream, i.e. it needs to support the usecases
>> the downstream nvhost ABI supports currently. Otherwise there is no
>> migration path to upstream and it's not worth it for me to work on this.
> 
> The downstream needs should be irrelevant for the upstream, please read
> this:
> 
> https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements
> 
> It may happen that some of the downstream features could become useful
> for upstream, but we don't know until we will see the full userspace code.
> 
> We don't have a comprehensive userspace which could utilize all the new
> features and that's why upstream driver has been stagnated for many
> years now. The grate-drivers would greatly benefit from the updated ABI,
> but I think that we need at least a usable mesa driver first, that's why
> I haven't bothered to upstream anything from the WIP UAPI v2.
> 
> In order to upstream new UAPI features we will need:
> 
>    1. Hardware specs (from vendor or reverse-engineered).
>    2. Regression tests.
>    3. A non-toy opensource userspace. >
>> Although, I don't see what this ABI is missing that your userspace would
>> rely on. Does it submit jobs in reverse order that would deadlock if
>> drm_sched didn't reorder them based on prefences, or something?
> 
> It's the opposite, we don't have userspace which needs majority of the
> proposed ABI. This needs to be fixed before we could seriously consider
> merging the new features.
> 
> I'm pretty sure that you was already aware about all the upstreaming
> requirements and we will see the usable opensource userspace at some
> point, correct?

I am well aware of that. I'm not saying that we should copy the 
downstream stack. I am saying that when designing an ABI, we should 
consider all information available on what kind of features would be 
required from it.

Going through the proposed TegraDRM UAPI, there are some features that 
would probably not be immediately used by userspace, or supported in a 
non-NOOP fashion by the kernel:
* Map offset/length
* IOVA of mapping
* Creation of sync_file postfence
* Waiting for sync_file prefences
* SUBMIT_CONTEXT_SETUP flag
* Having two syncpt_incrs
* Reservations?

I suppose we can remove all of that for now, as long as we ensure that 
there is a path to add them back. I'm just a bit concerned that we'll 
end up with 10 different ABI revisions and userspace will have to do a 
version detection dance and enable things depending on driver version.

Anything else to remove?

Regarding things like explicit channel_map, sure, we could map things 
implicitly at submit time, but it is a huge performance improvement on 
newer chips, at least. So technically userspace doesn't need it, but 
going by that argument, we can get rid of a lot of kernel functionality 
-- after all, it's only needed if you want your hardware to perform well.

> 
> For now it will be good to have this series in a form of a
> work-in-progress patches, continuing to discuss and update it. Meanwhile
> we will need to work on the userspace part as well, which is a much
> bigger blocker.

I'm hoping that porting the userspace won't take that long. It shouldn't 
be that big of a hurdle.

> 
>> Software-based scheduling might make sense in situations where the
>> channel is shared by all processes, but at least for modern chips that
>> are designed to use hardware scheduling, I want to use that capability.
> 
> The software-based scheduling is indeed needed for the older SoCs in
> order not to block hardware channels and job-submission code paths.
> Maybe it could become useful for a newer SoCs as well once we will get
> closer to a usable userspace :)

Considering that many products were successfully shipped without 
software-based scheduling, I wouldn't consider it "needed".

> 
> It will be great to have the hardware-based scheduling supported, but I
> assume that it needs to be done on top of DRM_SCHED. This should allow
> us to remove all the buggy host1x's pushbuffer locking code (which is
> known to deadlock) and support a non-host1x fences for free.
> 

If it is known to deadlock, we should fix it. In any case, which kind of 
scheduler is used shouldn't affect the ABI, and we already have a 
functional implemention in the Host1x driver, so we should merge the ABI 
first rather than wait for another year while the rest of the driver is 
redesigned and rewritten.

Mikko
