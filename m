Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB19C47420
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 15:15:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64A5F207C3
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 15:15:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFJ0lf8Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728916AbgI3PP1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 11:15:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728480AbgI3PPL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 11:15:11 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8C00C061755;
        Wed, 30 Sep 2020 08:15:10 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id v23so1921405ljd.1;
        Wed, 30 Sep 2020 08:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jw4xUwJEw3PBdXJ5pKldJCzPzGe94a2UdzCi5f8tbUA=;
        b=YFJ0lf8QP0Q8nhVCwx9JJ+oihFfCYDo1Wzs9JVlPOKiCPw3NwvecDKw8eiYEVxwBrF
         ac7nmF8Cxbl4CecpkPDMKfur68yFEkbMR3iZqKcOYtQb6w3cLTVemZTme8OaV6ktMa5E
         dwrHPbSBABbVwzDyFJmADESi5yP8mFl19fW12ButrUFw20GRWsD6BsfDFavhWIlkU+vr
         2lRQJYAkAbRigzWOItphQQSpkb7uQ8841vo2PjUCGB2A170L47qDi0u7zj69utDCTJnQ
         UGYdVm+qQOWoD8y2dMPHLPWqZW8nnzQFvBf7hIHXABx33j7cNMXHSyJkHYTcsSfQ4QOl
         qXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jw4xUwJEw3PBdXJ5pKldJCzPzGe94a2UdzCi5f8tbUA=;
        b=qvnAweD+kCoYkTDjpeBXL3L7W2lMjOY379HQ/eNm4lffWiuqPEcUHC4zdHdmfxLLqI
         7FJtQ9FLqcKdSCLjFFMlJyz8i/ig+6BgUvBf8LLTdnY3Ot49DcuvFWJVZyOrg7t8DTaF
         s7oe6UDPQUy0EXWwrFHWps5Z6j1S2ThVhmBniBRZyMwJougqywzuYvBd/jztgX8VXEDF
         ay0lQHeqzu4aD/vOmSlec2GhJ1LumoS9tehrsSY8EiEiyrx1b6KAQ2lzuLN8TidHpg1Z
         cKsGUaQUBg+OdBfO4gOXTElkeoZAuivQtk3Mlgk1dJQx/eA2UyFA0ygjZlBi1BhRoRYS
         8XOA==
X-Gm-Message-State: AOAM533AjklMuG4OJh8PjVF+qsq+YfLnqw8GfmHlTjwD7s7TJvSy7riE
        OT46X2piwWTG852JAbqHISZAM/sGOZ4=
X-Google-Smtp-Source: ABdhPJxdKp0HTLF54QUNCDS/RfutzAYTnKkUdZ+hvKfjD8MXi3huuEOAUhUKVfxoX4xcVoirspXW6A==
X-Received: by 2002:a05:6512:370e:: with SMTP id z14mr1115113lfr.80.1601478585016;
        Wed, 30 Sep 2020 08:09:45 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id l8sm223130lfc.124.2020.09.30.08.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 08:09:44 -0700 (PDT)
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
Message-ID: <30808bd3-a546-e981-00ff-34c07ee1a678@gmail.com>
Date:   Wed, 30 Sep 2020 18:09:43 +0300
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
> +	if (!fwspec || fwspec->ops != &tegra_smmu_ops)
> +		return -ENOENT;

In previous reply you said that these fwspec checks are borrowed from
the arm-smmu driver, but I'm now looking at what other drivers do and I
don't see them having this check.

Hence I'm objecting the need to have this check here. You either should
give a rational to having the check or it should be removed.

Please never blindly copy foreign code, you should always double-check it.
