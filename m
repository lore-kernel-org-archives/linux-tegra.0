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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD658C433C1
	for <linux-tegra@archiver.kernel.org>; Sun, 28 Mar 2021 14:30:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 789CF6196B
	for <linux-tegra@archiver.kernel.org>; Sun, 28 Mar 2021 14:30:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbhC1O3b (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 28 Mar 2021 10:29:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbhC1O32 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 28 Mar 2021 10:29:28 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB2D3C061756
        for <linux-tegra@vger.kernel.org>; Sun, 28 Mar 2021 07:29:27 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id o10so14539693lfb.9
        for <linux-tegra@vger.kernel.org>; Sun, 28 Mar 2021 07:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IsKo3ur/ivZot/K5mrttiGwIcumMVaW3XKn+jy1hv30=;
        b=SU2gnbVnnPvPEDC+3BJOocb6N8yC9dwkxT1eOUCnPwHiuGQ+7C77B0cbNORpbNlxnI
         6wz+8SLseEjW8way9wM39KbT/gJ6LR95TK6aJCgv0fCHLPHFaXTPA4rYys0Tq5CfpfLW
         XpNRLWOVPiNZc09zkD+LLr7JOChZl1kEyaqP2iN8a8oWdfmbLaVrukcJhHtQViXBexKH
         4iVaqKSk9MoTN/NrZPu8W+fTKJ5/fUQmbIShEveTqLNDBbbJI19b597sgepJ+eQEIk2R
         S4BjtzTIaWIY1VvOh2J/0uWbmSu05rNmekaiX/g6rbVBPYvT4YmcsDyad+jyqUhzwE5M
         Sg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IsKo3ur/ivZot/K5mrttiGwIcumMVaW3XKn+jy1hv30=;
        b=hg9hccIgAv5DXh7llOMhIwGPPBZ0ULdFzJGXxWxxqHwSXm5eLXhyyJ0ixK4uAvfj6w
         E1wckXUTSVskC/CaWbqEfzb/M6l4mZPobsyUw1I7xhTNcqRpHj4BD3DXZgcyDvDJd7QO
         dFja9B4ixocABkLB7VRC5cPi2KrxFnXORRNgbNb81Uo0bcw8RJD9uIFlw5jioIKdfWLN
         IIEavLtS3ibBW14FW2gLSnGSXxpHHD/Ibdw9t2vD7HIJEPvXr/H2/fSedvnUTMc6xEWp
         +Rcv4fISC99kWQK++r873F61fttZZOQoM2v9X/O4ws/PivJbKb2zqY3BRB6i5ahhGu36
         P9ZQ==
X-Gm-Message-State: AOAM532LnFFGO3LEtLGzSeuNMxYVrMX5FfXOf9e4MYZ7372xMISne4Fg
        wPZk5TCMQu4OGJ7c4tjm/ACRjFClwQtw3w==
X-Google-Smtp-Source: ABdhPJyxZRrAJ+QYJSIsy+j/rSicPrQ1Jk5lniSiceyjqz4qa2RJvMiYC4je1i1lYRDQPZiX9hTr0Q==
X-Received: by 2002:ac2:51ac:: with SMTP id f12mr13335137lfk.605.1616941765861;
        Sun, 28 Mar 2021 07:29:25 -0700 (PDT)
Received: from ?IPv6:2a00:1370:814d:b259:a10:76ff:fe69:21b6? ([2a00:1370:814d:b259:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id b7sm1499196lfa.18.2021.03.28.07.29.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Mar 2021 07:29:25 -0700 (PDT)
Subject: Re: [PATCH 6/9] drm/tegra: gem: Add a clarifying comment
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <cyndis@kapsi.fi>, David Airlie <airlied@linux.ie>,
        James Jones <jajones@nvidia.com>,
        dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-tegra@vger.kernel.org
References: <20210323155437.513497-1-thierry.reding@gmail.com>
 <20210323155437.513497-7-thierry.reding@gmail.com>
 <21d2e691-6404-503b-422a-be97a7b9d1b4@gmail.com>
 <YFtUalHlk9YiH03n@orome.fritz.box>
 <c231415d-bb4c-6e8a-d384-4ded8f4d27d1@gmail.com>
 <YFtr6f3N3o11DfBc@orome.fritz.box>
 <eeea04f2-86d5-6f24-3831-9c67bfd59436@gmail.com>
 <YF4N5YJ5e9nyEXzg@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fbb80ce4-5986-b8c0-14be-9ba17f5682cf@gmail.com>
Date:   Sun, 28 Mar 2021 17:29:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YF4N5YJ5e9nyEXzg@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

26.03.2021 19:37, Thierry Reding пишет:
> On Wed, Mar 24, 2021 at 07:50:01PM +0300, Dmitry Osipenko wrote:
>> 24.03.2021 19:42, Thierry Reding пишет:
>>> On Wed, Mar 24, 2021 at 06:45:30PM +0300, Dmitry Osipenko wrote:
>>>> 24.03.2021 18:02, Thierry Reding пишет:
>>>>> On Wed, Mar 24, 2021 at 05:41:08PM +0300, Dmitry Osipenko wrote:
>>>>>> 23.03.2021 18:54, Thierry Reding пишет:
>>>>>>> From: Thierry Reding <treding@nvidia.com>
>>>>>>>
>>>>>>> Clarify when a fixed IOV address can be used and when a buffer has to
>>>>>>> be mapped before the IOVA can be used.
>>>>>>>
>>>>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>>>>>> ---
>>>>>>>  drivers/gpu/drm/tegra/plane.c | 8 ++++++++
>>>>>>>  1 file changed, 8 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
>>>>>>> index 19e8847a164b..793da5d675d2 100644
>>>>>>> --- a/drivers/gpu/drm/tegra/plane.c
>>>>>>> +++ b/drivers/gpu/drm/tegra/plane.c
>>>>>>> @@ -119,6 +119,14 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct tegra_plane_state *state)
>>>>>>>  		dma_addr_t phys_addr, *phys;
>>>>>>>  		struct sg_table *sgt;
>>>>>>>  
>>>>>>> +		/*
>>>>>>> +		 * If we're not attached to a domain, we already stored the
>>>>>>> +		 * physical address when the buffer was allocated. If we're
>>>>>>> +		 * part of a group that's shared between all display
>>>>>>> +		 * controllers, we've also already mapped the framebuffer
>>>>>>> +		 * through the SMMU. In both cases we can short-circuit the
>>>>>>> +		 * code below and retrieve the stored IOV address.
>>>>>>> +		 */
>>>>>>>  		if (!domain || dc->client.group)
>>>>>>>  			phys = &phys_addr;
>>>>>>>  		else
>>>>>>>
>>>>>>
>>>>>> This comment is correct, but the logic feels a bit lame because it
>>>>>> should be wasteful to re-map DMA on each FB flip. Personally I don't
>>>>>> care much about this since older Tegras use pinned buffers by default,
>>>>>> but this shouldn't be good for T124+ users.
>>>>>
>>>>> I'm not terribly thrilled by this either, but it's the only way to do
>>>>> this when using the DMA API because we don't know at allocation time (or
>>>>> import time for that matter) which of the (up to) 4 display controllers
>>>>> a framebuffer will be shown on. tegra_dc_pin() is the earliest where
>>>>> this is known and worst case that's called once per flip.
>>>>>
>>>>> When the IOMMU API is used explicitly, we always map framebuffers into
>>>>> the IOMMU domain shared by all display controllers at allocation or
>>>>> import time and then we don't need to pin at flip time anymore.
>>>>>
>>>>> I do have a work-in-progress patch somewhere that creates a mapping
>>>>> cache to mitigate this problem to some degree. I need to dig that up and
>>>>> do a few measurements because I vaguely recall this speeding up flips by
>>>>> quite a bit (well, except for the very first mapping, obviously).
>>>>>
>>>>>> Perhaps dumb buffers should be pinned to display by default and then we
>>>>>> should extend the Tegra UAPI to support BO mapping to display client(?).
>>>>>
>>>>> That would kind of defeat the purpose of a generic KMS UAPI.
>>>>
>>>> Couldn't the BOs be mapped when FB is created, i.e. by tegra_fb_create?
>>>
>>> I suppose that would be possible. However, tegra_fb_create() doesn't
>>> know a thing about display controllers, so we'd have to add extra code
>>> to it to iterate over all display controllers and do a dma_map_sg() of
>>> the GEM object for each of them.
>>>
>>> It's also somewhat wasteful because now we get a mapping for each
>>> framebuffer for each display controller. So if you've got, say, a four
>>> UHD screen setup (which is something that Tegra194 supports), you could
>>> end up with 8 UHD framebuffers (two for each display, for double-
>>> buffering) at 32 MiB each for a whopping 256 MiB of memory that needs to
>>> be mapped for each of the four display controllers. That 1 GiB worth of
>>> page table updates, whereas you really only need one fourth of that.
>>>
>>> Granted, this will make flipping a bit faster, and IOVA space isn't
>>> really a problem on Tegra194. It would still waste a bit of RAM for all
>>> those page table entries that we don't really need, though.
>>>
>>> A mapping cache seems like a much better compromise because the cache
>>> lookup should be quite fast compared to a mapping operation and we waste
>>> just a couple dozen bytes per mapping perhaps as opposed to a few
>>> megabytes for the gratuitous, preemptive mappings.
>>
>> Isn't it really possible to put displays into the same IOMMU group on
>> T194? It doesn't make much sense to have them in a separate groups on Linux.
> 
> It is possible and in fact that's what's already happening. However, the
> problem isn't that these devices are not in the same group, the problem
> is that the DMA API doesn't know anything about groups. It works on
> struct device and if you've got DMA API debugging enabled it may even
> flag incorrect usage as errors.
> 
> So from a DMA API point of view, if a device wants to use a buffer, that
> buffer first has to be mapped for that device, even if it was already
> mapped for a different device that happens to be in the same IOMMU group
> and hence share an IOMMU domain.

This sounds to me like something which needs to be addressed first, i.e.
to make DMA API aware that it's okay to re-use mappings by sibling
devices within the same IOMMU group. Although, I assume that you already
considered this variant, didn't you?
