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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE57C433C1
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Mar 2021 16:50:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5889E619E3
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Mar 2021 16:50:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236566AbhCXQuR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Mar 2021 12:50:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236628AbhCXQuE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Mar 2021 12:50:04 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA0BC061763
        for <linux-tegra@vger.kernel.org>; Wed, 24 Mar 2021 09:50:04 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id o126so23481087lfa.0
        for <linux-tegra@vger.kernel.org>; Wed, 24 Mar 2021 09:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bUj6Ff40gvtg1fnmBKNOsgHKeeWSJlvfqc4H2iHhUU8=;
        b=EZKpsG3K7Ap0gY6JD3yb+tItNMKCJ4MpDAhAaGoT85UnZyklGdaqnppGihdG9Xv2ti
         NG5eSIeG9m9etTX3cQdzOux1qQlFAZbSJHswuhQPA3JbMdZgwuB379i7K+l7nnWNgPwZ
         1+md5NSOHhXZhdtvBmNXTSqGOkWexDVd3mIte2moXd1U+1T5ZSkoAvVEtcBi1DUX9Rvc
         fT8wzfaV5SR7oaeWiNmpA+EBs6GAeyLSdW0ATBOqHh4bQ4eh6LXjrPp+VJOWlSFznYfC
         4o36ISJZpE7ZFwKHc2zF5CXnugBL38QBB/5rehBaXmRzNhoB5GGkZZvYmhsP1b3fgKMc
         7ryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bUj6Ff40gvtg1fnmBKNOsgHKeeWSJlvfqc4H2iHhUU8=;
        b=dqy2/TJzH7EtzL9dOR6Eu10ekdSy7TWPhjjD9fCUiFQ/eS2lNsPurocCODRprDrMAK
         s8MWNVdx18YwcvyhAivpj+BryjSHzsO2XkMiaGMHP3W4IYJwdg0O/OQ8LZKzPC1qspXQ
         pHgTONN7H3q+VINhg0uite0iqP1dSwFAZawpIDe+FKoA1aE1cIGbcA5n0NRvI6SZogs8
         3AgqFJqadrl96ux/P2jDs0qtqy0+Qew4H07kWD4tWRnphBRIgb3lg3P5MAm/8iAN59Sf
         fBP/Ge+XAp+RH2Or5cSua1KrqYS9UW4JJ+Trkmq+pYe8lzGIdTGQa9tF54/bKzBVTkOX
         ED3A==
X-Gm-Message-State: AOAM530wNTmS8GxABqY6een4rzGLJ8F06GDiCAa0ziBnH2Ud6mhrh6mF
        ZZjTM2NHuf8/xF4IvB4jaXhPglJCOkM=
X-Google-Smtp-Source: ABdhPJxF9LKGFljVOPWfDmx7SePx+FlFzDhGe+G2aXlmt4M4vehA9wv+3yPWQIoU39P0Y8f+e4A+jA==
X-Received: by 2002:a05:6512:70:: with SMTP id i16mr2482598lfo.508.1616604602234;
        Wed, 24 Mar 2021 09:50:02 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-60.dynamic.spd-mgts.ru. [109.252.193.60])
        by smtp.googlemail.com with ESMTPSA id z18sm276379lfj.176.2021.03.24.09.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 09:50:01 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <eeea04f2-86d5-6f24-3831-9c67bfd59436@gmail.com>
Date:   Wed, 24 Mar 2021 19:50:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFtr6f3N3o11DfBc@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

24.03.2021 19:42, Thierry Reding пишет:
> On Wed, Mar 24, 2021 at 06:45:30PM +0300, Dmitry Osipenko wrote:
>> 24.03.2021 18:02, Thierry Reding пишет:
>>> On Wed, Mar 24, 2021 at 05:41:08PM +0300, Dmitry Osipenko wrote:
>>>> 23.03.2021 18:54, Thierry Reding пишет:
>>>>> From: Thierry Reding <treding@nvidia.com>
>>>>>
>>>>> Clarify when a fixed IOV address can be used and when a buffer has to
>>>>> be mapped before the IOVA can be used.
>>>>>
>>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>>>> ---
>>>>>  drivers/gpu/drm/tegra/plane.c | 8 ++++++++
>>>>>  1 file changed, 8 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
>>>>> index 19e8847a164b..793da5d675d2 100644
>>>>> --- a/drivers/gpu/drm/tegra/plane.c
>>>>> +++ b/drivers/gpu/drm/tegra/plane.c
>>>>> @@ -119,6 +119,14 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct tegra_plane_state *state)
>>>>>  		dma_addr_t phys_addr, *phys;
>>>>>  		struct sg_table *sgt;
>>>>>  
>>>>> +		/*
>>>>> +		 * If we're not attached to a domain, we already stored the
>>>>> +		 * physical address when the buffer was allocated. If we're
>>>>> +		 * part of a group that's shared between all display
>>>>> +		 * controllers, we've also already mapped the framebuffer
>>>>> +		 * through the SMMU. In both cases we can short-circuit the
>>>>> +		 * code below and retrieve the stored IOV address.
>>>>> +		 */
>>>>>  		if (!domain || dc->client.group)
>>>>>  			phys = &phys_addr;
>>>>>  		else
>>>>>
>>>>
>>>> This comment is correct, but the logic feels a bit lame because it
>>>> should be wasteful to re-map DMA on each FB flip. Personally I don't
>>>> care much about this since older Tegras use pinned buffers by default,
>>>> but this shouldn't be good for T124+ users.
>>>
>>> I'm not terribly thrilled by this either, but it's the only way to do
>>> this when using the DMA API because we don't know at allocation time (or
>>> import time for that matter) which of the (up to) 4 display controllers
>>> a framebuffer will be shown on. tegra_dc_pin() is the earliest where
>>> this is known and worst case that's called once per flip.
>>>
>>> When the IOMMU API is used explicitly, we always map framebuffers into
>>> the IOMMU domain shared by all display controllers at allocation or
>>> import time and then we don't need to pin at flip time anymore.
>>>
>>> I do have a work-in-progress patch somewhere that creates a mapping
>>> cache to mitigate this problem to some degree. I need to dig that up and
>>> do a few measurements because I vaguely recall this speeding up flips by
>>> quite a bit (well, except for the very first mapping, obviously).
>>>
>>>> Perhaps dumb buffers should be pinned to display by default and then we
>>>> should extend the Tegra UAPI to support BO mapping to display client(?).
>>>
>>> That would kind of defeat the purpose of a generic KMS UAPI.
>>
>> Couldn't the BOs be mapped when FB is created, i.e. by tegra_fb_create?
> 
> I suppose that would be possible. However, tegra_fb_create() doesn't
> know a thing about display controllers, so we'd have to add extra code
> to it to iterate over all display controllers and do a dma_map_sg() of
> the GEM object for each of them.
> 
> It's also somewhat wasteful because now we get a mapping for each
> framebuffer for each display controller. So if you've got, say, a four
> UHD screen setup (which is something that Tegra194 supports), you could
> end up with 8 UHD framebuffers (two for each display, for double-
> buffering) at 32 MiB each for a whopping 256 MiB of memory that needs to
> be mapped for each of the four display controllers. That 1 GiB worth of
> page table updates, whereas you really only need one fourth of that.
> 
> Granted, this will make flipping a bit faster, and IOVA space isn't
> really a problem on Tegra194. It would still waste a bit of RAM for all
> those page table entries that we don't really need, though.
> 
> A mapping cache seems like a much better compromise because the cache
> lookup should be quite fast compared to a mapping operation and we waste
> just a couple dozen bytes per mapping perhaps as opposed to a few
> megabytes for the gratuitous, preemptive mappings.

Isn't it really possible to put displays into the same IOMMU group on
T194? It doesn't make much sense to have them in a separate groups on Linux.
