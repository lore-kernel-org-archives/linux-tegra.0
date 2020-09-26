Return-Path: <SRS0=NmuO=DD=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CA1C4741F
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 22:18:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00CD9238D6
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 22:18:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MMVMy8XA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbgIZWSS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 26 Sep 2020 18:18:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgIZWSS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 26 Sep 2020 18:18:18 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAA51C0613CE;
        Sat, 26 Sep 2020 15:18:17 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id m5so6807494lfp.7;
        Sat, 26 Sep 2020 15:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lE/AC9bxBW83uM+HIDXwlkhKItngXZopMBpfvrstmyk=;
        b=MMVMy8XAeJuOZHcFkqxvLQrgmKcUV63chHs3W25SNnFr9148jM6nHY2ovh4oF0QE6c
         jhtvG31t4Mq9+5jaOidpFB09HeFHYzofMbmBI+E/drIZvB3BbwWbf9t+h6xD2DYEItku
         IhWp2VWmb4Kbmx2X/EWnRolQfJW9H4MqjUyo8lo6XDA2//YxLu+cZhK//Yc0twvuebqo
         bYIOE+4Cfbs4EX1Y0b3/l6TGfO8SpuUKrSvNsuxr7WRBmQNOUWNfKJ3cZMvM4x9DEX8m
         wfoZX8D896K3NqdLZmRRO7kUqQS/PrqhVOk3D9TWot62/raq+FmXBB8+ef68CtMGChtu
         kHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lE/AC9bxBW83uM+HIDXwlkhKItngXZopMBpfvrstmyk=;
        b=mVl+YpQmPOJdZ7RyssssMt0zag4cmOs53R1taaNrj3kodAwoDkSfMmd1+OM75nNv/y
         mdXZT8bOhoHgpTz6dmcfdQLSPsr08ikIAQxblElWYjjBfw8MV5pg08vDL+JHDLMT4Cdh
         tfw+ozhAUT7NzTwlmafxtWIjqX1NFMJ5Zo3AqCHFnYTI5flG1mNTVdgw6Ump8aWB1DL5
         OUVW18I/82zYpI3tGC3uL+GnXpVpa9PSmZAPqsM8OhmyZHAW+Q3J296ChR138/yI1Hg2
         d1qmZX8g+6/r06VssBU7r5dHkW1HlGGZg0o5gHgdMKPiSGle1FUZ2DkOkZsieZ/opWU3
         NXUw==
X-Gm-Message-State: AOAM533YFykwcmPJvTfGXdIZWygM9PlbZO7QOalBnK/ZFF3SFvU2SSwL
        pYcLtxFj5WNYCauMM2+i6oQBp4s87M4=
X-Google-Smtp-Source: ABdhPJwPPewtePgrxJeTjV075852NV+KAjHbpk+ELT2P0eGddHeapSuRqXwoj/vq73zaQITGyV5qsA==
X-Received: by 2002:a05:6512:2101:: with SMTP id q1mr1782412lfr.157.1601158696395;
        Sat, 26 Sep 2020 15:18:16 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id n3sm2138553lfq.274.2020.09.26.15.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2020 15:18:15 -0700 (PDT)
Subject: Re: [PATCH 4/5] iommu/tegra-smmu: Add PCI support
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org, krzk@kernel.org
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, jonathanh@nvidia.com
References: <20200926080719.6822-1-nicoleotsuka@gmail.com>
 <20200926080719.6822-5-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b95b69fb-8570-f5dc-c486-b94958f2a791@gmail.com>
Date:   Sun, 27 Sep 2020 01:18:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200926080719.6822-5-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

26.09.2020 11:07, Nicolin Chen пишет:
...
> +#ifdef CONFIG_PCI
> +	if (!iommu_present(&pci_bus_type)) {

Is this iommu_present() check really needed?

> +		pci_request_acs();

Shouldn't pci_request_acs() be invoked *after* bus_set_iommu() succeeds?

> +		err = bus_set_iommu(&pci_bus_type, &tegra_smmu_ops);
> +		if (err < 0) {
> +			bus_set_iommu(&platform_bus_type, NULL);
> +			iommu_device_unregister(&smmu->iommu);
> +			iommu_device_sysfs_remove(&smmu->iommu);
> +			return ERR_PTR(err);
> +		}
> +	}
> +#endif
> +
>  	if (IS_ENABLED(CONFIG_DEBUG_FS))
>  		tegra_smmu_debugfs_init(smmu);
>  
> 

