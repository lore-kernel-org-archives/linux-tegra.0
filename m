Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB68FC4646B
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Mar 2021 00:07:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC38264EEE
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Mar 2021 00:07:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231882AbhCCX7u (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 Mar 2021 18:59:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1843026AbhCCKYe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 3 Mar 2021 05:24:34 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF722C08EB2F;
        Wed,  3 Mar 2021 01:47:31 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id z11so36037157lfb.9;
        Wed, 03 Mar 2021 01:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5LbPB3SpTXsri4vi58yOUepQCtx4lRVynCRCrXYDWhk=;
        b=iBM34Nq5+BjX+uL4bxGvM1OldEbB8bsiriV6mA0YdKunWfydVZxt3BQE8NZkBQ5A4l
         MUsL+8TPfqMlgKLk7mtcz6iLPwP4DQlmmmwqCUTpSXLeTBGsvA9iynKHaNeS8lGv2d1t
         I1zQlao/FYaW2hTwuANkJNvihvwp00XYtwjwfTPrY0YoVYwPCQIbyhe6P3IGSU5dHAyE
         MziklxFAWZqwEgtjlr0FiyJywx5DJYw5vhS1HGoAeZdCjtIxS10kyKaYtxQA+Iy7zZy+
         Qs+IZqqznZE8DF3EPcwZBbA9pQEbo9htOdISZ3cn/DsR3sX+9vRSkSDQ9ZNcMkMHjvoX
         WVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5LbPB3SpTXsri4vi58yOUepQCtx4lRVynCRCrXYDWhk=;
        b=USBlfKwU/b6Mu6n7gqkafkVKs0UFlfD/YFSZphwqW/kvQ5ZALInasutI7kFeZN3O0a
         2NCwZz/gIntHqe3vfmTp0SlOos6EASAmB1ls4hSsUIyF+Voht+IGtvPD4BmcFD6U1OUd
         a+YZORZNJwgMYpXZPSf/eiurE/DtNFjdf9UERVWPHRvVUNXQqhAAzBj4oLuVrEepZC6+
         6DgqXtYicvUtCVUAEPA+cwJtEmLJR++1sWI8x3sutxqQzNyg4KsPYgEDRvpgR/77veVy
         yPmY61XZSgZB+Z8Uv65gvCWFKF4g8ASKgbOszz+LYEsOv+gQS+jgBUmY0NNxnvfgqzMo
         mDBA==
X-Gm-Message-State: AOAM531WAroJgiPvPkzWoaVlRy4GXUgg6klccgcG4kUOf8gW1ahGrFBu
        zc0y7bCGfkss1gOWMa6iBLHL9OlUGsw=
X-Google-Smtp-Source: ABdhPJy0ChQDSEQFEFYwJAY/lp6QPtMzorgpdnThkpJMvj+mgwIDqI2VfCm7n5De5jouxa1PQd6U1Q==
X-Received: by 2002:a19:8197:: with SMTP id c145mr14892915lfd.655.1614764849889;
        Wed, 03 Mar 2021 01:47:29 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id k8sm2920796lfg.41.2021.03.03.01.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Mar 2021 01:47:29 -0800 (PST)
Subject: Re: [PATCH] iommu/tegra-smmu: Fix mc errors on tegra124-nyan
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, thierry.reding@gmail.com, will@kernel.org,
        guillaume.tucker@collabora.com, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20210218220702.1962-1-nicoleotsuka@gmail.com>
 <9d6445c0-9574-1650-e327-32b11716f87e@gmail.com>
 <20210223021343.GA6539@Asurada-Nvidia>
 <79bb1248-497f-8adf-663b-74448bea3849@gmail.com>
 <20210225062742.GA13353@Asurada-Nvidia>
 <ee0f40f4-dffe-2987-5d4b-c5896f27ec24@gmail.com>
 <20210302230856.GA22992@Asurada-Nvidia>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4a407ad8-33cb-94e9-398a-78fa65178e08@gmail.com>
Date:   Wed, 3 Mar 2021 12:47:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210302230856.GA22992@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

03.03.2021 02:08, Nicolin Chen пишет:
> On Sat, Feb 27, 2021 at 12:59:17PM +0300, Dmitry Osipenko wrote:
>> 25.02.2021 09:27, Nicolin Chen пишет:
>> ...
>>>> The partially revert should be okay, but it's not clear to me what makes
>>>> difference for T124 since I don't see that problem on T30, which also
>>>> has active display at a boot time.
>>>
>>> Hmm..do you see ->attach_dev() is called from host1x_client_iommu_attach
>>> or from of_dma_configure_id/arch_setup_dma_ops?
>>>
>>
>> I applied yours debug-patch, please see dmesg.txt attached to the email.
>> Seems probe-defer of the tegra-dc driver prevents the implicit
>> tegra_smmu_attach_dev, so it happens to work by accident.
> 
>> [    0.327826] tegra-dc 54200000.dc: -------tegra_smmu_of_xlate: id 1
>> [    0.328641] [<c052ec75>] (tegra_smmu_of_xlate) from [<c052e591>] (of_iommu_xlate+0x51/0x70)
>> [    0.328740] [<c052e591>] (of_iommu_xlate) from [<c052e6d7>] (of_iommu_configure+0x127/0x150)
>> [    0.328896] [<c052e6d7>] (of_iommu_configure) from [<c073f697>] (of_dma_configure_id+0x1fb/0x2ec)
>> [    0.329060] [<c073f697>] (of_dma_configure_id) from [<c059743f>] (really_probe+0x7b/0x2a0)
>> [    0.331438] tegra-dc 54200000.dc: --------tegra_smmu_probe_device, 822
>> [    0.332234] [<c052ebed>] (tegra_smmu_probe_device) from [<c052bd6d>] (__iommu_probe_device+0x35/0x1c4)
>> [    0.332391] [<c052bd6d>] (__iommu_probe_device) from [<c052c3cd>] (iommu_probe_device+0x19/0xec)
>> [    0.332545] [<c052c3cd>] (iommu_probe_device) from [<c052e6ab>] (of_iommu_configure+0xfb/0x150)
>> [    0.332701] [<c052e6ab>] (of_iommu_configure) from [<c073f697>] (of_dma_configure_id+0x1fb/0x2ec)
>> [    0.332804] [<c073f697>] (of_dma_configure_id) from [<c059743f>] (really_probe+0x7b/0x2a0)
>> [    0.335202] tegra-dc 54200000.dc: ---------iommu_group_get_for_dev, 1572
>> [    0.335292] tegra-dc 54200000.dc: ---------tegra_smmu_device_group, 862
>> [    0.335474] tegra-dc 54200000.dc: ---------tegra_smmu_device_group, 909: 1: drm
>> [    0.335566] tegra-dc 54200000.dc: ---------iommu_group_get_for_dev, 1574
>> [    0.335718] tegra-dc 54200000.dc: ---------iommu_group_add_device, 858
>> [    0.335862] tegra-dc 54200000.dc: Adding to iommu group 1
>> [    0.335955] tegra-dc 54200000.dc: ---------iommu_alloc_default_domain, 1543: type 3
>> [    0.336101] iommu: ------iommu_group_alloc_default_domain: platform, (null), drm
>> [    0.336187] ---------tegra_smmu_domain_alloc, 284: type 3
>  [    0.336968] [<c0a0ff45>] (tegra_smmu_domain_alloc) from [<c0a0f87b>] (iommu_group_alloc_default_domain+0x4b/0xfa)
>> [    0.337127] [<c0a0f87b>] (iommu_group_alloc_default_domain) from [<c052c41d>] (iommu_probe_device+0x69/0xec)
>> [    0.337285] [<c052c41d>] (iommu_probe_device) from [<c052e6ab>] (of_iommu_configure+0xfb/0x150)
>> [    0.337441] [<c052e6ab>] (of_iommu_configure) from [<c073f697>] (of_dma_configure_id+0x1fb/0x2ec)
>> [    0.337599] [<c073f697>] (of_dma_configure_id) from [<c059743f>] (really_probe+0x7b/0x2a0)
>> [    0.339913] tegra-dc 54200000.dc: ---------iommu_probe_device, 272
>> [    0.348144] tegra-dc 54200000.dc: failed to probe RGB output: -517
> 
> Hmm..not sure where this EPROBE_DEFER comes from.

DC driver on Nexus 7 depends on LVDS bridge and display panel, which
cause the probe defer.

> But you are right,
> as of_dma_configure_id() returns because of that so it didn't run to
> arch_setup_dma_ops() call, which allocates an UNMANAGED iommu domain
> and attaches DC to it on Tegra124.
> 
> By the way, anyone can accept this change? It doesn't feel right to
> leave a regression in the newer release...
> 

I think Thierry should give ack.
