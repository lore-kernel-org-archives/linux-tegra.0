Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB05BC4727E
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 14:41:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A45B62076B
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 14:41:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEMQ+z3X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730387AbgI3Olp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 10:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728149AbgI3Olp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 10:41:45 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37162C061755;
        Wed, 30 Sep 2020 07:41:45 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id b22so2426686lfs.13;
        Wed, 30 Sep 2020 07:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=d/fQGHk0RGcvSyO7Alc7YxaloLPaa9kMj4sfJ/VwT08=;
        b=BEMQ+z3XJa7zab6wRr0sP48ke26xdy1Qs34DjaVa2NyLiI6OoDNLwVTaZbwtlln4+j
         9BNKM1M/hsNreK7GTRJAjEwM247uejaFNZ1YNM/d7MYlrFpsUY2HFvdfQ3D27d8xf7o7
         foD10cJWXgKmctzfd4cPQfrcmTOP08/w1eoIj9i8dSkVQ/lL6OuNRNWUA8QS6OzWD4WA
         4ntbzOLMZ4oJ4YIpe44MfXvvt1iyc3TVsHnlP4t4lpd2711WAVoeTkaD0MHIxRfs60uV
         o+N6BXFrLW2UvkMOcTuFSk44rQoFu5r/rfKkjHdy26g17bstyasiIhctIEE8MNMdB5Zg
         FAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d/fQGHk0RGcvSyO7Alc7YxaloLPaa9kMj4sfJ/VwT08=;
        b=lRaTUNkxU9+et8IzRzf4PN7xT69jxB3z7eixO4t+peowxo862/HZyl0Hv1OVto/SG5
         8nHK5gc6fMXMOoc1Cf5ZfkcJVfSLVgfqSNGASbxUK39QM9Aab6KcNtQRAyO/MxH/BKDS
         ab1i+aKbRzFjhuvYBu7P0MMo64K2mlCl+zCvULEUqITol4gnaOmQd1lrGYDVTYylRsWK
         00HkiRxc4GrAtfIFQ4xUl//Hel+vdnO/3dedb8sMgTYHxTo18pTwiFbpXpmyHzUsDsj2
         7EwAqUX6SKNPc4YY5ITsZJ+99TFoOKOwT2vKIL5fIGV6lbXuAqBp2+7h6+bz0DOd/2CY
         bPHg==
X-Gm-Message-State: AOAM530S6e6tFp1mMBvydoa0KIqh1Klf4IRy6JaeTzJNXdXR44lNIDlX
        32Th1Y/DvMr5FEtED0iNM2bg9OGqt5g=
X-Google-Smtp-Source: ABdhPJxyN664IN3UyNlM/y7PUcbpe0h2+VOfS9ltqOMC7lfWQIEr88+UNPiqe6pRxBZTt8xbZqdrjg==
X-Received: by 2002:a19:12:: with SMTP id 18mr1001563lfa.237.1601476903445;
        Wed, 30 Sep 2020 07:41:43 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id q6sm176381ljg.115.2020.09.30.07.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 07:41:42 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org, krzk@kernel.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <01728f61-df0c-291d-5589-4468be25f00c@gmail.com>
Date:   Wed, 30 Sep 2020 17:41:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930084258.25493-3-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

...
> +	struct tegra_mc *mc = devm_tegra_get_memory_controller(dev);
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>  
> -		of_node_put(args.np);
> -		index++;
> -	}
> +	/* An invalid mc pointer means mc and smmu drivers are not ready */
> +	if (IS_ERR(mc))
> +		return ERR_PTR(-EPROBE_DEFER);
>  
> -	if (!smmu)
> +	/*
> +	 * IOMMU core allows -ENODEV return to carry on. So bypass any call
> +	 * from bus_set_iommu() during tegra_smmu_probe(), as a device will
> +	 * call in again via of_iommu_configure when fwspec is prepared.
> +	 */
> +	if (!mc->smmu || !fwspec || fwspec->ops != &tegra_smmu_ops)
>  		return ERR_PTR(-ENODEV);
>  
> -	return &smmu->iommu;
> +	dev_iommu_priv_set(dev, mc->smmu);
> +
> +	return &mc->smmu->iommu;
>  }

Is it really okay to use devm_tegra_get_memory_controller() here?

I assume it should be more preferred to do it only for devices that have
fwspec->ops == &tegra_smmu_ops.

Secondly, it also looks to me that a non-devm variant should be more
appropriate here because tegra_smmu_probe_device() isn't invoked by the
devices themselves.
