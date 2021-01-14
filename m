Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017D9C433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Jan 2021 10:35:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3ABE23A01
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Jan 2021 10:35:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726919AbhANKfJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 14 Jan 2021 05:35:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726472AbhANKfJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 14 Jan 2021 05:35:09 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C53FC061757
        for <linux-tegra@vger.kernel.org>; Thu, 14 Jan 2021 02:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=mFpufrVcAzuD08MJh2U29ATH1a3jKI9L6u0BQyURH5s=; b=erdm3c8kqIOCXITieH19aZLuO6
        1No7sj1M7PaOo+eywXVcA5Kx7cjwS3e5k2BGL0ikBBwOhW3EwSDRjXRYPXP2/JxlbmJF7BGI7ib3o
        e7K9svapXToB7dfuRcNV8kXQ6L/2CAGv+fm2pEHyTzgTT5TQdzelP5jyMrS1CxGSKnwcsrLq9tw80
        zOu+81uY9npQlOFFVwUcNzRTv4E8FiYxNX7A+vRyF9kgeS2ALgZoY4m8JEE4aWCM4S/km2/eLBcBS
        FvsV7rLTf/h+kzXVaaX0hL5KEXF+VvsDaE2G8lx2p5WqrahY4R4TA1MoTzCCpUcPFW6zuwB5OwwiG
        ShGOtMjw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kzzxP-0008Js-QS; Thu, 14 Jan 2021 12:34:23 +0200
Subject: Re: [PATCH v5 15/21] drm/tegra: Add new UAPI to header
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-16-mperttunen@nvidia.com>
 <a0fdac0d-88cf-6eda-6611-fca951253060@gmail.com>
 <cc746d91-e6b2-53d8-17ff-59cbc8bb522f@kapsi.fi>
 <a51f7552-cec6-efe1-25dd-76422ef7a3e4@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <d76c465a-7f07-88c4-0dc3-4be3cb212fcf@kapsi.fi>
Date:   Thu, 14 Jan 2021 12:34:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a51f7552-cec6-efe1-25dd-76422ef7a3e4@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 1/14/21 10:36 AM, Dmitry Osipenko wrote:
> 13.01.2021 21:56, Mikko Perttunen пишет:
>> On 1/13/21 8:14 PM, Dmitry Osipenko wrote:
>>> 11.01.2021 16:00, Mikko Perttunen пишет:
>>>> +struct drm_tegra_submit_buf {
>>>> +    /**
>>>> +     * @mapping_id: [in]
>>>> +     *
>>>> +     * Identifier of the mapping to use in the submission.
>>>> +     */
>>>> +    __u32 mapping_id;
>>>
>>> I'm now in process of trying out the UAPI using grate drivers and this
>>> becomes the first obstacle.
>>>
>>> Looks like this is not going to work well for older Tegra SoCs, in
>>> particular for T20, which has a small GART.
>>>
>>> Given that the usefulness of the partial mapping feature is very
>>> questionable until it will be proven with a real userspace, we should
>>> start with a dynamic mappings that are done at a time of job submission.
>>>
>>> DRM already should have everything necessary for creating and managing
>>> caches of mappings, grate kernel driver has been using drm_mm_scan for a
>>> long time now for that.
>>>
>>> It should be fine to support the static mapping feature, but it should
>>> be done separately with the drm_mm integration, IMO.
>>>
>>> What do think?
>>>
>>
>> Can you elaborate on the requirements to be able to use GART? Are there
>> any other reasons this would not work on older chips?
> 
> We have all DRM devices in a single address space on T30+, hence having
> duplicated mappings for each device should be a bit wasteful.

I guess this should be pretty easy to change to only keep one mapping 
per GEM object.

> 
>> I think we should keep CHANNEL_MAP and mapping_ids, but if e.g. for GART
>> we cannot do mapping immediately at CHANNEL_MAP time, we can just treat
>> it as a "registration" call for the GEM object - potentially no-op like
>> direct physical addressing is. We can then do whatever is needed at
>> submit time. This way we can have the best of both worlds.
> 
> I have some thoughts now, but nothing concrete yet. Maybe we will need
> to create a per-SoC ops for MM.

Yep, I think some specialized code will be needed, but hopefully it will 
be relatively minor.

> 
> I'll finish with trying what we currently have to see what else is
> missing and then we will decide what to do about it.
> 

Great :)

>> Note that partial mappings are already not present in this version of
>> the UAPI.
> 
> Oh, right :) I haven't got closely to this part of reviewing yet.
> 

Mikko
