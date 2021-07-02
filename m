Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01062C11F68
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Jul 2021 14:16:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2D5D61427
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Jul 2021 14:16:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232777AbhGBOTB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Jul 2021 10:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232677AbhGBOTA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Jul 2021 10:19:00 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A79FCC061762;
        Fri,  2 Jul 2021 07:16:28 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id f30so18391063lfj.1;
        Fri, 02 Jul 2021 07:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qZ59h8hRa4ZDg98NbXY065EEOg9pTRSMK3+GCkG//7w=;
        b=CBmUJwaGeiO+XIdGctqbrAeVA7dXsC1nudWsYZlHvFmlNIwzPLizAErA5zHGraGRZB
         yXI8har6Kh7Nm4PJ+O6AZEh9mIDk5Lt0hDLCiraE2sVsdr7FToh057wvgUnLic60NtsR
         3TxwtUjuow3jpS4M+FQJuTM24mxz//scuv8QIxEmEccglTCpyvH072ysjOw+eFuY6jTG
         0nMJZV0aATtzkoNKw3oHQtS+MB/mHIGZLyITv0rsei68/6ubJLNHODL/r8L/r1mqLPs6
         4oOmlc24p9zJ+BCWIw8npWMRsAr/5rwg+m576oIPszWzzxANk62jnupUKkkrUOp+j9sc
         JeFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qZ59h8hRa4ZDg98NbXY065EEOg9pTRSMK3+GCkG//7w=;
        b=Mxn/Uk7XXV1sS5QG6UJXvs0YZdIkL2B7mkuxYedVtwYJjZGvygNttLlXra+sCxqT+s
         35MUyNDZcnZBptfWUgyY5DYsoPzJQQFjBtF/vuoBZngrXXZe/h4YG7TxPBAbNfbUyJYZ
         +5nBRznNhORoH+GZfUBvbkPCBRbyiRMKGwNSnWiygHKtv/n+DdY1m9W5TyTnvav1j9ta
         sU5m75uVWwAqEwYNmWFoFjCy4m63EZPHlR/jsmAKMGrpgaHAXpXgpowPadbZiuGCG3qh
         xirwmFKGTxS5eluxpmwkumB32uaN8euDyQuyTlg3uNuXe+DM0wGV+Leq+DNp1ymcU60P
         MuUQ==
X-Gm-Message-State: AOAM5336/FPxGYCIbKZ08uMZs06Rjku2qU0BvHCtzXvLsr9dBwpGQRM1
        zQ8TS6orfM0H241rVLfAJ8TmuNe50VY=
X-Google-Smtp-Source: ABdhPJyEm6nf1wc2oQQHUHY4ne3HT6Yid9byglxb+/U/anHmWWyPg9wj1E2i1QgAAZRySErj1c14IQ==
X-Received: by 2002:a19:c7d3:: with SMTP id x202mr4252129lff.51.1625235386928;
        Fri, 02 Jul 2021 07:16:26 -0700 (PDT)
Received: from [192.168.2.145] (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.googlemail.com with ESMTPSA id b30sm362479ljr.137.2021.07.02.07.16.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jul 2021 07:16:26 -0700 (PDT)
Subject: Re: [PATCH v2 1/5] dt-bindings: reserved-memory: Document memory
 region specifier
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
References: <20210423163234.3651547-1-thierry.reding@gmail.com>
 <20210423163234.3651547-2-thierry.reding@gmail.com>
 <20210520220306.GA1976116@robh.at.kernel.org>
 <YLEgXyLBF8PEFNw2@orome.fritz.box> <YL+gHN4YZ4vt1vPk@orome.fritz.box>
 <YN4F/nH/9tDuWDnQ@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7995b0ed-a277-ced1-b3d0-e0e7e02817a6@gmail.com>
Date:   Fri, 2 Jul 2021 17:16:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YN4F/nH/9tDuWDnQ@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

01.07.2021 21:14, Thierry Reding пишет:
> On Tue, Jun 08, 2021 at 06:51:40PM +0200, Thierry Reding wrote:
>> On Fri, May 28, 2021 at 06:54:55PM +0200, Thierry Reding wrote:
>>> On Thu, May 20, 2021 at 05:03:06PM -0500, Rob Herring wrote:
>>>> On Fri, Apr 23, 2021 at 06:32:30PM +0200, Thierry Reding wrote:
>>>>> From: Thierry Reding <treding@nvidia.com>
>>>>>
>>>>> Reserved memory region phandle references can be accompanied by a
>>>>> specifier that provides additional information about how that specific
>>>>> reference should be treated.
>>>>>
>>>>> One use-case is to mark a memory region as needing an identity mapping
>>>>> in the system's IOMMU for the device that references the region. This is
>>>>> needed for example when the bootloader has set up hardware (such as a
>>>>> display controller) to actively access a memory region (e.g. a boot
>>>>> splash screen framebuffer) during boot. The operating system can use the
>>>>> identity mapping flag from the specifier to make sure an IOMMU identity
>>>>> mapping is set up for the framebuffer before IOMMU translations are
>>>>> enabled for the display controller.
>>>>>
>>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>>>> ---
>>>>>  .../reserved-memory/reserved-memory.txt       | 21 +++++++++++++++++++
>>>>>  include/dt-bindings/reserved-memory.h         |  8 +++++++
>>>>>  2 files changed, 29 insertions(+)
>>>>>  create mode 100644 include/dt-bindings/reserved-memory.h
>>>>
>>>> Sorry for being slow on this. I have 2 concerns.
>>>>
>>>> First, this creates an ABI issue. A DT with cells in 'memory-region' 
>>>> will not be understood by an existing OS. I'm less concerned about this 
>>>> if we address that with a stable fix. (Though I'm pretty sure we've 
>>>> naively added #?-cells in the past ignoring this issue.)
>>>
>>> A while ago I had proposed adding memory-region*s* as an alternative
>>> name for memory-region to make the naming more consistent with other
>>> types of properties (think clocks, resets, gpios, ...). If we added
>>> that, we could easily differentiate between the "legacy" cases where
>>> no #memory-region-cells was allowed and the new cases where it was.
>>>
>>>> Second, it could be the bootloader setting up the reserved region. If a 
>>>> node already has 'memory-region', then adding more regions is more 
>>>> complicated compared to adding new properties. And defining what each 
>>>> memory-region entry is or how many in schemas is impossible.
>>>
>>> It's true that updating the property gets a bit complicated, but it's
>>> not exactly rocket science. We really just need to splice the array. I
>>> have a working implemention for this in U-Boot.
>>>
>>> For what it's worth, we could run into the same issue with any new
>>> property that we add. Even if we renamed this to iommu-memory-region,
>>> it's still possible that a bootloader may have to update this property
>>> if it already exists (it could be hard-coded in DT, or it could have
>>> been added by some earlier bootloader or firmware).
>>>
>>>> Both could be addressed with a new property. Perhaps something like 
>>>> 'iommu-memory-region = <&phandle>;'. I think the 'iommu' prefix is 
>>>> appropriate given this is entirely because of the IOMMU being in the 
>>>> mix. I might feel differently if we had other uses for cells, but I 
>>>> don't really see it in this case. 
>>>
>>> I'm afraid that down the road we'll end up with other cases and then we
>>> might proliferate a number of *-memory-region properties with varying
>>> prefixes.
>>>
>>> I am aware of one other case where we might need something like this: on
>>> some Tegra SoCs we have audio processors that will access memory buffers
>>> using a DMA engine. These processors are booted from early firmware
>>> using firmware from system memory. In order to avoid trashing the
>>> firmware, we need to reserve memory. We can do this using reserved
>>> memory nodes. However, the audio DMA engine also uses the SMMU, so we
>>> need to make sure that the firmware memory is marked as reserved within
>>> the SMMU. This is similar to the identity mapping case, but not exactly
>>> the same. Instead of creating a 1:1 mapping, we just want that IOVA
>>> region to be reserved (i.e. IOMMU_RESV_RESERVED instead of
>>> IOMMU_RESV_DIRECT{,_RELAXABLE}).
>>>
>>> That would also fall into the IOMMU domain, but we can't reuse the
>>> iommu-memory-region property for that because then we don't have enough
>>> information to decide which type of reservation we need.
>>>
>>> We could obviously make iommu-memory-region take a specifier, but we
>>> could just as well use memory-regions in that case since we have
>>> something more generic anyway.
>>>
>>> With the #memory-region-cells proposal, we can easily extend the cell in
>>> the specifier with an additional MEMORY_REGION_IOMMU_RESERVE flag to
>>> take that other use case into account. If we than also change to the new
>>> memory-regions property name, we avoid the ABI issue (and we gain a bit
>>> of consistency while at it).
>>
>> Ping? Rob, do you want me to add this second use-case to the patch
>> series to make it more obvious that this isn't just a one-off thing? Or
>> how do we proceed?
> 
> Rob, given that additional use-case, do you want me to run with this
> proposal and send out an updated series?


What about variant with a "descriptor" properties that will describe
each region:

fb_desc: display-framebuffer-memory-descriptor {
	needs-identity-mapping;
}

display@52400000 {
	memory-region = <&fb ...>;
	memory-region-descriptor = <&fb_desc ...>;
};

It could be a more flexible/extendible variant.
