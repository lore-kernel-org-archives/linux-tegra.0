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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B5E9C433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Mar 2021 15:46:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C513D61A09
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Mar 2021 15:46:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236520AbhCXPqE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Mar 2021 11:46:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236803AbhCXPpd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Mar 2021 11:45:33 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AED8C061763
        for <linux-tegra@vger.kernel.org>; Wed, 24 Mar 2021 08:45:33 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id u4so30792470ljo.6
        for <linux-tegra@vger.kernel.org>; Wed, 24 Mar 2021 08:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=J67g1LYZycnuR5Ntlc3GIVZEd0UIRXmhsdUs45LSnIc=;
        b=HbrG1LxiS/DsjiRPaT3k87IMaNXlS1US2xGqZQUY6RndQIi52ZNz0AYuiCof7NeCSO
         O7heYjxHWV3LHpo+mR4XYz8szjV7R1oJuWgSErZoFSJGoKCAokXT4CvvXYnUfWfjs0T3
         98StExoZmoVoA7iT/9Xj0UfBYU2ZJQAAtFPjeUXwIhI9mcL0BEu4y05IkIiDgtuYUWem
         fzgRHdQJqFcAwYIsEI/uGakth1p20AIvsBRTnrl80MUdWo/touP7Ae5OhdktW6VtwA0P
         50YjiA1kvisH0EX/sJF5ZcWZIDOJacSeyubB5kLHlGbXB94kRugPuKtFM3Bln+AQGoIC
         E/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=J67g1LYZycnuR5Ntlc3GIVZEd0UIRXmhsdUs45LSnIc=;
        b=LI5EiBgUNXW9bnT7u5KfigaEr3O3TfbEbOBqnM5uUMfVYcbS+c6q+TGM9OB8UCBpgN
         4ictB7XG4JcPknEP59sqn+ZmGHpdWRNchHey42/a7qIH5U4yt7IKMueN/+kWTZ1yvUib
         eZkLfYei+hD19kL5zdT0hv/SFyjiIvTa38jTMVMF3lLaOPhgyQRzp6nrxIzpkWvJullO
         Wf+Qc43MkvRPjiMtShu8R5IgKlz0YMZbwbvlOTA3Ewt3xyMz/Izgyf0vCk54RY8jiv3f
         0weRJtWxsITMvEd9GeUQBrYX1P69DgHYgeogvkL4iOM8sYyyz7gt8ajVbjOGB60tmc2/
         4haw==
X-Gm-Message-State: AOAM530+Q+C1/zPTscStJhIZnUwPlftVNV84/+83G95X1pZq55OPX1OH
        sY1ggfbA7jh3f3pga6NIW+srvJDNgRk=
X-Google-Smtp-Source: ABdhPJzIPYTviHs7vr0lapP/KBEMON2O+agn5rTN2dN8En/5twsHclUU3TGkyusQQLbl/jY5AzyzOA==
X-Received: by 2002:a2e:1612:: with SMTP id w18mr2618929ljd.6.1616600731613;
        Wed, 24 Mar 2021 08:45:31 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-60.dynamic.spd-mgts.ru. [109.252.193.60])
        by smtp.googlemail.com with ESMTPSA id p22sm265576lfc.23.2021.03.24.08.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 08:45:31 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c231415d-bb4c-6e8a-d384-4ded8f4d27d1@gmail.com>
Date:   Wed, 24 Mar 2021 18:45:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFtUalHlk9YiH03n@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

24.03.2021 18:02, Thierry Reding пишет:
> On Wed, Mar 24, 2021 at 05:41:08PM +0300, Dmitry Osipenko wrote:
>> 23.03.2021 18:54, Thierry Reding пишет:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> Clarify when a fixed IOV address can be used and when a buffer has to
>>> be mapped before the IOVA can be used.
>>>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>  drivers/gpu/drm/tegra/plane.c | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
>>> index 19e8847a164b..793da5d675d2 100644
>>> --- a/drivers/gpu/drm/tegra/plane.c
>>> +++ b/drivers/gpu/drm/tegra/plane.c
>>> @@ -119,6 +119,14 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct tegra_plane_state *state)
>>>  		dma_addr_t phys_addr, *phys;
>>>  		struct sg_table *sgt;
>>>  
>>> +		/*
>>> +		 * If we're not attached to a domain, we already stored the
>>> +		 * physical address when the buffer was allocated. If we're
>>> +		 * part of a group that's shared between all display
>>> +		 * controllers, we've also already mapped the framebuffer
>>> +		 * through the SMMU. In both cases we can short-circuit the
>>> +		 * code below and retrieve the stored IOV address.
>>> +		 */
>>>  		if (!domain || dc->client.group)
>>>  			phys = &phys_addr;
>>>  		else
>>>
>>
>> This comment is correct, but the logic feels a bit lame because it
>> should be wasteful to re-map DMA on each FB flip. Personally I don't
>> care much about this since older Tegras use pinned buffers by default,
>> but this shouldn't be good for T124+ users.
> 
> I'm not terribly thrilled by this either, but it's the only way to do
> this when using the DMA API because we don't know at allocation time (or
> import time for that matter) which of the (up to) 4 display controllers
> a framebuffer will be shown on. tegra_dc_pin() is the earliest where
> this is known and worst case that's called once per flip.
> 
> When the IOMMU API is used explicitly, we always map framebuffers into
> the IOMMU domain shared by all display controllers at allocation or
> import time and then we don't need to pin at flip time anymore.
> 
> I do have a work-in-progress patch somewhere that creates a mapping
> cache to mitigate this problem to some degree. I need to dig that up and
> do a few measurements because I vaguely recall this speeding up flips by
> quite a bit (well, except for the very first mapping, obviously).
> 
>> Perhaps dumb buffers should be pinned to display by default and then we
>> should extend the Tegra UAPI to support BO mapping to display client(?).
> 
> That would kind of defeat the purpose of a generic KMS UAPI.

Couldn't the BOs be mapped when FB is created, i.e. by tegra_fb_create?
