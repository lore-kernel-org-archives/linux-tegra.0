Return-Path: <SRS0=6fDB=DJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4E5C4363D
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 14:22:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41B28206DB
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 14:22:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="artvsCI6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387688AbgJBOWh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Oct 2020 10:22:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgJBOWg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Oct 2020 10:22:36 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69FEEC0613D0;
        Fri,  2 Oct 2020 07:22:36 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id m5so2076014lfp.7;
        Fri, 02 Oct 2020 07:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LQSqHKxirAatiGAtCNlEf9nxHBeD+O9QIXNPNIbJQNA=;
        b=artvsCI62m5j8bFRHfNus1KiDykPxPR8bCoOnjMnGPkKUKp4pPWOFh4zKBX+m86Lru
         4Q1L08LuzjryUMwHM3e/3fxqkrbF5z8Rjr7JBOZbrrhZlRbcVfAoAERR9a1pDv1p/V+M
         zVo9ya4z/Nslhr2/C2A+hycHm+08Fy7RM8ARzxA/qNvGU6o45uzfp73+g1/QK6kiSflf
         +3hV1Ti/B1nSFs2/QBSvnN/YFktnsT+npiVQFiJbTonZPMF4TjNJVwPzoUWnEDhWeTXH
         +mx8sbd+2Fsl4/wzr7x1fvUiXaIgSJLsnzG37LZglXoqpY0U2tt9CV9hguIpuirVakvX
         zsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LQSqHKxirAatiGAtCNlEf9nxHBeD+O9QIXNPNIbJQNA=;
        b=e3vyLjHPL5NyD2c+XwSCrXJgmVbMDRrb86z62E2fd/wGXE6f2VxyzrUF10wx1hkK5G
         WsHellR5on3vLCIyn3mVEjKNfCEvK+v0ySlm5xppDKxQl9u2KnO1avYfNfvcZR7U8H61
         gnSaoc3OV4wrwEZWhPjt4KsnNudR8fLM5swPByrmHipvSNGjHqAdQ0mn7g2L09xM0RDK
         ceD5XaZSsP3yXqlZ/O+EvwEtdr4CfOU+cPgaFWtiOsCZxNVMLWO7pIaxuWkY33Nujhrm
         TtMX/LlJuxaB5sDM5sYUU3Fgdkf2DfJO0r5cXwJ7tcgsar0h9Ib4zOpPl3mma/qCNpd1
         c6KQ==
X-Gm-Message-State: AOAM531z9z5RCmNRxPYUs8nmkVCvLBTP1USbsbtRIsc0o1HIXE5JXW59
        38wtMnlM+zj5AZyzw57V5SijWBEQhvc=
X-Google-Smtp-Source: ABdhPJwnWQnfgKJ87DapCmwCyL3xJCIrcJZcERu8LlujipB4LagOYsDPA1C6UnSbXdJujV3rtLcwiw==
X-Received: by 2002:a19:8706:: with SMTP id j6mr863398lfd.234.1601648554674;
        Fri, 02 Oct 2020 07:22:34 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru. [109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id 71sm316052lfb.73.2020.10.02.07.22.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 07:22:33 -0700 (PDT)
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
Message-ID: <75ad716f-aa2f-743a-7d9a-7083eda03672@gmail.com>
Date:   Fri, 2 Oct 2020 17:22:32 +0300
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

Looks like there is no need to initialize 'index' and 'err' variables
anymore.
