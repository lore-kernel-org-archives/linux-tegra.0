Return-Path: <SRS0=6fDB=DJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1470BC4727D
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 14:35:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1AE5206A5
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 14:35:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDLaS+CF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388166AbgJBOf1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Oct 2020 10:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388060AbgJBOf1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Oct 2020 10:35:27 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F4E2C0613D0;
        Fri,  2 Oct 2020 07:35:27 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id x69so2136746lff.3;
        Fri, 02 Oct 2020 07:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nMMO21NGQohJ9bqWbYFSMA1hjk7n59RS3N1fM462izU=;
        b=hDLaS+CFrLkGzrGXeTn3pNGf1DvIlMbXEcEk8FJJ0EuMOD4Xj4lxl2Smemd3ETzxO9
         CZyI9wpcWnpNtRMolA0T1qzwvl+at34sqrN/HKJzbRJnTOlT5Rg37JjDIN8ddb0/O1gp
         9XzldlJbHouij2See9rmbKnM8HX7asREsX4nDtBlbdMrW8QZslX0WaHJuqvl1SRIl5xj
         0hHUNhtE36x8AEHQMaX3pZveOmY1G22s92RKf1bbLT1r9RUKKg/fiJjH+2EpK9n2M5fr
         HRfcwxj5p1S7ml37tqD5tc2Sykd3vxA0z/KTAcenf5VYySJMph2ZaGkS5kpA/LgjVzQJ
         qGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nMMO21NGQohJ9bqWbYFSMA1hjk7n59RS3N1fM462izU=;
        b=PxOFOr/nV5QtFZBKDXLxFT7W6CD5ZIQPCJkXPwiOnpSiTi1n8Zb+IjQIvMFOW0SIns
         fya92frWjmfCfzOqSQ5pL2+ASGbqCVJHMtsk1RcRKGrM31J76OZhgu31GJQkQYMgy4u4
         lhURvLbGJ/oBoqjCgCDTTIVM34ZI1pOkaEmKJpFa77ZB7XxCfCh9Rhc7l84RtMR53HGq
         qu6FkVMiF9SbA7r4thcPOVD3RqVkm48j7cVgFfArgTMtnwL+9vzeLI4pefeirpV3PxR6
         1M77odIEmgS+I+bti2lgM0PLvbOW+9EUSevSXpa+WnPyT815Iqi6tKmw4V0hWm8jZ4nM
         X50Q==
X-Gm-Message-State: AOAM5331KkwVuT9h1GSmhA6AONOqhkvY5dadDRMcSH351Srl9TiBrl5k
        p4tnuQb0v6iJ6VH9UzT4C6OpeCFCA4Q=
X-Google-Smtp-Source: ABdhPJw1g7K2tJz51ldPxPgHLCyl68AFUOvce119apKPVPHnp6oe13Q3cBIqaNXKI470Du7pJRs7mg==
X-Received: by 2002:a19:4a58:: with SMTP id x85mr956117lfa.168.1601649325320;
        Fri, 02 Oct 2020 07:35:25 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru. [109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id 78sm330330lfn.20.2020.10.02.07.35.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 07:35:24 -0700 (PDT)
Subject: Re: [PATCH v4 3/3] iommu/tegra-smmu: Add PCI support
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-4-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <eba0d5ff-dfb2-7c17-50c2-5709c506f62e@gmail.com>
Date:   Fri, 2 Oct 2020 17:35:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002060807.32138-4-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

02.10.2020 09:08, Nicolin Chen пишет:
> @@ -865,7 +866,11 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
>  	group->smmu = smmu;
>  	group->soc = soc;
>  
> -	group->group = iommu_group_alloc();
> +	if (dev_is_pci(dev))
> +		group->group = pci_device_group(dev);
> +	else
> +		group->group = generic_device_group(dev);
> +
>  	if (IS_ERR(group->group)) {
>  		devm_kfree(smmu->dev, group);
>  		mutex_unlock(&smmu->lock);
> @@ -1069,22 +1074,32 @@ struct tegra_smmu *tegra_smmu_probe(struct device *dev,
>  	iommu_device_set_fwnode(&smmu->iommu, dev->fwnode);
>  
>  	err = iommu_device_register(&smmu->iommu);
> -	if (err) {
> -		iommu_device_sysfs_remove(&smmu->iommu);
> -		return ERR_PTR(err);
> -	}
> +	if (err)
> +		goto err_sysfs;
>  
>  	err = bus_set_iommu(&platform_bus_type, &tegra_smmu_ops);
> -	if (err < 0) {
> -		iommu_device_unregister(&smmu->iommu);
> -		iommu_device_sysfs_remove(&smmu->iommu);
> -		return ERR_PTR(err);
> -	}
> +	if (err < 0)
> +		goto err_unregister;
> +
> +#ifdef CONFIG_PCI
> +	err = bus_set_iommu(&pci_bus_type, &tegra_smmu_ops);
> +	if (err < 0)
> +		goto err_bus_set;
> +#endif
>  
>  	if (IS_ENABLED(CONFIG_DEBUG_FS))
>  		tegra_smmu_debugfs_init(smmu);
>  
>  	return smmu;
> +
> +err_bus_set: __maybe_unused;

__maybe_unused?
