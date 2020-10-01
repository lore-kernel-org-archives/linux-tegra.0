Return-Path: <SRS0=WsFM=DI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C264C4363D
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 02:11:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2AD1F2193E
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 02:11:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B8imYH9R"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725799AbgJACLe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 22:11:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgJACLe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 22:11:34 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE52FC061755;
        Wed, 30 Sep 2020 19:11:33 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id u8so4609046lff.1;
        Wed, 30 Sep 2020 19:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2b8YJ/jVVR7JmlsGa7FjoHY0aps0ZebG9cV7sMoGxuM=;
        b=B8imYH9RcCeEdOmTlUlnev52Sz270GKuLllWU517V8pBJHqahNa9XWjov3tmmX6fP1
         dWfGwinkASFIxxmS5B9EsUhrlIXLNDKeTWWmMFK3WnuffX6XRuQNaQJKM+IrflrL0XL5
         Kfj38N/rW4KPdGlNEmUauhFW4WmdwxxrfKyLKl9U9blBFvUBj+6hBEkEID4QjUL09w/Z
         ng67npv0nUB8qsxjb7Yb2c/izGuY57asrEkrP/RrLl3IBr3HjTynacPIqW3ckJf/DgRf
         WI2QwGjSnzJ4U4vjWbJB3pK9LXx79pjYeHTWtBWtecZ06aQWkCS9NuXoHFRtYjr1cXbb
         1RkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2b8YJ/jVVR7JmlsGa7FjoHY0aps0ZebG9cV7sMoGxuM=;
        b=eXWU72LF+ptcRSZQJYVFsgT6M+JV/fPQuH9ekg41iNfXHQ+H4YiRt5kiIsBEiw9gmW
         KsaeCaL45QlJxoe/OnAI3Ruc+D/xd6Xhes8W/qUr/vLC0ADNunSuvdXlJzf/wmylbmMP
         YNe/2gVyp3z9GhmJ+x4CEyzh+K+DBy4zJFGGM0tsgbLv+vEvi5ja5IGt/B1U7aEUPivn
         9iUzRmjSs8IofCK6wg+FDazwVquTvbt/bXyIHtFa0oF60M5kIIliG9GdT958BX4aDmLT
         Rljr2Uh/Ani5Hy1NFePLRmFQlyrB6t3asp/Qv4rDFWS0F1jp+gwjbK8qyhh3RvyBbtom
         /1Xg==
X-Gm-Message-State: AOAM5321XJ9L7l0HsKAtmQ2Acq29AzMj8yFzTMosH+nm/4yP10I4oeKS
        NdQIjzjWRBwvDaxyu5H6h+ir2uI3jTc=
X-Google-Smtp-Source: ABdhPJwzkF/zX8i+aEADE+pp5Wl1aHNmiLSe9AZv5i60TKPO1ExNfB1hE9HpZELpWSIBfNYcGBcS4A==
X-Received: by 2002:a19:40c8:: with SMTP id n191mr1959843lfa.29.1601518292137;
        Wed, 30 Sep 2020 19:11:32 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id e8sm303688ljk.25.2020.09.30.19.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 19:11:31 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <35115ac1-fb25-7226-7b50-61193669e696@gmail.com>
Date:   Thu, 1 Oct 2020 05:11:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930164707.GB3852280@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.09.2020 19:47, Thierry Reding пишет:
> On Wed, Sep 30, 2020 at 07:25:41PM +0300, Dmitry Osipenko wrote:
>> 30.09.2020 19:06, Thierry Reding пишет:
>>> On Wed, Sep 30, 2020 at 06:36:52PM +0300, Dmitry Osipenko wrote:
>>>>  I'...
>>>>>> +	struct tegra_mc *mc = devm_tegra_get_memory_controller(dev);
>>>>>> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>>>>>
>>>>> It looks to me like the only reason why you need this new global API is
>>>>> because PCI devices may not have a device tree node with a phandle to
>>>>> the IOMMU. However, SMMU support for PCI will only be enabled if the
>>>>> root complex has an iommus property, right? In that case, can't we
>>>>> simply do something like this:
>>>>>
>>>>> 	if (dev_is_pci(dev))
>>>>> 		np = find_host_bridge(dev)->of_node;
>>>>> 	else
>>>>> 		np = dev->of_node;
>>>>>
>>>>> ? I'm not sure exactly what find_host_bridge() is called, but I'm pretty
>>>>> sure that exists.
>>>>>
>>>>> Once we have that we can still iterate over the iommus property and do
>>>>> not need to rely on this global variable.
>>>>
>>>> This sounds more complicated than the current variant.
>>>>
>>>> Secondly, I'm already about to use the new tegra_get_memory_controller()
>>>> API for all the T20/30/124/210 EMC and devfreq drivers.
>>>
>>> Why do we need it there? They seem to work fine without it right now.
>>
>> All the Tegra30/124/210 EMC drivers are already duplicating that MC
>> lookup code and only the recent T210 driver does it properly.
>>
>>> If it is required for new functionality, we can always make the dependent
>>> on a DT reference via phandle without breaking any existing code.
>>
>> That's correct, it will be also needed for the new functionality as
>> well, hence even more drivers will need to perform the MC lookup.
> 
> I don't have any issues with adding a helper if we need it from several
> different locations. But the helper should be working off of a given
> device and look up the device via the device tree node referenced by
> phandle. We already have those phandles in place for the EMC devices,
> and any other device that needs to interoperate with the MC should also
> get such a reference.
> 
>> I don't quite understand why you're asking for the phandle reference,
>> it's absolutely not needed for the MC lookup and won't work for the
> 
> We need that phandle in order to establish a link between the devices.
> Yes, you can probably do it without the phandle and just match by
> compatible string. But we don't do that for other types of devices
> either, right? For a display driver we reference the attached panel via
> phandle, but we could also just look it up via name or absolute path or
> some other heuristic. But a phandle is just a much more explicit way of
> linking the devices, so why not use it?

There are dozens variants of the panels and system could easily have
more than one panel, hence a direct lookup by phandle is a natural
choice for the panels.

While all Tegra SoCs have a single fixed MC in the system, and thus,
there is no real need to use phandle because we can't mix up MC with
anything else.

>> older DTs if DT change will be needed. Please give a detailed explanation.
> 
> New functionality doesn't have to work with older DTs.

This is fine in general, but I'm afraid that in this particular case we
will need to have a fall back anyways because otherwise it should break
the old functionality.

So I don't think that using phandle for the MC device finding is really
warrant.

Phandle is kinda more applicable for the cases where only the DT node
lookup is needed (not the lookup of the MC device driver), but even then
it is also not mandatory.

I hope you agree.
