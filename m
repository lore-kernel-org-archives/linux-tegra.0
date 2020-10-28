Return-Path: <SRS0=qFEE=EE=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C17C388F7
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Oct 2020 02:11:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9DBA20747
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Oct 2020 02:11:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="g9bjzYpy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbgJ2CLP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 28 Oct 2020 22:11:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgJ2CKU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 28 Oct 2020 22:10:20 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEDE8C0613CF
        for <linux-tegra@vger.kernel.org>; Wed, 28 Oct 2020 19:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=0GulZkdnWomNXqleX+nVVTJCySdixjR8SeKk4VanFEU=; b=g9bjzYpyJQcCbhP8Xfp3kAt6We
        JlGrZXrT+mPK9p5bzQ4TB5SGwrkN0fqer++glHrZ3jNx1JfpXgrWXPWpfgI5VCPyISOPugEkBXA4I
        3lGVGCbx/RXiDYw19f0i0cproGwlka0Nwcp9rkjSdeL+yw3ETb11z4aar0iiCmCd989uVD8y7/c8T
        hRxfla1tvChzV/nyKdzYt1YJW4w42nZWNoSXel4ybVqRItaNd9AsHFncLILOq8UXCz9LTO0fwcsxd
        6edfR8A8PVIG/LJy5ztocByPtENNsaKc3a1XyfvUFTfz3ltnxlubNCXSMNQ3fFnt8sGuy2ESvoVQZ
        tTgmGyLw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kXi9c-0001wS-F4; Wed, 28 Oct 2020 11:54:04 +0200
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
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <6ef6337d-3bb5-bbba-f39c-6de1722ddc44@kapsi.fi>
Date:   Wed, 28 Oct 2020 11:54:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <e8afd710-de37-f1c5-f61c-ed97c07370bf@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 10/27/20 9:06 PM, Dmitry Osipenko wrote:
> 26.10.2020 12:11, Mikko Perttunen пишет:
>>>
>>> The first patches should be the ones that are relevant to the existing
>>> userspace code, like support for the waits.
>>
>> Can you elaborate what you mean by this?
> 
> All features that don't have an immediate real use-case should be placed
> later in the series because we may defer merging of those patches until
> we will see userspace that uses those features since we can't really
> decide whether these are decisions that we won't regret later on, only
> practical application can confirm the correctness.

I was more referring to the "support for waits" part, should have 
clarified that.

> 
>>> Partial mappings should be a separate feature because it's a
>>> questionable feature that needs to be proved by a real userspace first.
>>> Maybe it would be even better to drop it for the starter, to ease
>>> reviewing.
>>
>> Considering that the "no-op" support for it (map the whole buffer but
>> just keep track of the starting offset) is only a couple of lines, I'd
>> like to keep it in.
> 
> There is no tracking in the current code which prevents the duplicated
> mappings, will we need to care about it? This a bit too questionable
> feature for now, IMO. I'd like to see it as a separate patch.

I don't think there is any need to special case duplicated mappings. I 
think this is a pretty obvious feature to have, but I can rename them to 
reserved0 and reserved1 and require that reserved0 is zero and reserved1 
is the size of the passed GEM object.

> 
> ...
>>> I'd like to see the DRM_SCHED and syncobj support. I can help you with
>>> it if it's out of yours scope for now.
>>>
>>
>> I already wrote some code for syncobj I can probably pull in. Regarding
>> DRM_SCHED, help is accepted. However, we should keep using the hardware
>> scheduler, and considering it's a bigger piece of work, let's not block
>> this series on it.
> 
> I'd like to see all the custom IOCTLs to be deprecated and replaced with
> the generic DRM API wherever possible. Hence, I think it should be a
> mandatory features that we need to focus on. The current WIP userspace
> already uses and relies on DRM_SCHED.
> 

 From my point of view, the ABI needs to be designed such that it can 
replace what we have downstream, i.e. it needs to support the usecases 
the downstream nvhost ABI supports currently. Otherwise there is no 
migration path to upstream and it's not worth it for me to work on this.

Although, I don't see what this ABI is missing that your userspace would 
rely on. Does it submit jobs in reverse order that would deadlock if 
drm_sched didn't reorder them based on prefences, or something?

Software-based scheduling might make sense in situations where the 
channel is shared by all processes, but at least for modern chips that 
are designed to use hardware scheduling, I want to use that capability.

Mikko
