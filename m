Return-Path: <SRS0=6fDB=DJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43891C4363D
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 14:41:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 073C320708
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 14:41:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBHfX3/p"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388128AbgJBOly (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Oct 2020 10:41:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgJBOly (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Oct 2020 10:41:54 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B535DC0613D0;
        Fri,  2 Oct 2020 07:41:53 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id x69so2162883lff.3;
        Fri, 02 Oct 2020 07:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ccwbBBraz+Mr+UjLyai2/AEGVDZQMyHCcB39LG9nrxQ=;
        b=SBHfX3/pT2BKGbai06QxirsVyqXhUdtuE8Kn/r/BfamZWOddnu3YI9/tPfKmAj1kAN
         ae85nkFGT4xWHWWJTVVjV6SmO+4L2rG07BnF8YLMsFqpuAYa+RpfCJ5EWZoFc1WSopuX
         jwdHE6mITo9/7bie5NHN5BIrdpxorLuUh1nnowqFFp/pEjm9k6DMb/RLFbVeTw6+4eNp
         gAD8NJSkDo9pCBi3JRMKgLFJD+GXMu+NVYnZFFWFUEJUAIuEoq2vVtgaOturpcAtZi8V
         iqP0fsiWkQ8z9yIIw8exFU48VkcbzIqteg1MEKw/ufT+Zjb1xIJabo05FVxNZ2FiDZCv
         BteQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ccwbBBraz+Mr+UjLyai2/AEGVDZQMyHCcB39LG9nrxQ=;
        b=dxYNaRAzO0pRxAcA4Z5Z/1hIAbw/vaN53SOBfF0g1HgMtb+7V5cLTMXnEJnXjMlesM
         2CCpNjge7Uqw61tgNYQu9LmuG/rxpPKgv/acq+W3feAwyLCim0oMwbkq32ikbPP/SAOa
         SeghpLttysyzWihooMW3yh3nc5wDW3pig+G7F8k9fYWAokCzm0Z0pk3h0xcEV44qHTV1
         1vNuOgJP9SNOvWHKyf+/wMdN3Vn8SbVEZjfeSjqL17YcCj7mZ4F8xN5VYGdssJgRckoD
         jW4yGkp3OLkGz0xxX9XUMwN2fsb/+XOsX9GY2RMXngj4JBynrvac8Dy9fyFYAaF7NdjH
         3+ww==
X-Gm-Message-State: AOAM5308u5DY+CauCFRsPprQI3uUW+p0FqVdQMqt/gsBfvzC8jvhnMOf
        aF/Uqi/KT70aCwedHbU0xqxmkVp4Rfo=
X-Google-Smtp-Source: ABdhPJyFaEhIGP8CV6uouv7gFIFfNYLAxZV3AIp2QrDCu0NFeJOxuzN/bUOZG+bynH73oCbGOT6Wyw==
X-Received: by 2002:a19:8a0a:: with SMTP id m10mr942761lfd.244.1601649712013;
        Fri, 02 Oct 2020 07:41:52 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru. [109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id q17sm324009lfn.145.2020.10.02.07.41.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 07:41:51 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] iommu/tegra-smmu: Use fwspec in
 tegra_smmu_(de)attach_dev
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-2-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <de0b717f-af5c-8813-eb3e-07d19eff5271@gmail.com>
Date:   Fri, 2 Oct 2020 17:41:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002060807.32138-2-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

02.10.2020 09:08, Nicolin Chen пишет:
>  static int tegra_smmu_attach_dev(struct iommu_domain *domain,
>  				 struct device *dev)
>  {
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>  	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
>  	struct tegra_smmu_as *as = to_smmu_as(domain);
> -	struct device_node *np = dev->of_node;
> -	struct of_phandle_args args;
>  	unsigned int index = 0;
>  	int err = 0;
>  
> -	while (!of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
> -					   &args)) {
> -		unsigned int swgroup = args.args[0];
> -
> -		if (args.np != smmu->dev->of_node) {
> -			of_node_put(args.np);
> -			continue;
> -		}
> -
> -		of_node_put(args.np);
> +	if (!fwspec)
> +		return -ENOENT;

Could the !fwspec ever be true here as well?
