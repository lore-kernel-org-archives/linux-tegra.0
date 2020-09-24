Return-Path: <SRS0=yNrD=DB=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FB1C2D0E2
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Sep 2020 16:23:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3410C2388A
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Sep 2020 16:23:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rvPYgeoG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728215AbgIXQXj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Sep 2020 12:23:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726516AbgIXQXi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Sep 2020 12:23:38 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82996C0613CE;
        Thu, 24 Sep 2020 09:23:38 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id u4so3246805ljd.10;
        Thu, 24 Sep 2020 09:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rXDOx2mvBDbgFQ4LiwLuFoINfDk5unrylnExfiSRRW8=;
        b=rvPYgeoGDzXZeRPcZQK62TH3R2MDcuhsWdsTmI23ucqCdQf+wjz4nU/vCCD36bPJpm
         haagIOVfmfMqROL1Ayrvp67KFx3wSc+4pAJS6rtWd/k8hjf/ZnvGFC05D8g0TwsqcVxK
         3JxT6SXZbafxc3CquYd7Z5wU6GoKi7L20VViusORw5f0CJ409K/pIzWa+NSsUAyMHIDl
         tZwygVFKjsqQpVvGkX6GX45Y42jcTxjSbsg5t/G2CiCkRiUcuxSwfCEscgvhq2sBsNcJ
         WEAsHRGTE5sHVurMcK4ZJEEv4v6pha+5BQOtL3wNekvCYjZ8N59XIkMLhue/hRaW9suK
         LudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rXDOx2mvBDbgFQ4LiwLuFoINfDk5unrylnExfiSRRW8=;
        b=mk9qmEXsjHEtKuh419ux/ixfxeUSUezR9iT1v0G16fK7P9bmWBqsU+GiBLwObyIXya
         F3VaDkj23dBfXcVfmIMydBJAtnmaw97zSB36yWU877+Eoie9zb4ADX9u3NFyoz69AIgq
         F8d2rOLfd9klXsLamGLz2ziwj+A1Ddaglph4X1ebihBKbHmuF+Es1dt6pRFIFhelMGz2
         kpmqDpmchZP+SdMnU82aB8cZJW/bglZvssboxUU22Rqw15vVgE23iHmOLrLyJ5ZA0J+K
         oNMAWviQsqHG9n7U6mA06rUw2cTS9v3/9giIyyRML/DChEhX/PQuoPO79rAfgGKlbyo3
         /wRw==
X-Gm-Message-State: AOAM530gzuJcjyMJBWHL58a6rW9HZUATSpiy3Hy43v2fNkN0iu67eLQE
        Tad49YbYqCPIHBxY+8oF0zsEWseJLRk=
X-Google-Smtp-Source: ABdhPJyBm0/ATuaYoFADCmLQvb89iuLnCKAQ6DJdr0lEMsnFCR7F71xsJ3rxyIfDG8u0IUOcevhy0Q==
X-Received: by 2002:a2e:8017:: with SMTP id j23mr192462ljg.108.1600964616577;
        Thu, 24 Sep 2020 09:23:36 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id m1sm2441300lfr.32.2020.09.24.09.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2020 09:23:35 -0700 (PDT)
Subject: Re: [PATCH v2 1/4] dt-bindings: reserved-memory: Document "active"
 property
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20200904130000.691933-1-thierry.reding@gmail.com>
 <d3d69cb4-b0f9-40b0-b526-52fdc1a4b876@gmail.com>
 <20200924140130.GA2527337@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ba16b795-34df-8f8c-3376-3d629cc30f8b@gmail.com>
Date:   Thu, 24 Sep 2020 19:23:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924140130.GA2527337@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

24.09.2020 17:01, Thierry Reding пишет:
> On Thu, Sep 24, 2020 at 04:23:59PM +0300, Dmitry Osipenko wrote:
>> 04.09.2020 15:59, Thierry Reding пишет:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> Reserved memory regions can be marked as "active" if hardware is
>>> expected to access the regions during boot and before the operating
>>> system can take control. One example where this is useful is for the
>>> operating system to infer whether the region needs to be identity-
>>> mapped through an IOMMU.
>>>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>  .../bindings/reserved-memory/reserved-memory.txt           | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>>> index 4dd20de6977f..163d2927e4fc 100644
>>> --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>>> +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>>> @@ -63,6 +63,13 @@ reusable (optional) - empty property
>>>        able to reclaim it back. Typically that means that the operating
>>>        system can use that region to store volatile or cached data that
>>>        can be otherwise regenerated or migrated elsewhere.
>>> +active (optional) - empty property
>>> +    - If this property is set for a reserved memory region, it indicates
>>> +      that some piece of hardware may be actively accessing this region.
>>> +      Should the operating system want to enable IOMMU protection for a
>>> +      device, all active memory regions must have been identity-mapped
>>> +      in order to ensure that non-quiescent hardware during boot can
>>> +      continue to access the memory.
>>>  
>>>  Linux implementation note:
>>>  - If a "linux,cma-default" property is present, then Linux will use the
>>>
>>
>> Hi,
>>
>> Could you please explain what devices need this quirk? I see that you're
>> targeting Tegra SMMU driver, which means that it should be some pre-T186
>> device.
> 
> Primarily I'm looking at Tegra210 and later, because on earlier devices
> the bootloader doesn't consistently initialize display. I know that it
> does on some devices, but not all of them.

AFAIK, all tablet devices starting with Tegra20 that have display panel
are initializing display at a boot time for showing splash screen. This
includes all T20/T30/T114 tablets that are already supported by upstream
kernel.

> This same code should also
> work on Tegra186 and later (with an ARM SMMU) although the situation is
> slightly more complicated there because IOMMU translations will fault by
> default long before these identity mappings can be established.
> 
>> Is this reservation needed for some device that has display
>> hardwired to a very specific IOMMU domain at the boot time?
> 
> No, this is only used to convey information about the active framebuffer
> to the kernel. In practice the DMA/IOMMU code will use this information
> to establish a 1:1 mapping on whatever IOMMU domain that was picked for
> display.
> 
>> If you're targeting devices that don't have IOMMU enabled by default at
>> the boot time, then this approach won't work for the existing devices
>> which won't ever get an updated bootloader.
> 
> If the devices don't use an IOMMU, then there should be no problem. The
> extra reserved-memory nodes would still be necessary to ensure that the
> kernel doesn't reuse the framebuffer memory for the slab allocator, but
> if no IOMMU is used, then the display controller accessing the memory
> isn't going to cause problems other than perhaps scanning out data that
> is no longer a framebuffer.
> 
> There should also be no problem for devices with an old bootloader
> because this code is triggered by the presence of a reserved-memory node
> referenced via the memory-region property. Devices with an old
> bootloader should continue to work as they did before. Although I
> suppose they would start faulting once we enable DMA/IOMMU integration
> for Tegra SMMU if they have a bootloader that does initialize display to
> actively scan out during boot.
> 
>> I think Robin Murphy already suggested that we should simply create
>> a dummy "identity" IOMMU domain by default for the DRM/VDE devices and
>> then replace it with an explicitly created domain within the drivers.
> 
> I don't recall reading about that suggestion. So does this mean that for
> certain devices we'd want to basically passthrough by default and then
> at some point during boot take over with a properly managed IOMMU
> domain?

Yes, my understanding that this is what Robin suggested here:

https://lore.kernel.org/linux-iommu/cb12808b-7316-19db-7413-b7f852a6f8ae@arm.com/

> The primary goal here is to move towards using the DMA API rather than
> the IOMMU API directly, so we don't really have the option of replacing
> with an explicitly created domain. Unless we have code in the DMA/IOMMU
> code that does this somehow.
> 
> But I'm not sure what would be a good way to mark certain devices as
> needing an identity domain by default. Do we still use the reserved-
> memory node for that?

The reserved-memory indeed shouldn't be needed for resolving the
implicit IOMMU problem since we could mark certain devices within the
kernel IOMMU driver.

I haven't got around to trying to implement the implicit IOMMU support
yet, but I suppose we could implement the def_domain_type() hook in the
SMMU driver and then return IOMMU_DOMAIN_IDENTITY for the Display/VDE
devices. Then the Display/VDE drivers will take over the identity domain
and replace it with the explicit domain.

> That would still require some sort of flag to
> specify which reserved-memory regions would need this identity mapping
> because, as was pointed out in earlier review, some devices may have
> reserved-memory regions that are not meant to be identity mapped.

Please note that the reserved-memory approach also creates problem for
selection of a large CMA region if FB is located somewhere in a middle
of DRAM.

I already see that the FB's reserved-memory will break CMA for Nexus 7
and Acer A500 because CMA area overlaps with the bootloader's FB :)

Also keep in mind that initrd needs a location too and location usually
hardwired in a bootloader. Hence it increases pressure on the CMA selection.

>> Secondly, all NVIDIA bootloaders are passing tegra_fbmem=... via
>> kernel's cmdline with the physical location of the framebuffer in
>> memory. Maybe we could support this option?
> 
> I'm not a big fan of that command-line option, but I also realize that
> for older bootloaders that's probably the only option we have. I don't
> suppose all of the devices support U-Boot?

Majority of devices in a wild don't use u-boot and they have a
locked-down bootloader. Still it's possible to chain-load u-boot or
bypass the "security" and replace the bootloader, but these approaches
aren't widely supported because they take a lot of effort to be
implemented and maintained.

Even those devices that use proper u-boot usually never updating it and
are running some ancient version. You can't ignore all those people :)

> Because ideally we'd just
> translate from tegra_fbmem=... to reserved-memory region there so that
> we don't have to carry backwards-compatibility code for these purely
> downstream bootloaders.

IIRC, in the past Robin Murphy was suggesting to read out hardware state
early during kernel boot in order to find what regions are in use by
hardware.

I think it should be easy to do for the display controller since we
could check clock and PD states in order to decide whether DC's IO could
be accessed and then read out the FB pointer and size. I guess it should
take about hundred lines of code.

But the easiest way should be to ignore this trouble for devices that
have IOMMU disabled by default and simply allow display to show garbage.
Nobody ever complained about this for the past 7+ years :)

Hence implementing the dummy-identity domain support should be enough
for solving the problem, at least this should work for pre-T186 devices.
