Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BFFAC433DB
	for <linux-tegra@archiver.kernel.org>; Sun, 28 Mar 2021 15:26:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2C8D61972
	for <linux-tegra@archiver.kernel.org>; Sun, 28 Mar 2021 15:26:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbhC1P0V (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 28 Mar 2021 11:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231164AbhC1PZ4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 28 Mar 2021 11:25:56 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FDD0C061756;
        Sun, 28 Mar 2021 08:25:56 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id b83so14656840lfd.11;
        Sun, 28 Mar 2021 08:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yWgXgnuxyCskNmdhptIRCCfqISn1pqp583fvHTE3ICU=;
        b=ToOzBl/uzUtaCKE2NX3S1oSAnMgQzM3Uvqc2H+ZGmYf6YHR7hQ2MrTm0+jOVOLsW4/
         QgQqgOfc35gqE66uUYbHpPFSWIcBlx4FCITznvzV64TYNA8Hz2QgDp58lpXVAnkES4Bj
         WmnMpAGRTZkybdnRr0iDrfxqMOmwGgVs7s/SihQaTC1T4bLoBRXjNwwlGdJWWwLuJ9NY
         MJCnZuJ5oPrXNP8T9QgOazhnbTs9WuFxzIFDtW1/Sujf7+R9879+npsWDCOTkVBP+Ov4
         1nvrNDno6CKl4IR9dzmQ4rPyPoGTTyUvctp+TIBvcTrvLOuYpKgzYgQpqxCRytdQmX1B
         luew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yWgXgnuxyCskNmdhptIRCCfqISn1pqp583fvHTE3ICU=;
        b=eRrsn+gLMjbjHyXdg5y4R3ht0MAT6mCvwPcEgbwbUqC5fVJVw3rI1zHd6ubJNjh4pl
         BNPFZ+WRp6033juonBc21navj/1tDHUTrazPqK8UAhKU8SFdQC/EQ5xGWEQTF+ZWxm5p
         H1sSP0JBPpvGjco+kgz2Xh1zQIgPjfTjZRxD8GRJ5Tb2FMTmj+SI4OvpmQzOwC/+qgcl
         kvpi7bVWsEPxjWx7K5Exsx0FKkz9TaAC449TpxCjri2cK9/hmtJHqVlRPnkUlSeK+Eg/
         bhR4sFXQ9sJlIasG3i0ztU6jwr0mwF2OB2h6cUQazI9TjoMnQdiKTM0J6jx09kVBgOWU
         OsKA==
X-Gm-Message-State: AOAM5336lHC/bDIByeDDrgruULNOcqPAB254hfXRO0f6mZjh3mV/BcK/
        SnNU8rwpNVX4mRCugRcOqwUNpTi1Y+Y=
X-Google-Smtp-Source: ABdhPJyid7S3WWsGZ7urc3w3nHJZDu7b0XCg47mSj4BLnQA+JLgg/CCV8XR6+2vgP2p8UFva2AyNMw==
X-Received: by 2002:a19:9109:: with SMTP id t9mr14165910lfd.49.1616945154357;
        Sun, 28 Mar 2021 08:25:54 -0700 (PDT)
Received: from ?IPv6:2a00:1370:814d:b259:a10:76ff:fe69:21b6? ([2a00:1370:814d:b259:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id z28sm2147208ljn.117.2021.03.28.08.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Mar 2021 08:25:53 -0700 (PDT)
Subject: Re: [PATCH] iommu/tegra-smmu: Fix mc errors on tegra124-nyan
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com
Cc:     joro@8bytes.org, will@kernel.org, guillaume.tucker@collabora.com,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20210218220702.1962-1-nicoleotsuka@gmail.com>
 <9d6445c0-9574-1650-e327-32b11716f87e@gmail.com>
 <20210223021343.GA6539@Asurada-Nvidia>
 <79bb1248-497f-8adf-663b-74448bea3849@gmail.com>
 <20210225062742.GA13353@Asurada-Nvidia>
 <ee0f40f4-dffe-2987-5d4b-c5896f27ec24@gmail.com>
 <20210302230856.GA22992@Asurada-Nvidia>
 <4a407ad8-33cb-94e9-398a-78fa65178e08@gmail.com>
Message-ID: <94f8f949-197c-e8fc-38d9-74360dca8c51@gmail.com>
Date:   Sun, 28 Mar 2021 18:25:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4a407ad8-33cb-94e9-398a-78fa65178e08@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

03.03.2021 12:47, Dmitry Osipenko пишет:
> 03.03.2021 02:08, Nicolin Chen пишет:
>> On Sat, Feb 27, 2021 at 12:59:17PM +0300, Dmitry Osipenko wrote:
>>> 25.02.2021 09:27, Nicolin Chen пишет:
>>> ...
>>>>> The partially revert should be okay, but it's not clear to me what makes
>>>>> difference for T124 since I don't see that problem on T30, which also
>>>>> has active display at a boot time.
>>>> Hmm..do you see ->attach_dev() is called from host1x_client_iommu_attach
>>>> or from of_dma_configure_id/arch_setup_dma_ops?
>>>>
>>> I applied yours debug-patch, please see dmesg.txt attached to the email.
>>> Seems probe-defer of the tegra-dc driver prevents the implicit
>>> tegra_smmu_attach_dev, so it happens to work by accident.
>>> [    0.327826] tegra-dc 54200000.dc: -------tegra_smmu_of_xlate: id 1
>>> [    0.328641] [<c052ec75>] (tegra_smmu_of_xlate) from [<c052e591>] (of_iommu_xlate+0x51/0x70)
>>> [    0.328740] [<c052e591>] (of_iommu_xlate) from [<c052e6d7>] (of_iommu_configure+0x127/0x150)
>>> [    0.328896] [<c052e6d7>] (of_iommu_configure) from [<c073f697>] (of_dma_configure_id+0x1fb/0x2ec)
>>> [    0.329060] [<c073f697>] (of_dma_configure_id) from [<c059743f>] (really_probe+0x7b/0x2a0)
>>> [    0.331438] tegra-dc 54200000.dc: --------tegra_smmu_probe_device, 822
>>> [    0.332234] [<c052ebed>] (tegra_smmu_probe_device) from [<c052bd6d>] (__iommu_probe_device+0x35/0x1c4)
>>> [    0.332391] [<c052bd6d>] (__iommu_probe_device) from [<c052c3cd>] (iommu_probe_device+0x19/0xec)
>>> [    0.332545] [<c052c3cd>] (iommu_probe_device) from [<c052e6ab>] (of_iommu_configure+0xfb/0x150)
>>> [    0.332701] [<c052e6ab>] (of_iommu_configure) from [<c073f697>] (of_dma_configure_id+0x1fb/0x2ec)
>>> [    0.332804] [<c073f697>] (of_dma_configure_id) from [<c059743f>] (really_probe+0x7b/0x2a0)
>>> [    0.335202] tegra-dc 54200000.dc: ---------iommu_group_get_for_dev, 1572
>>> [    0.335292] tegra-dc 54200000.dc: ---------tegra_smmu_device_group, 862
>>> [    0.335474] tegra-dc 54200000.dc: ---------tegra_smmu_device_group, 909: 1: drm
>>> [    0.335566] tegra-dc 54200000.dc: ---------iommu_group_get_for_dev, 1574
>>> [    0.335718] tegra-dc 54200000.dc: ---------iommu_group_add_device, 858
>>> [    0.335862] tegra-dc 54200000.dc: Adding to iommu group 1
>>> [    0.335955] tegra-dc 54200000.dc: ---------iommu_alloc_default_domain, 1543: type 3
>>> [    0.336101] iommu: ------iommu_group_alloc_default_domain: platform, (null), drm
>>> [    0.336187] ---------tegra_smmu_domain_alloc, 284: type 3
>>  [    0.336968] [<c0a0ff45>] (tegra_smmu_domain_alloc) from [<c0a0f87b>] (iommu_group_alloc_default_domain+0x4b/0xfa)
>>> [    0.337127] [<c0a0f87b>] (iommu_group_alloc_default_domain) from [<c052c41d>] (iommu_probe_device+0x69/0xec)
>>> [    0.337285] [<c052c41d>] (iommu_probe_device) from [<c052e6ab>] (of_iommu_configure+0xfb/0x150)
>>> [    0.337441] [<c052e6ab>] (of_iommu_configure) from [<c073f697>] (of_dma_configure_id+0x1fb/0x2ec)
>>> [    0.337599] [<c073f697>] (of_dma_configure_id) from [<c059743f>] (really_probe+0x7b/0x2a0)
>>> [    0.339913] tegra-dc 54200000.dc: ---------iommu_probe_device, 272
>>> [    0.348144] tegra-dc 54200000.dc: failed to probe RGB output: -517
>> Hmm..not sure where this EPROBE_DEFER comes from.
> DC driver on Nexus 7 depends on LVDS bridge and display panel, which
> cause the probe defer.
> 
>> But you are right,
>> as of_dma_configure_id() returns because of that so it didn't run to
>> arch_setup_dma_ops() call, which allocates an UNMANAGED iommu domain
>> and attaches DC to it on Tegra124.
>>
>> By the way, anyone can accept this change? It doesn't feel right to
>> leave a regression in the newer release...

Guys, I have a good and bad news.

The good news is that I figured out why I didn't see this problem on
Nexus 7 and the reason is that I had CONFIG_ARM_DMA_USE_IOMMU=n.

The other good news is that I have a simple workaround which fixes the
implicit IOMMU problem by deferring the ASID enabling for display clients.

The bad news is that CONFIG_ARM_DMA_USE_IOMMU=y breaks GPU (DRM, host1x)
drivers because they aren't properly prepared to this case and
CONFIG_ARM_DMA_USE_IOMMU is enabled in multi-platform kernel config. I
will try to fix up the drivers, but not sure how much time this may take.
