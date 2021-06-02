Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B844C47083
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 07:34:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07CAD6138C
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 07:34:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbhFBHfm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Jun 2021 03:35:42 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:45492 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbhFBHfl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Jun 2021 03:35:41 -0400
Received: from mail-wr1-f69.google.com ([209.85.221.69])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1loLO1-0002BB-Aq
        for linux-tegra@vger.kernel.org; Wed, 02 Jun 2021 07:33:57 +0000
Received: by mail-wr1-f69.google.com with SMTP id z4-20020adfe5440000b0290114f89c9931so626464wrm.17
        for <linux-tegra@vger.kernel.org>; Wed, 02 Jun 2021 00:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HClBKpLS3bvtISBUHHdtztmkoTHT8tlXWF46fhCiu1Q=;
        b=MVeeKsIG5otLlfzPPqa2qKoZ1+P6u84dVytEYHYnpGqgNwwd1xoX2b5heqK/V4f0tq
         EW09qR3jCKJFqLpaGqULM71xvNTh7ZaKmh6EditMHJXjcAwmPYezaJHI3bYjvYVyvh+o
         2qHlLa2cCvEXb0LMf1akJsLw16S/ZPJUzwJPf9kpISy4M4sb7JmbGB4ssVeTl2tITjXX
         guUBKmy8b8YLDutrUbLfSThnimT/yej66MCmCe0+PToirnIV/pAxzBLi19J8GPw7UWtw
         IOdY8xNh0IOs9dHY5YDaCj74ZqMIvVBYBIWcuh0CdB4sTNVcL78bY58RxcF5PpPk9w+8
         flXg==
X-Gm-Message-State: AOAM5326VETh96JXISWfHvi+ESM0/z8iFwKANP3uKtCD5hqxB9UFFFFk
        IAolo97Q8sjGQadH0fK6CVF1hoyTpCYe2r6/mX8nbiH+CLKSlgnxNwDhgtKXQ0Srx1/8o7A1ekG
        AZi4t9+fN4bwcI7HR85fGgjhKUPnQeCMVM30Q3MsF
X-Received: by 2002:a05:6000:148:: with SMTP id r8mr32414875wrx.311.1622619236999;
        Wed, 02 Jun 2021 00:33:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQnkoWybqGMGj8ENL2S2XqXPqgS4+4lked9VnSF0GzYamJSAhJ9ADYFKXpPvIHGeavGwK6FQ==
X-Received: by 2002:a05:6000:148:: with SMTP id r8mr32414863wrx.311.1622619236848;
        Wed, 02 Jun 2021 00:33:56 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id x10sm5671551wrt.65.2021.06.02.00.33.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jun 2021 00:33:56 -0700 (PDT)
Subject: Re: [PATCH v2 00/10] arm64: tegra: Prevent early SMMU faults
To:     Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
References: <20210420172619.3782831-1-thierry.reding@gmail.com>
 <YLEi2FonP568wYrE@orome.fritz.box> <20210601122646.GB27832@willie-the-truck>
 <YLZ3qPC8ofjsGkPi@orome.fritz.box>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <6826d892-d1ac-e3b1-ebee-68392d11d7c5@canonical.com>
Date:   Wed, 2 Jun 2021 09:33:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLZ3qPC8ofjsGkPi@orome.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 01/06/2021 20:08, Thierry Reding wrote:
> On Tue, Jun 01, 2021 at 01:26:46PM +0100, Will Deacon wrote:
>> On Fri, May 28, 2021 at 07:05:28PM +0200, Thierry Reding wrote:
>>> On Tue, Apr 20, 2021 at 07:26:09PM +0200, Thierry Reding wrote:
>>>> From: Thierry Reding <treding@nvidia.com>
>>>>
>>>> Hi,
>>>>
>>>> this is a set of patches that is the result of earlier discussions
>>>> regarding early identity mappings that are needed to avoid SMMU faults
>>>> during early boot.
>>>>
>>>> The goal here is to avoid early identity mappings altogether and instead
>>>> postpone the need for the identity mappings to when devices are attached
>>>> to the SMMU. This works by making the SMMU driver coordinate with the
>>>> memory controller driver on when to start enforcing SMMU translations.
>>>> This makes Tegra behave in a more standard way and pushes the code to
>>>> deal with the Tegra-specific programming into the NVIDIA SMMU
>>>> implementation.
>>>>
>>>> Compared to the original version of these patches, I've split the
>>>> preparatory work into a separate patch series because it became very
>>>> large and will be mostly uninteresting for this audience.
>>>>
>>>> Patch 1 provides a mechanism to program SID overrides at runtime. Patch
>>>> 2 updates the ARM SMMU device tree bindings to include the Tegra186
>>>> compatible string as suggested by Robin during review.
>>>>
>>>> Patches 3 and 4 create the fundamentals in the SMMU driver to support
>>>> this and also make this functionality available on Tegra186. Patch 5
>>>> hooks the ARM SMMU up to the memory controller so that the memory client
>>>> stream ID overrides can be programmed at the right time.
>>>>
>>>> Patch 6 extends this mechanism to Tegra186 and patches 7-9 enable all of
>>>> this through device tree updates. Patch 10 is included here to show how
>>>> SMMU will be enabled for display controllers. However, it cannot be
>>>> applied yet because the code to create identity mappings for potentially
>>>> live framebuffers hasn't been merged yet.
>>>>
>>>> The end result is that various peripherals will have SMMU enabled, while
>>>> the display controllers will keep using passthrough, as initially set up
>>>> by firmware. Once the device tree bindings have been accepted and the
>>>> SMMU driver has been updated to create identity mappings for the display
>>>> controllers, they can be hooked up to the SMMU and the code in this
>>>> series will automatically program the SID overrides to enable SMMU
>>>> translations at the right time.
>>>>
>>>> Note that the series creates a compile time dependency between the
>>>> memory controller and IOMMU trees. If it helps I can provide a branch
>>>> for each tree, modelling the dependency, once the series has been
>>>> reviewed.
>>>>
>>>> Changes in v2:
>>>> - split off the preparatory work into a separate series (that needs to
>>>>   be applied first)
>>>> - address review comments by Robin
>>>>
>>>> Thierry
>>>>
>>>> Thierry Reding (10):
>>>>   memory: tegra: Implement SID override programming
>>>>   dt-bindings: arm-smmu: Add Tegra186 compatible string
>>>>   iommu/arm-smmu: Implement ->probe_finalize()
>>>>   iommu/arm-smmu: tegra: Detect number of instances at runtime
>>>>   iommu/arm-smmu: tegra: Implement SID override programming
>>>>   iommu/arm-smmu: Use Tegra implementation on Tegra186
>>>>   arm64: tegra: Use correct compatible string for Tegra186 SMMU
>>>>   arm64: tegra: Hook up memory controller to SMMU on Tegra186
>>>>   arm64: tegra: Enable SMMU support on Tegra194
>>>>   arm64: tegra: Enable SMMU support for display on Tegra194
>>>>
>>>>  .../devicetree/bindings/iommu/arm,smmu.yaml   |  11 +-
>>>>  arch/arm64/boot/dts/nvidia/tegra186.dtsi      |   4 +-
>>>>  arch/arm64/boot/dts/nvidia/tegra194.dtsi      | 166 ++++++++++++++++++
>>>>  drivers/iommu/arm/arm-smmu/arm-smmu-impl.c    |   3 +-
>>>>  drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c  |  90 ++++++++--
>>>>  drivers/iommu/arm/arm-smmu/arm-smmu.c         |  13 ++
>>>>  drivers/iommu/arm/arm-smmu/arm-smmu.h         |   1 +
>>>>  drivers/memory/tegra/mc.c                     |   9 +
>>>>  drivers/memory/tegra/tegra186.c               |  72 ++++++++
>>>>  include/soc/tegra/mc.h                        |   3 +
>>>>  10 files changed, 349 insertions(+), 23 deletions(-)
>>>
>>> Will, Robin,
>>>
>>> do you have any more comments on the ARM SMMU bits of this series? If
>>> not, can you guys provide an Acked-by so that Krzysztof can pick this
>>> (modulo the DT patches) up into the memory-controller tree for v5.14?
>>>
>>> I'll send out a v3 with the bisectibilitiy fix that Krishna pointed
>>> out.
>>
>> Probably best if I queue 3-6 on a separate branch once you send a v3,
>> then Krzysztof can pull that in if he needs it.
> 
> Patch 5 has a build-time dependency on patch 1, so they need to go in
> together. The reason why I suggested Krzysztof pick these up is because
> there is a restructuring series that this depends on, which will go into
> Krzysztof's tree. So in order to pull in 3-6, you'd get a bunch of other
> and mostly unrelated stuff as well.

I missed that part... what other series are needed for this one? Except
Dmitry's power management set I do not have anything in my sight for
Tegras memory controllers.

Anyway, I can take the memory bits and provide a stable tag with these.
Recently there was quite a lot work around Tegra memory controllers, so
this makes especially sense if new patches appear.

> 
> Alternatively I can set this all up on stable branches and send out pull
> requests for both you and Krzysztof to merge. Or if this is all too
> complicated and you'd just prefer to ack the patches I could also take
> this through ARM SoC via the Tegra tree.
> 
> Thierry
> 


Best regards,
Krzysztof
