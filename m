Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E5CC2D0A8
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:40:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7DEBC20706
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:40:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pb5O4ATP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725864AbgI3FkA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 01:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgI3Fj6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 01:39:58 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB95C061755;
        Tue, 29 Sep 2020 22:39:57 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id 197so12966lfo.11;
        Tue, 29 Sep 2020 22:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sO7Z6Ebp01z2sW5Kfe6IDDgdgco/uSCVRH76uI5YHC0=;
        b=Pb5O4ATP4Nrcn7RwitJpHiIkFKleHhVyVqhRyCu5njAH7ln3zA+KGp9q594NfHP2e6
         Kj7htrUZvLTx85NHXXlpBlvoS/zD7tKGmpeq8JIBvCA/CS5CyfgYkwbRyZuRM76CllvX
         RXECp0Q8GrUJwLRIUgDO81HuzKKxV/MHQYCbs33OAzHIvv27euBGjo1nKLm6rvh8kibz
         H3Ki+ZE5D1MHSuANdSKJwntj9SaPgjDQHzBe/kbUFmhIk8Lj0zB+0TDOQpHYKGKOMRrR
         M9ZNPlvHWgkbcMcapSIcLRf5MQFIGwV3LUVI25f+URnYw4lHRb0RHPMAc7HZfup4t+xq
         78kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sO7Z6Ebp01z2sW5Kfe6IDDgdgco/uSCVRH76uI5YHC0=;
        b=pILJTr5p9h3xB9oVk5LDIifl4eeTMVUxeC+a6j5AN8E/Z8HpwMuF2+ec6IC9C9QeAt
         NsYGn4IGrVqDGldHUp0EUwHqGgtkSBuJkmGUNqS6cu40I9bH4PZKcuhsKZlNFTf5PKPm
         H+ttLTctnnD456CW+K1hT8l/ZIxFyeqL0sATLNxgJ9Ww8e5WQSa+7IGbdaHwgn4CvD0M
         jt9z9Bxzj5627whmFadqSms8iEHHvoHvqT3/3nZ+qR8UtvP1MacRIS+Y8Ps9ewsynerH
         x6B+xbr05+OdKCbw1sc0KJ0+zbgpsWxhiQJdqk1IGDatVRY8Dxe7VHgI1QoruFDfq54k
         oGWQ==
X-Gm-Message-State: AOAM532ClwnGc1IUHmviYjDgBZlmDe4bkXNEyg20dyfI0qXTLY3mTWfB
        p6b+TosBhJJKsdQXSuXMH0varxgraIs=
X-Google-Smtp-Source: ABdhPJx8X6I4Cwc+xBI4BDjcDu14RLHDatsF/H3cqbI/6oc/O9NxV5GSdAK1Cwy9h4z0cKK6PHHBxQ==
X-Received: by 2002:a19:4bc8:: with SMTP id y191mr289347lfa.491.1601444395768;
        Tue, 29 Sep 2020 22:39:55 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id z7sm62625lfc.59.2020.09.29.22.39.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 22:39:55 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org, krzk@kernel.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-3-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e557a09b-bcc3-11cb-9529-096aafb42051@gmail.com>
Date:   Wed, 30 Sep 2020 08:39:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930003013.31289-3-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.09.2020 03:30, Nicolin Chen пишет:
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

s/&tegra_smmu_ops/smmu->iommu.ops/

Secondly, is it even possible that fwspec could be NULL here or that
fwspec->ops != smmu->ops?
