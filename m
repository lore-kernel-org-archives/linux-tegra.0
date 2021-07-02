Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4E6C11F69
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Jul 2021 14:05:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A6F96142C
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Jul 2021 14:05:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232803AbhGBOIK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Jul 2021 10:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232686AbhGBOIK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Jul 2021 10:08:10 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F4BBC061762;
        Fri,  2 Jul 2021 07:05:38 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id bu19so18288444lfb.9;
        Fri, 02 Jul 2021 07:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Cjfl3c0J1wDK0xB6m0y3uhz6p6gS8JB9sGZSHtLepfc=;
        b=ocEmqlClYeANx41+Aff3aBsIZIc3UVL4RukOuIMXBs3c/pjDrBTh7SKzR1xGu3X1D+
         HnLnYqQSqbVNwZphjkzXKuzrtTREydyNMI7xq0um2Dijg2FABDK5/f7wv3q1U9OPhpTD
         lE9dlJ7Bl0jRg6UJdme4qM2uWiLTYOm4+6N9dZwQjsWyIWXYqUdoUeZ130j0vJXLsaUy
         rbeGxR1S8HWJ8p9uPlQU7oCzGUJ3+DqhFRDtUqzcdd2gBc0jaZh6FDCzm4uoiOWIh32c
         uK6h1asNzG2jqNBMt/8czvBAiSBePEULa8Ib1Bn/fGPGDaQpernRoyWYEJGdeA+/j4Gz
         xkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Cjfl3c0J1wDK0xB6m0y3uhz6p6gS8JB9sGZSHtLepfc=;
        b=MMh5qrMDSt+MfbU1Z8VY6cEePQpJNFa0Z0vhWnHMJwGNExZo/pCqWeHXXtIr8A5Fzb
         TRcWvbpd4xCn5pSMJX5A7s+kIEEOWqL2zyXklAsTnw1O9Le2o++BcLv1kvMsIKVlwWvI
         33RwWy0w0Ryk0zgw/iRF0FEfA/5KqmixXKi6HSj69wxr1yIUB+WGU4iUx3D8S9MAFDM2
         08NZ3xaNUTq7TVyFGR5S8SQxZRyGeuybSCt0GI2eMtnjqIUbZlxncOWqJFfQAR7DkvRs
         Kw1DN5Doail9esgSWaABFQnHmc/mwB2JoIerix3PmJJIyLKzBgEjn7ZWi0WZ8GHhTsit
         eNgw==
X-Gm-Message-State: AOAM533oS1JRGuc2n7ZV28huf0UtryZy60R2yDBlXK3S/5Z/00YZBg8X
        YloDi0fF1nPqQFo2D5BXFT0=
X-Google-Smtp-Source: ABdhPJzkutMeeLEPXZOMUQKVeT4A2lCgpel8CCjVgI5HBDtKFzrED7+2eYblNwWvXC7GZ5j86yLWyw==
X-Received: by 2002:a05:6512:3fa2:: with SMTP id x34mr3972751lfa.437.1625234736576;
        Fri, 02 Jul 2021 07:05:36 -0700 (PDT)
Received: from [192.168.2.145] (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.googlemail.com with ESMTPSA id q24sm304955lfj.200.2021.07.02.07.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jul 2021 07:05:35 -0700 (PDT)
Subject: Re: [PATCH v2 2/5] iommu: Implement of_iommu_get_resv_regions()
To:     Thierry Reding <thierry.reding@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh@kernel.org>
References: <20210423163234.3651547-1-thierry.reding@gmail.com>
 <20210423163234.3651547-3-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <bdc42077-d1f3-f561-2e4d-647b5fceb7b6@gmail.com>
Date:   Fri, 2 Jul 2021 17:05:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210423163234.3651547-3-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

23.04.2021 19:32, Thierry Reding пишет:
> +void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
> +{
> +	struct of_phandle_iterator it;
> +	int err;
> +
> +	of_for_each_phandle(&it, err, dev->of_node, "memory-region", "#memory-region-cells", 0) {
> +		struct iommu_resv_region *region;
> +		struct of_phandle_args args;
> +		struct resource res;
> +
> +		args.args_count = of_phandle_iterator_args(&it, args.args, MAX_PHANDLE_ARGS);
> +
> +		err = of_address_to_resource(it.node, 0, &res);
> +		if (err < 0) {
> +			dev_err(dev, "failed to parse memory region %pOF: %d\n",
> +				it.node, err);
> +			continue;
> +		}
> +
> +		if (args.args_count > 0) {
> +			/*
> +			 * Active memory regions are expected to be accessed by hardware during
> +			 * boot and must therefore have an identity mapping created prior to the
> +			 * driver taking control of the hardware. This ensures that non-quiescent
> +			 * hardware doesn't cause IOMMU faults during boot.
> +			 */
> +			if (args.args[0] & MEMORY_REGION_IDENTITY_MAPPING) {
> +				region = iommu_alloc_resv_region(res.start, resource_size(&res),
> +								 IOMMU_READ | IOMMU_WRITE,
> +								 IOMMU_RESV_DIRECT_RELAXABLE);
> +				if (!region)
> +					continue;
> +
> +				list_add_tail(&region->list, list);
> +			}
> +		}
> +	}
> +}
> +EXPORT_SYMBOL(of_iommu_get_resv_regions);

Any reason why this is not EXPORT_SYMBOL_GPL? I'm curious what is the
logic behind the OF symbols in general since it looks like half of them
are GPL.
