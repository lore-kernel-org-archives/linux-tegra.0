Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B46C8C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 22:05:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B625A61A28
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 22:05:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbhCZWFY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 18:05:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbhCZWFQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 18:05:16 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AD87C0613AA
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 15:05:14 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 75so9837713lfa.2
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 15:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=G5yzMCApy6O7S/RSlef+ZgO2MSUdSYoxvQuorExVMKg=;
        b=F74pKwCJoCGxE9l7Uq0FgU8kb13gxXZeD/+EcUlhaq/UvxbpCgrQh610hH0pVbRpqD
         l9v5UTYeutdVz0fviNnu3DdRdktD/TqObA/qJo/00JeGhsh6WSyLFx5qswRPKyyN4RbU
         9cIA+wdrjYBbsGYYs5jHadfl4v1c6zoHCRQmRNtue2YncLpd/zR6/qSDrYabp1AMN0XK
         ReKNONyIhRMNawlWhm3FMraUo47vRBv296xn0QUEIb5/v2uND85AMQj6/W8mtJqYz6bH
         n3OWfPfq3iQDlmu9uaveJE7gs8uRb5bbB0/lE3HTUiVAaGHwNI31DXPcVzmep6drHNdi
         HogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=G5yzMCApy6O7S/RSlef+ZgO2MSUdSYoxvQuorExVMKg=;
        b=RS4TujWcSEKGXtwCoANC+YFnon1PKnSyltBkFQBQEyRRfriUirRIbouWR9i3k/8jOd
         5xUfDpChDWp/IZTUnKUe96GD+0uRfPy577zyNc6FXk/Iel2+D61BiHFpp53kev4nVdHj
         FP9muf/Fekyelu1vCdrRd7AV3ETUBHRQ4IJciRcYSu+MfXTa3O2hu306uZorwGEwwtgo
         DGrAnAwKL3CBy4D7oxGU1Tu96uQ/YPPCG4ScUbdhqHtop5aqpBPA83qMRIBveW6W+4OI
         Sb2hCICMy6a7acZZkhSnExIQ/wsjCsIQMgK80KmmanE14dskGsPjuQFSrxfQd8w1iS8Z
         vRuQ==
X-Gm-Message-State: AOAM530yr8qz46E4Y/0Agzvi/bWs6aJr3eLQ58+USHSAWpXwZRx6RBm1
        ve955muASxS++tWYQRFhzMX0tXtbZrQ=
X-Google-Smtp-Source: ABdhPJwMzGhKFlOsQPSHtlb9KsLIs4Sw19Bk7S4L7KHJR+ZKz6h00VjoCZ0514xBbyeAXN8ElDBF8Q==
X-Received: by 2002:ac2:41d4:: with SMTP id d20mr9001216lfi.213.1616796313096;
        Fri, 26 Mar 2021 15:05:13 -0700 (PDT)
Received: from ?IPv6:2a00:1370:814d:99a9:a10:76ff:fe69:21b6? ([2a00:1370:814d:99a9:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id v18sm1310844ljg.85.2021.03.26.15.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Mar 2021 15:05:12 -0700 (PDT)
Subject: Re: [PATCH 0/9] arm64: tegra: Prevent early SMMU faults
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        iommu@lists.linux-foundation.org,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210325130332.778208-1-thierry.reding@gmail.com>
 <197876d1-0046-f673-5d3e-818d1002542b@gmail.com>
 <YF4NQPee+/Qi6zVd@orome.fritz.box>
 <9f1a8455-f7a6-1f66-f36c-032abacf71f5@gmail.com>
Message-ID: <06af34f8-19f4-97d1-d703-fd91dcdc6309@gmail.com>
Date:   Sat, 27 Mar 2021 01:05:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <9f1a8455-f7a6-1f66-f36c-032abacf71f5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

26.03.2021 19:55, Dmitry Osipenko пишет:
> 26.03.2021 19:35, Thierry Reding пишет:
>> On Fri, Mar 26, 2021 at 06:29:28PM +0300, Dmitry Osipenko wrote:
>>> 25.03.2021 16:03, Thierry Reding пишет:
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
>>>
>>> It is an interesting idea which inspired me to try to apply a somewhat similar thing to Tegra SMMU driver by holding the SMMU ASID enable-bit until display driver allows to toggle it. This means that we will need an extra small tegra-specific SMMU API function, but it should be okay.
>>>
>>> I typed a patch and seems it's working good, I'll prepare a proper patch if you like it.
>>
>> That would actually be working around the problem that this patch was
>> supposed to prepare for. The reason for this current patch series is to
>> make sure SMMU translation isn't enabled until a device has actually
>> been attached to the SMMU. Once it has been attached, the assumption is
>> that any identity mappings will have been created.
>>
>> One Tegra SMMU that shouldn't be a problem because translations aren't
>> enabled until device attach time. So in other words this patch set is to
>> get Tegra186 and later to parity with earlier chips from this point of
>> view.
>>
>> I think the problem that you're trying to work around is better solved
>> by establishing these identity mappings. I do have patches to implement
>> this for Tegra210 and earlier, though they may require additional work
>> if you have bootloaders that don't use standard DT bindings for passing
>> information about the framebuffer to the kernel.
> 
> I'm not sure what else reasonable could be done without upgrading to a
> very specific version of firmware, which definitely isn't a variant for
> older devices which have a wild variety of bootloaders, customized
> use-cases and etc.
> 
> We could add a kludge that I'm suggesting as a universal fallback
> solution, it should work well for all cases that I care about.
> 
> So we could have the variant with identity mappings, and if mapping
> isn't provided, then fall back to the kludge.
> 

I tried a slightly different variant of the kludge by holding the ASID's
enable till the first mapping is created for the display clients and
IOMMU_DOMAIN_DMA now works properly (no EMEM errors on boot and etc) and
without a need to change the DC driver.

I also tried to remove the arm_iommu_detach_device() from the VDE driver
and we now have 3 implicit domains in use (DRM, HX, VDE[wasted]) + 1
explicit (VDE) on T30, which works okay for today. So technically we
could support the IOMMU_DOMAIN_DMA with a couple small changes right now
or at least revert the hacks that were needed for Nyan.

But in order to enable IOMMU_DOMAIN_DMA properly, we will need to do
something about the DMA mappings first in the DRM driver and I also
found that implicit IOMMU somehow doesn't work for host1x driver at all,
so this needs to be fixed too.
