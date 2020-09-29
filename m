Return-Path: <SRS0=kaSA=DG=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A87E0C2D0A8
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 00:18:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D32D2075A
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 00:18:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KVViTjv7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbgI2ASD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Sep 2020 20:18:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbgI2ASC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Sep 2020 20:18:02 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8C26C061755;
        Mon, 28 Sep 2020 17:18:01 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id z17so3360885lfi.12;
        Mon, 28 Sep 2020 17:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LWyAFftzTgQ/8ZzQPra6i4Q9NzonWukybh/xqSD4SNY=;
        b=KVViTjv7RofB3mbilJ2qmNPZNQQZQ2SkADTKbbPfsgHfvKhDmG8TMVEnLO+2Krmjrm
         OQJFHEfjvECuHHMGCafV5snickVdo8dhrl+Q2j/yh3Hbq2kvm9teu9Rpn0tG5lPPi6Qe
         zyUuHkY5yn/SIMD6H4Jy7HupHIvoCpS8dk2IyVuXQxrHzo7NQMgkPIrqzNul7mQiDMVI
         53dSdLsumgoB2js+usNGms5nvdcz2QhLsOFimGfizTbkV18pygYDl5jCyz0vR3u+trvg
         FZ1+dk2qbQRZV6u9X6LBvV53Xv6MDgESnLeqnfjhdNEaHzrsnkWWhro1xHp45PKiHMJt
         BN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LWyAFftzTgQ/8ZzQPra6i4Q9NzonWukybh/xqSD4SNY=;
        b=WNzXMQr865qKtg2VKbxmfXWGs44mEtAxEG8PI+A4X7LakheaESTZMAr89ZBFCwMK7K
         Bo0BplKWT+JtVkyf342aj3ck5RqEPD0CBjjdYtguJL60Sh3f/WXJMZnaK9RdGlJ6Mgbm
         om5MP7k5zKkvVFWsuAxEf60X6ib4eqAeWZ7MbqWJwAB8gk210En5q+KhBRdbn+ecHOoG
         g9UASIoFLDomCuiCj7Z3kvbgrbr5kPjrFt4b3XcYZc+Is6ac7O0kxvaHsXLM4jxKaaHw
         QAA651ZilOXq7eOry/gau/mahBbu3HBu+Bvvb309R+frXMOuMeZMQI6wmX32WQeabH+a
         9IRQ==
X-Gm-Message-State: AOAM530rMYmsA2WKQSL9+FTK7T9R8d1pLcZup5eNVH1Y96K0F1vLo7T1
        IppPT1223sD07uhS1vfMh6cyeRKGyUU=
X-Google-Smtp-Source: ABdhPJwFazCF3sQTeRk6md9P7UFhr2ln8RaMSsv5Xi844x9rjX1AdEJnCbCVu/UtUBG0dljKX7XY9Q==
X-Received: by 2002:ac2:4424:: with SMTP id w4mr217288lfl.447.1601338679960;
        Mon, 28 Sep 2020 17:17:59 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id x25sm2990589lfe.284.2020.09.28.17.17.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2020 17:17:59 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] iommu/tegra-smmu: Expend mutex protection range
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20200928235901.28337-1-nicoleotsuka@gmail.com>
 <20200928235901.28337-3-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <692b51fa-7a3e-dee7-b628-7cb2d2dc188d@gmail.com>
Date:   Tue, 29 Sep 2020 03:17:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200928235901.28337-3-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

...
>  static bool tegra_smmu_capable(enum iommu_cap cap)
> @@ -420,17 +413,21 @@ static int tegra_smmu_as_prepare(struct tegra_smmu *smmu,
>  				 struct tegra_smmu_as *as)
>  {
>  	u32 value;
> -	int err;
> +	int err = 0;
> +
> +	mutex_lock(&smmu->lock);
>  
>  	if (as->use_count > 0) {
>  		as->use_count++;
> -		return 0;
> +		goto err_unlock;

This looks a bit odd because it's not a error condition. Perhaps should
be better to "goto bump_usecount"?

Or make it similar to tegra_smmu_as_unprepare()?

>  	}
>  
>  	as->pd_dma = dma_map_page(smmu->dev, as->pd, 0, SMMU_SIZE_PD,
>  				  DMA_TO_DEVICE);
> -	if (dma_mapping_error(smmu->dev, as->pd_dma))
> -		return -ENOMEM;
> +	if (dma_mapping_error(smmu->dev, as->pd_dma)) {
> +		err = -ENOMEM;
> +		goto err_unlock;
> +	}
>  
>  	/* We can't handle 64-bit DMA addresses */
>  	if (!smmu_dma_addr_valid(smmu, as->pd_dma)) {
> @@ -453,24 +450,35 @@ static int tegra_smmu_as_prepare(struct tegra_smmu *smmu,
>  	as->smmu = smmu;

bump_usecount:

>  	as->use_count++;
>  
> +	mutex_unlock(&smmu->lock);
> +
>  	return 0;
>  
>  err_unmap:
>  	dma_unmap_page(smmu->dev, as->pd_dma, SMMU_SIZE_PD, DMA_TO_DEVICE);
> +err_unlock:
> +	mutex_unlock(&smmu->lock);
> +
>  	return err;
>  }
>  
>  static void tegra_smmu_as_unprepare(struct tegra_smmu *smmu,
>  				    struct tegra_smmu_as *as)
>  {
> -	if (--as->use_count > 0)
> +	mutex_lock(&smmu->lock);
> +
> +	if (--as->use_count > 0) {
> +		mutex_unlock(&smmu->lock);
>  		return;
> +	}
>  
>  	tegra_smmu_free_asid(smmu, as->id);
>  
>  	dma_unmap_page(smmu->dev, as->pd_dma, SMMU_SIZE_PD, DMA_TO_DEVICE);
>  
>  	as->smmu = NULL;
> +
> +	mutex_unlock(&smmu->lock);
>  }
>  
>  static int tegra_smmu_attach_dev(struct iommu_domain *domain,
> 

