Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B147BC433C1
	for <linux-tegra@archiver.kernel.org>; Sun, 28 Mar 2021 15:37:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7879D61976
	for <linux-tegra@archiver.kernel.org>; Sun, 28 Mar 2021 15:37:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbhC1Pgw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 28 Mar 2021 11:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbhC1Pgr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 28 Mar 2021 11:36:47 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84CCDC061756;
        Sun, 28 Mar 2021 08:36:46 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id z8so13059780ljm.12;
        Sun, 28 Mar 2021 08:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4McCAtm/bgYfEvyy6rwiTH7xGHWa8NKknSEfmeF9cro=;
        b=JjOH+vLDlZTRgODNsnxEA3Qad9ZZO7kp9drxRf4eVuyjWvJSt7y5EgCqyQsiiGH+1H
         CXF3FBFNig0cAK1y4S8Gd9J/sMUOCkKCc6f0zFlc5xmMKgpqKpK56JcrIYs0bF+U76um
         yHJY0nBos3xXxZW/As3///NEgv8DEFC5le2pX7biJuw0Q27RdrCkyP+xZ+UUPLw0POTW
         eaCu6VLrtSsOEoLztxp+EGGf2eqhkKwLYACYyTKLntTTiRzvsjzN3HeTW6n5tbxe6/Tv
         FKjMAKJEb2xBrmWjkNdQxBNZhW/dLQRcsPg1e0Zy5DhgkRILQslHn4nJppuuj2RemcyK
         yqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4McCAtm/bgYfEvyy6rwiTH7xGHWa8NKknSEfmeF9cro=;
        b=jJ+CWBBQE2flKFnMc6lGPfcxBv2aNUJ9CXbGci34MIcI3pCF7182+swovevOxxtFlF
         FAC9gZv3B2I290+S2ucAavSXF4gjzRi7Om3IqPMVioNPBxxzDMCwF4OmQIvNmZIVBO5x
         I9ejJubxegHevpu9c9Wztov+8alzG2Dfdh3c7xdcjWQLoG/iar7GUQtSHM010UARquM1
         AF6BFI1ZC2nNhUXz8TGFDialLfn3p9K4qvhNxr6Kr5+obA3zGpCXuW7srqs6f9yoW0TO
         GNOmODNcfsBvbwTIJUMqv9a/ynq46wagoHVBurFDAUUjBDahU9FzBuaKaLGr5K9lBxiX
         4tow==
X-Gm-Message-State: AOAM532rQl8z3QRfTBraO+zIHFMvsnHeYPHgXVF6/doH16Sh4Jd1RXt7
        WneipgXumzn8/YIkLJbv9WCeSmHIiRc=
X-Google-Smtp-Source: ABdhPJzfJzm0Y5jnPOR/i07q0qCt3tFIfqvC/u2H0GBy/FuPgEqkpdtkZiKccT0LosHkzt1ZS6bgMg==
X-Received: by 2002:a2e:9a0a:: with SMTP id o10mr15113901lji.243.1616945804830;
        Sun, 28 Mar 2021 08:36:44 -0700 (PDT)
Received: from ?IPv6:2a00:1370:814d:b259:a10:76ff:fe69:21b6? ([2a00:1370:814d:b259:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id d26sm1512544lfl.84.2021.03.28.08.36.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Mar 2021 08:36:44 -0700 (PDT)
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
 <94f8f949-197c-e8fc-38d9-74360dca8c51@gmail.com>
Message-ID: <4e2391af-8423-bee6-e45b-f4b434b1e9b0@gmail.com>
Date:   Sun, 28 Mar 2021 18:36:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <94f8f949-197c-e8fc-38d9-74360dca8c51@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

28.03.2021 18:25, Dmitry Osipenko пишет:
> 03.03.2021 12:47, Dmitry Osipenko пишет:
>> 03.03.2021 02:08, Nicolin Chen пишет:
>>> On Sat, Feb 27, 2021 at 12:59:17PM +0300, Dmitry Osipenko wrote:
>>>> 25.02.2021 09:27, Nicolin Chen пишет:
>>>> ...
>>>>>> The partially revert should be okay, but it's not clear to me what makes
>>>>>> difference for T124 since I don't see that problem on T30, which also
>>>>>> has active display at a boot time.
>>>>> Hmm..do you see ->attach_dev() is called from host1x_client_iommu_attach
>>>>> or from of_dma_configure_id/arch_setup_dma_ops?
>>>>>
>>>> I applied yours debug-patch, please see dmesg.txt attached to the email.
>>>> Seems probe-defer of the tegra-dc driver prevents the implicit
>>>> tegra_smmu_attach_dev, so it happens to work by accident.
>>>> [    0.327826] tegra-dc 54200000.dc: -------tegra_smmu_of_xlate: id 1
>>>> [    0.328641] [<c052ec75>] (tegra_smmu_of_xlate) from [<c052e591>] (of_iommu_xlate+0x51/0x70)
>>>> [    0.328740] [<c052e591>] (of_iommu_xlate) from [<c052e6d7>] (of_iommu_configure+0x127/0x150)
>>>> [    0.328896] [<c052e6d7>] (of_iommu_configure) from [<c073f697>] (of_dma_configure_id+0x1fb/0x2ec)
>>>> [    0.329060] [<c073f697>] (of_dma_configure_id) from [<c059743f>] (really_probe+0x7b/0x2a0)
>>>> [    0.331438] tegra-dc 54200000.dc: --------tegra_smmu_probe_device, 822
>>>> [    0.332234] [<c052ebed>] (tegra_smmu_probe_device) from [<c052bd6d>] (__iommu_probe_device+0x35/0x1c4)
>>>> [    0.332391] [<c052bd6d>] (__iommu_probe_device) from [<c052c3cd>] (iommu_probe_device+0x19/0xec)
>>>> [    0.332545] [<c052c3cd>] (iommu_probe_device) from [<c052e6ab>] (of_iommu_configure+0xfb/0x150)
>>>> [    0.332701] [<c052e6ab>] (of_iommu_configure) from [<c073f697>] (of_dma_configure_id+0x1fb/0x2ec)
>>>> [    0.332804] [<c073f697>] (of_dma_configure_id) from [<c059743f>] (really_probe+0x7b/0x2a0)
>>>> [    0.335202] tegra-dc 54200000.dc: ---------iommu_group_get_for_dev, 1572
>>>> [    0.335292] tegra-dc 54200000.dc: ---------tegra_smmu_device_group, 862
>>>> [    0.335474] tegra-dc 54200000.dc: ---------tegra_smmu_device_group, 909: 1: drm
>>>> [    0.335566] tegra-dc 54200000.dc: ---------iommu_group_get_for_dev, 1574
>>>> [    0.335718] tegra-dc 54200000.dc: ---------iommu_group_add_device, 858
>>>> [    0.335862] tegra-dc 54200000.dc: Adding to iommu group 1
>>>> [    0.335955] tegra-dc 54200000.dc: ---------iommu_alloc_default_domain, 1543: type 3
>>>> [    0.336101] iommu: ------iommu_group_alloc_default_domain: platform, (null), drm
>>>> [    0.336187] ---------tegra_smmu_domain_alloc, 284: type 3
>>>  [    0.336968] [<c0a0ff45>] (tegra_smmu_domain_alloc) from [<c0a0f87b>] (iommu_group_alloc_default_domain+0x4b/0xfa)
>>>> [    0.337127] [<c0a0f87b>] (iommu_group_alloc_default_domain) from [<c052c41d>] (iommu_probe_device+0x69/0xec)
>>>> [    0.337285] [<c052c41d>] (iommu_probe_device) from [<c052e6ab>] (of_iommu_configure+0xfb/0x150)
>>>> [    0.337441] [<c052e6ab>] (of_iommu_configure) from [<c073f697>] (of_dma_configure_id+0x1fb/0x2ec)
>>>> [    0.337599] [<c073f697>] (of_dma_configure_id) from [<c059743f>] (really_probe+0x7b/0x2a0)
>>>> [    0.339913] tegra-dc 54200000.dc: ---------iommu_probe_device, 272
>>>> [    0.348144] tegra-dc 54200000.dc: failed to probe RGB output: -517
>>> Hmm..not sure where this EPROBE_DEFER comes from.
>> DC driver on Nexus 7 depends on LVDS bridge and display panel, which
>> cause the probe defer.
>>
>>> But you are right,
>>> as of_dma_configure_id() returns because of that so it didn't run to
>>> arch_setup_dma_ops() call, which allocates an UNMANAGED iommu domain
>>> and attaches DC to it on Tegra124.
>>>
>>> By the way, anyone can accept this change? It doesn't feel right to
>>> leave a regression in the newer release...
> 
> Guys, I have a good and bad news.
> 
> The good news is that I figured out why I didn't see this problem on
> Nexus 7 and the reason is that I had CONFIG_ARM_DMA_USE_IOMMU=n.
> 
> The other good news is that I have a simple workaround which fixes the
> implicit IOMMU problem by deferring the ASID enabling for display clients.
> 
> The bad news is that CONFIG_ARM_DMA_USE_IOMMU=y breaks GPU (DRM, host1x)
> drivers because they aren't properly prepared to this case and
> CONFIG_ARM_DMA_USE_IOMMU is enabled in multi-platform kernel config. I
> will try to fix up the drivers, but not sure how much time this may take.
> 

Oh, actually the old workaround with arm_iommu_detach_device() still
works, so we just need to bring it back. I'll prepare the patches.
