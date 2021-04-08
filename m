Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 020E8C433ED
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Apr 2021 14:20:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3DC5610A3
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Apr 2021 14:20:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231855AbhDHOUi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Apr 2021 10:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231659AbhDHOUh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Apr 2021 10:20:37 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7710C061760;
        Thu,  8 Apr 2021 07:20:24 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id g8so4281721lfv.12;
        Thu, 08 Apr 2021 07:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6ZUCnaK/xfsxPOQ2rbUPGAW6lKLbLTcOBL5UmGQ3BRA=;
        b=bMF34VHNGxUVn9JbInOqXPCz4CByZeQfYkeeFnl0kcfNHeCKviOxyjEzDdkywsQ2GF
         zRUKduzjhd9RMG1AgnQ8IWMweHH8Twvq/U4Ni5sTEpyFyFMqbzj0HukEdCaewvqrsK8+
         ngovfgYSgo8wMOAfxUJXmMj4v6WSAOWlGTdNdS6pOTsk1ePFaC6DdUv/vqAQfp6uswuH
         2b+W55x4kie+Qm6Iime4EPsrw40AYESASX3VAQwxl+7duikXrCj4dqKg1SkNbLfy0ddg
         ga105BfsBcCcXXWgTccIWnSKeRHnTQZw0GUX8oQTSFx+8zn0i74st1XQLpIhMSyuQT8R
         mKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6ZUCnaK/xfsxPOQ2rbUPGAW6lKLbLTcOBL5UmGQ3BRA=;
        b=lCBTnb+ZCfLA5V521SXb6ArVNydRqofteT6wUTO/ecM0d+s40lAKqcHH7uwSsgHBvY
         vve1X/ejD/BWmBI8L28SBVg+JkNXOpNHFFHFrUuOa4e/t/x6hyqCmMjdgzHsdbDrH/Cd
         3RNuVKXvErWHihkTW8QJGsfaNagywZorBlWi2qB/+dxj37Q9K85asdgB1GJbu5iHZ2xm
         39G+n/2pOJT6j3uBFOyHmh25rZH/JjkjSyt1XmFQIlxmoSfSw7Z075l60HRhLR6k8TTY
         Wy5X9kjL+Pv8v2s/iHPcE4mW9yD9asDd0z/Ps5DPF9XsKPaU7DDv1oDEog1iBqUEzmYe
         iteA==
X-Gm-Message-State: AOAM530tTpeJHu3lAxiEKRp5pTgbBLrL7srJlWNWS7IJMxvkW26ZO8Ft
        4ePvKacUsFhsIH55EMp6XTpyjw336zI=
X-Google-Smtp-Source: ABdhPJxwOqizkMYPEJb5Y07w8gboGa1QxZdvdT15fW63P7IpYeBenOuiUMuuRcf7YmnyjiuytoptNg==
X-Received: by 2002:ac2:4e6d:: with SMTP id y13mr3990767lfs.509.1617891623227;
        Thu, 08 Apr 2021 07:20:23 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-85.dynamic.spd-mgts.ru. [109.252.193.85])
        by smtp.googlemail.com with ESMTPSA id l12sm2857687lji.122.2021.04.08.07.20.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Apr 2021 07:20:22 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] iommu/tegra-smmu: Defer attachment of display
 clients
To:     Thierry Reding <thierry.reding@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     Joerg Roedel <joro@8bytes.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Will Deacon <will@kernel.org>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210328233256.20494-1-digetx@gmail.com>
 <20210408094241.GA31714@Asurada-Nvidia> <YG8EiUXkgPTZsfIY@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <44d67d66-d6d0-bd9a-9eb9-71d7acc07183@gmail.com>
Date:   Thu, 8 Apr 2021 17:20:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YG8EiUXkgPTZsfIY@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

08.04.2021 16:26, Thierry Reding пишет:
> On Thu, Apr 08, 2021 at 02:42:42AM -0700, Nicolin Chen wrote:
>> On Mon, Mar 29, 2021 at 02:32:55AM +0300, Dmitry Osipenko wrote:
>>> All consumer-grade Android and Chromebook devices show a splash screen
>>> on boot and then display is left enabled when kernel is booted. This
>>> behaviour is unacceptable in a case of implicit IOMMU domains to which
>>> devices are attached during kernel boot since devices, like display
>>> controller, may perform DMA at that time. We can work around this problem
>>> by deferring the enable of SMMU translation for a specific devices,
>>> like a display controller, until the first IOMMU mapping is created,
>>> which works good enough in practice because by that time h/w is already
>>> stopped.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>
>> For both patches:
>> Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
>> Tested-by: Nicolin Chen <nicoleotsuka@gmail.com>
>>
>> The WAR looks good to me. Perhaps Thierry would give some input.

Nicolin, thank you very much for the help!

>> Another topic:
>> I think this may help work around the mc-errors, which we have
>> been facing on Tegra210 also when we enable IOMMU_DOMAIN_DMA.
>> (attached a test patch rebasing on these two)
> 
> Ugh... that's exactly what I was afraid of. Now everybody is going to
> think that we can just work around this issue with driver-specific SMMU
> hacks...
> 
>> However, GPU would also report errors using DMA domain:
>>
>>  nouveau 57000000.gpu: acr: firmware unavailable
>>  nouveau 57000000.gpu: pmu: firmware unavailable
>>  nouveau 57000000.gpu: gr: firmware unavailable
>>  tegra-mc 70019000.memory-controller: gpusrd: read @0x00000000fffbe200: Security violation (TrustZone violation)
>>  nouveau 57000000.gpu: DRM: failed to create kernel channel, -22
>>  tegra-mc 70019000.memory-controller: gpusrd: read @0x00000000fffad000: Security violation (TrustZone violation)
>>  nouveau 57000000.gpu: fifo: SCHED_ERROR 20 []
>>  nouveau 57000000.gpu: fifo: SCHED_ERROR 20 []
>>
>> Looking at the address, seems that GPU allocated memory in 32-bit
>> physical address space behind SMMU, so a violation happened after
>> turning on DMA domain I guess... 
> 
> The problem with GPU is... extra complicated. You're getting these
> faults because you're enabling the IOMMU-backed DMA API, which then
> causes the Nouveau driver allocate buffers using the DMA API instead of
> explicitly allocating pages and then mapping them using the IOMMU API.
> However, there are additional patches needed to teach Nouveau about how
> to deal with SMMU and those haven't been merged yet. I've got prototypes
> of this, but before the whole framebuffer carveout passing work makes
> progress there's little sense in moving individual pieces forward.
> 
> One more not to try and cut corners. We know what the right solution is,
> even if it takes a lot of work. I'm willing to ack this patch, or some
> version of it, but only as a way of working around things we have no
> realistic chance of fixing properly anymore. I still think it would be
> best if we could derive identity mappings from command-line arguments on
> these platforms because I think most of them will actually set that, and
> then the solution becomes at least uniform at the SMMU level.
> 
> For Tegra210 I've already laid out a path to a solution that's going to
> be generic and extend to Tegra186 and later as well.

We still have issues in the DRM and other drivers that don't allow us to
flip ON the IOMMU_DOMAIN_DMA support.

My patch addresses the issue with the ARM_DMA_USE_IOMMU option, which
allocates the unmanaged domain for DMA purposes on ARM32, causing the
trouble in the multiplatform kernel configuration since it's not
possible to opt-out from ARM_DMA_USE_IOMMU in this case. Perhaps this
needs to be clarified in the commit message.

https://elixir.bootlin.com/linux/v5.12-rc6/source/arch/arm/mm/dma-mapping.c#L2078

https://elixir.bootlin.com/linux/v5.12-rc6/source/drivers/iommu/iommu.c#L1929
