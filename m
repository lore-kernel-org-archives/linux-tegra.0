Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B2BC433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Mar 2021 19:14:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E1E364FB1
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Mar 2021 19:14:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230512AbhCJTNx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 10 Mar 2021 14:13:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbhCJTNq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Mar 2021 14:13:46 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06571C061760;
        Wed, 10 Mar 2021 11:13:46 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id v2so22377438lft.9;
        Wed, 10 Mar 2021 11:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TGVo84MkssIIGFaMlWeB/GdWruWqeKFsQWqj4qPbSMU=;
        b=HbsI8I4tO0QXv6SbFoersQnW7puDohAmS/pM6fJaJGkWRSDeZFhNtTCNZEeEzA6s+X
         w2Xp3MfPGHCIZI8D3kxV8emCwmZBLGtFVt9BJbPcvCb77qeFQqHINFY39+LXwMJz7YDo
         BH6NshzUCP5G985lVE7NGXKZQLR/bgCjoeUATpkxGHpSlnVKYealzTtrIgNiETrsJiag
         jkc4Yvb0+n6QSSBWBu82vYWbspP7U15YPQwg5glY//VxIi9WmTWSomUZulhKKFC8HbIj
         NGVjufjAZgw1q1Wu8EdF/QCZpEN3KeUo46kx0SdRb0bHdnsYa4uHvrBtck4Z7AHFa+Nz
         JnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TGVo84MkssIIGFaMlWeB/GdWruWqeKFsQWqj4qPbSMU=;
        b=Qb4+PvqBib69YGh/yl360eSoipMUrP9xPSTjI6CiCsposYfWb9P364Z5mxxfbViXIT
         8/Yk7krfx1AI0sxvIZ6UklKV4xt668HtQXf0p48iNRRzfuPXxFBVFgrF+oTgn0B3Xqbv
         nehSIYJ52s/C4eu0cBv82y3IHuKt09vE07HvJUKbrHZoHULxFD3WQeh/bpfdxLX9d/32
         OylSZY82M61WkIdBWgi8OKALErMC49yFNv7268s1yvCBOFkVP7EqC8Ed3bhIn7HsbTWk
         jodi9NyY49SFfQprQjI2UVPS8LK3aaHdF6+wnSxscrn2iRTlSOF3Do3yrlUHngBduubZ
         sQwg==
X-Gm-Message-State: AOAM531vCga3e0XDSRXTD83wQNABfpTGDPTnjUza+4MzTthdoXxX+Ptw
        Je9GKTHbzHIVBDn/VuadGsVeezFxl2A=
X-Google-Smtp-Source: ABdhPJxAxsuCKlrBzioldvdKtUXE1MFNfDCFzDMOqQfbX+L9cAYHE5rvNAvBmQKSPjyj37EoksplAw==
X-Received: by 2002:a05:6512:1156:: with SMTP id m22mr2808559lfg.637.1615403624284;
        Wed, 10 Mar 2021 11:13:44 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id k6sm63089lfm.19.2021.03.10.11.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Mar 2021 11:13:43 -0800 (PST)
Subject: Re: [PATCH] iommu/tegra-smmu: Fix mc errors on tegra124-nyan
To:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        thierry.reding@gmail.com, will@kernel.org,
        guillaume.tucker@collabora.com
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20210218220702.1962-1-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a8a7a0af-895f-9d79-410d-5dd03ebbd6dd@gmail.com>
Date:   Wed, 10 Mar 2021 22:13:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210218220702.1962-1-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

19.02.2021 01:07, Nicolin Chen пишет:
> Commit 25938c73cd79 ("iommu/tegra-smmu: Rework tegra_smmu_probe_device()")
> removed certain hack in the tegra_smmu_probe() by relying on IOMMU core to
> of_xlate SMMU's SID per device, so as to get rid of tegra_smmu_find() and
> tegra_smmu_configure() that are typically done in the IOMMU core also.
> 
> This approach works for both existing devices that have DT nodes and other
> devices (like PCI device) that don't exist in DT, on Tegra210 and Tegra3
> upon testing. However, Page Fault errors are reported on tegra124-Nyan:
> 
>   tegra-mc 70019000.memory-controller: display0a: read @0xfe056b40:
> 	 EMEM address decode error (SMMU translation error [--S])
>   tegra-mc 70019000.memory-controller: display0a: read @0xfe056b40:
> 	 Page fault (SMMU translation error [--S])
> 
> After debugging, I found that the mentioned commit changed some function
> callback sequence of tegra-smmu's, resulting in enabling SMMU for display
> client before display driver gets initialized. I couldn't reproduce exact
> same issue on Tegra210 as Tegra124 (arm-32) differs at arch-level code.
> 
> Actually this Page Fault is a known issue, as on most of Tegra platforms,
> display gets enabled by the bootloader for the splash screen feature, so
> it keeps filling the framebuffer memory. A proper fix to this issue is to
> 1:1 linear map the framebuffer memory to IOVA space so the SMMU will have
> the same address as the physical address in its page table. Yet, Thierry
> has been working on the solution above for a year, and it hasn't merged.
> 
> Therefore, let's partially revert the mentioned commit to fix the errors.
> 
> The reason why we do a partial revert here is that we can still set priv
> in ->of_xlate() callback for PCI devices. Meanwhile, devices existing in
> DT, like display, will go through tegra_smmu_configure() at the stage of
> bus_set_iommu() when SMMU gets probed(), as what it did before we merged
> the mentioned commit.
> 
> Once we have the linear map solution for framebuffer memory, this change
> can be cleaned away.
> 
> [Big thank to Guillaume who reported and helped debugging/verification]
> 
> Fixes: 25938c73cd79 ("iommu/tegra-smmu: Rework tegra_smmu_probe_device()")
> Reported-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
> 
> Guillaume, would you please give a "Tested-by" to this change? Thanks!
> 
>  drivers/iommu/tegra-smmu.c | 72 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 71 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 4a3f095a1c26..97eb62f667d2 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -798,10 +798,70 @@ static phys_addr_t tegra_smmu_iova_to_phys(struct iommu_domain *domain,
>  	return SMMU_PFN_PHYS(pfn) + SMMU_OFFSET_IN_PAGE(iova);
>  }
>  
> +static struct tegra_smmu *tegra_smmu_find(struct device_node *np)
> +{
> +	struct platform_device *pdev;
> +	struct tegra_mc *mc;
> +
> +	pdev = of_find_device_by_node(np);
> +	if (!pdev)
> +		return NULL;
> +
> +	mc = platform_get_drvdata(pdev);
> +	if (!mc)
> +		return NULL;
> +
> +	return mc->smmu;
> +}
> +
> +static int tegra_smmu_configure(struct tegra_smmu *smmu, struct device *dev,
> +				struct of_phandle_args *args)
> +{
> +	const struct iommu_ops *ops = smmu->iommu.ops;
> +	int err;
> +
> +	err = iommu_fwspec_init(dev, &dev->of_node->fwnode, ops);
> +	if (err < 0) {
> +		dev_err(dev, "failed to initialize fwspec: %d\n", err);
> +		return err;
> +	}
> +
> +	err = ops->of_xlate(dev, args);
> +	if (err < 0) {
> +		dev_err(dev, "failed to parse SW group ID: %d\n", err);
> +		iommu_fwspec_free(dev);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
>  static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
>  {
> -	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
> +	struct device_node *np = dev->of_node;
> +	struct tegra_smmu *smmu = NULL;
> +	struct of_phandle_args args;
> +	unsigned int index = 0;
> +	int err;
> +
> +	while (of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
> +					  &args) == 0) {
> +		smmu = tegra_smmu_find(args.np);
> +		if (smmu) {
> +			err = tegra_smmu_configure(smmu, dev, &args);
> +			of_node_put(args.np);
>  
> +			if (err < 0)
> +				return ERR_PTR(err);
> +
> +			break;
> +		}
> +
> +		of_node_put(args.np);
> +		index++;
> +	}
> +
> +	smmu = dev_iommu_priv_get(dev);
>  	if (!smmu)
>  		return ERR_PTR(-ENODEV);
>  
> @@ -1028,6 +1088,16 @@ struct tegra_smmu *tegra_smmu_probe(struct device *dev,
>  	if (!smmu)
>  		return ERR_PTR(-ENOMEM);
>  
> +	/*
> +	 * This is a bit of a hack. Ideally we'd want to simply return this
> +	 * value. However the IOMMU registration process will attempt to add
> +	 * all devices to the IOMMU when bus_set_iommu() is called. In order
> +	 * not to rely on global variables to track the IOMMU instance, we
> +	 * set it here so that it can be looked up from the .probe_device()
> +	 * callback via the IOMMU device's .drvdata field.
> +	 */
> +	mc->smmu = smmu;
> +
>  	size = BITS_TO_LONGS(soc->num_asids) * sizeof(long);
>  
>  	smmu->asids = devm_kzalloc(dev, size, GFP_KERNEL);
> 

I found that this patch introduced a serious regression on Tegra30 using
today's linux-next. Tegra30 has two 3d h/w blocks connected in SLI and
only one of the blocks is now attached to IOMMU domain, meaning that GPU
is unusable now. All 3d, 2d and display devices share the same "DRM"
group on Tegra30.

Nicolin, please let me know if have any suggestions. I may take a closer
look a day later, for now I'll just revert this patch locally. Thanks in
advance.
