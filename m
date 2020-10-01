Return-Path: <SRS0=WsFM=DI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABD3C47423
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 19:04:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF7E021481
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 19:04:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7mGmwPm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730118AbgJATEf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Oct 2020 15:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729047AbgJATEf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Oct 2020 15:04:35 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE443C0613D0;
        Thu,  1 Oct 2020 12:04:34 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id m5so7916309lfp.7;
        Thu, 01 Oct 2020 12:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=j37F0wQ8qCLsNrR6UZ5Er6Az/5sgSAKhkmWcfAy9shM=;
        b=k7mGmwPmEpatJHsdsFDbCHUa4eXh/+6dbZr79K21Z2Yh29C4Dguzr/1IS915kq8dqp
         qj2KdjeHOPOFKeBsiBdfKU+H23lGndxCbjm1V6DA5X0Mj5cW/QfZNhxw8B9NfRjAH71S
         JQEuXOWlZ2HYhw8YSWSEq+Y4YuhQCSzLoyfHogKkAfSToqIuGIma4RKRv2wwNmQSr0LX
         ephJoCkvfvZIWJ70GMUBLdgC428QBzHNSsZEmQvG58qhegh/HZkUyECUklaEhiHtRjxA
         Llx+Tl30vh7ltB5B895VpmZPtGcSNP6OcVYGaGyQXd7emptK6S/5uocOWwnUWI6BwiZi
         k/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=j37F0wQ8qCLsNrR6UZ5Er6Az/5sgSAKhkmWcfAy9shM=;
        b=GXfSZUEqifWGTKK1vNlqj+MB1LWFBsweUjaXCmqwxHWwc+s7hkkhu3rmgnfTI6k1Ue
         E/r+9QmuEnt+lh2wfD/ENy2fkhTzodzcYOmbgHSTdapNv9qRHFsfNAkgh8I1yGpbN4Gc
         asVnni3GFfFCmIzx5YEctImfwnRnp041PrhRgQ4ZlO5+H07wpxP+WTrCavKy4U4RSlFI
         CN2/PN7R8xhHoYatSzUAXTdsp9He9p58AUMa3e1L8c4FP21RGQHAiZhcFguVhgUfHa62
         Vf1AEqbidt17IC7evHHjBgJWJ9ToiybWC48g8vmKqbrK3lCLkaHObvWxQT06pB+4YIbL
         K8Jw==
X-Gm-Message-State: AOAM530OlvXhY893K3LoH5pZlRelc/RY+aYBs0tcgVOyGmjIY+Z7daB0
        n3bk/L2Q1a9vtqqc5He+OiIr7SWFxQU=
X-Google-Smtp-Source: ABdhPJwLpcOA+WmopiKBqz7pGmCmNamporYeIpZkUEYksr35dMglOdUwMmVxBB35vUeR0FVbaNWSBA==
X-Received: by 2002:a05:6512:793:: with SMTP id x19mr2937582lfr.400.1601579072714;
        Thu, 01 Oct 2020 12:04:32 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id o17sm521842ljg.113.2020.10.01.12.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2020 12:04:31 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <20200930153131.GB3833404@ulmo>
 <ece615ad-8d6b-96ae-d8b4-9667aef17281@gmail.com>
 <20200930160626.GD3833404@ulmo>
 <f11d7d8a-8ce6-a53c-6219-ceec05432002@gmail.com>
 <20200930164707.GB3852280@ulmo>
 <35115ac1-fb25-7226-7b50-61193669e696@gmail.com>
 <20201001075811.GA3919720@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4dbf5bcb-76af-53c5-31cf-880debbcebf3@gmail.com>
Date:   Thu, 1 Oct 2020 22:04:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001075811.GA3919720@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

...
>> There are dozens variants of the panels and system could easily have
>> more than one panel, hence a direct lookup by phandle is a natural
>> choice for the panels.
> 
> Not really, there's typically only just one panel. But that's just one
> example. EMC would be another. There's only a single EMC on Tegra and
> yet for something like interconnects we still reference it by phandle.

Interconnect is a generic API.

> PMC is another case and so is CAR, GPIO (at least on early Tegra SoCs)
> and pinmux, etc.
> 
> The example of GPIO shows very well how this is important. If we had
> made the assumption from the beginning that there was only ever going to
> be a single GPIO controller, then we would've had a big problem when the
> first SoC shipped that had multiple GPIO controllers.

This is true, but only if all these words are applied to the generic APIs.

>> While all Tegra SoCs have a single fixed MC in the system, and thus,
>> there is no real need to use phandle because we can't mix up MC with
>> anything else.
> 
> The same is true for the SMMU, and yet the iommus property references
> the SMMU by phandle. There are a *lot* of cases where you could imply
> dependencies because you have intimate knowledge about the hardware
> within drivers. But the point is to avoid this wherever possible so
> that the DTB is as self-describing as possible.
> 
>>>> older DTs if DT change will be needed. Please give a detailed explanation.
>>>
>>> New functionality doesn't have to work with older DTs.
>>
>> This is fine in general, but I'm afraid that in this particular case we
>> will need to have a fall back anyways because otherwise it should break
>> the old functionality.
> 
> It looks like tegra20-devfreq is the only one that currently does this
> lookup via compatible string. And looking at the driver, what it does is
> pretty horrible, to be honest. It gets a reference to the memory
> controller and then simply accesses registers within the memory
> controller without any type of protection against concurrent accesses or
> reference counting to make sure the registers it accesses are still
> valid. At the very least this should've been a regmap.

Regmap is about abstracting accesses to devices that may sit on
different types of buses, like I2C or SPI for example. Or devices that
have a non-trivial registers mapping, or have slow IO and need caching.

I think you meant regmap in regards to protecting IO accesses, but this
is not what regmap is about if IO accesses are atomic by nature.

The tegra20-devfreq functionality is very separated from the rest of the
memory controller, hence there are no conflicts in regards to hardware
accesses, so there is nothing to protect.

Also, Regmap API itself doesn't manage refcounting of the mappings.

> And not
> coincidentally, regmaps are usually passed around by referencing their
> provider via phandle.

Any real-world examples? I think you're mixing up regmap with something
else.

The devfreq driver works just like the SMMU and GART. The devfreq device
is supposed to be created only once both MC and EMC drivers are loaded
and we know that they can't go away [1].

[1]
https://patchwork.ozlabs.org/project/linux-tegra/patch/20200814000621.8415-32-digetx@gmail.com/

Hence the tegra20-devfreq driver is horrible as much as the SMMU and
GART drivers. Perhaps not much could be done about it unless MC driver
is converted to MFD. But MFD won't work for tegra20-devfreq driver
anyways because it depends on presence of both MC and EMC drivers
simultaneously :)

Besides you didn't want the MFD couple years ago [2].

[2]
https://patchwork.ozlabs.org/project/linux-tegra/patch/675f74f82378b5f7d8f61d35e929614a0e156141.1523301400.git.digetx@gmail.com/#1902020

> That's exactly the kind of hack that I want to prevent from happening.
> If you can just grab a pointer to the memory controller with a global
> function pointer it makes people think that it's okay to use this kind
> of shortcut. But it isn't.
> Given the above, the lookup-by-compatible fallback should stay limited
> to tegra20-devfreq. Everything else should move to something saner. So
> this new helper should look up by phandle and not have a fallback, but
> instead the tegra20-devfreq should fall back if the new helper doesn't
> return anything useful (probably something like -ENOENT, meaning that
> there's no phandle and that we're using an old device tree). Bonus
> points for updating the DT bindings for tegra20-devfreq to also allow
> the memory controller to be specified by phandle and use a regmap for
> the shared registers.
The tegra20-devfreq driver doesn't share registers with other drivers.
MC statistics collection is a part of the MC, but it has no connection
to the other functions of the MC, at least from SW perspective.

Apparently you're missing that it's still not a problem to change the
T20 DT because all the MC-related drivers are still inactive in the
upstream kernel and awaiting the interconnect support addition.

Secondly, you're missing that tegra30-devfreq driver will also need to
perform the MC lookup [3] and then driver will no longer work for the
older DTs if phandle becomes mandatory because these DTs do not have the
MC phandle in the ACTMON node.

[3]
https://github.com/grate-driver/linux/commit/441d19281f9b3428a4db1ecb3a02e1ec02a8ad7f

So we will need the fall back for T30/124 as well.

>> So I don't think that using phandle for the MC device finding is really
>> warrant.
>>
>> Phandle is kinda more applicable for the cases where only the DT node
>> lookup is needed (not the lookup of the MC device driver), but even then
>> it is also not mandatory.
>>
>> I hope you agree.
> 
> I strongly disagree. We look up a bunch of devices via phandle, and in
> only very rare cases do we care only about the DT node. When we look up
> clocks, resets or GPIOs, we always get some sort of resource handle. It
> makes sense to do so because we need to operate on these resources and
> having only a DT node doesn't allow us to do that.

We don't have this problem because MC drivers do not support unloading.
Hence this is not something to really care about for now.

Maybe MC drivers won't ever support unloading and then why do we need to
discuss it at all? Should be better to get back to this once there will
be a real need.

> Ultimately this is a matter of principle. Yes, it's true that there is
> only a single MC on Tegra and we can "cheat" by taking advantage of that
> knowledge. But we don't have to, and it's not even very difficult to not
> rely on that knowledge. Treating the MC differently from everything else
> also makes it more difficult to understand the associated code and on
> top of that it sets a bad example because other people seeing this code
> will think it's a good idea.
> 
> The big advantage of uniformity is that it drastically simplifies things
> and causes less suprises.

But we aren't talking about the uniformity, at least I'm not.

To be honest, it feels to me that you're talking from perspective of
yours generic memory controller API series and want to see everything
tailored for it, which is okay :)

While I'm merely wanting to improve the existing codebase with minimal
efforts and without a need to change DTs.

Alright, I'll consider to add the phandles as a part of the interconnect
series since you're so concentrated on it :) But the series is already
40+ patches.. although, the vast majority of the patches are very
trivial, so maybe okay to add couple more trivial patches. I'm very
hoping that you will manage to allocate time for reviewing of the
upcoming v6 and that it will be good for merging into to the v5.11!
