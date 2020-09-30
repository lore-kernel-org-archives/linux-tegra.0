Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 698CEC4727E
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 15:37:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CDE720759
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 15:37:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQ53PzRm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731064AbgI3Pg4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 11:36:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731062AbgI3Pg4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 11:36:56 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABE7AC061755;
        Wed, 30 Sep 2020 08:36:55 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id a22so1962426ljp.13;
        Wed, 30 Sep 2020 08:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rqnrG6Pizn8ox8uxYFSKzaugVeMdBDCYSIAjysYBMrg=;
        b=GQ53PzRmH8UL1499Q2RJylmVszIyYrijKd09ZwcUX2T2vuw3aUCiWCL3NNPme6a4cb
         j0U5bgN7tRBxexsD7bLfLrKu0efRHsslx2gjx/ao3r8MFgoVeKcXnEQPCFYrH13wOB8T
         cZM2S9BGMG35x3K7xqsXv8e03mkEDY2c0CwYP60osx4K8tiiApd/jqCzI6KCxpsHBNkG
         nkc19gd43b7Pduua4qQZEGm5ZSAJuLaijts93Lw9qsF9bFj3X9dEaNs1p+cAQS6f4Jof
         MPRfJgbiZpDzvEL8MUiEzWz8chAVkvVtu7VQczb+GFiPxC1E+8SYwyu46a6xlhUyyEcv
         IOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rqnrG6Pizn8ox8uxYFSKzaugVeMdBDCYSIAjysYBMrg=;
        b=Yz023rL+TvRBIZbwPQ88aozksaXdqcfrL7zJ6n7kSuo8aSIdS6yinQuG4V1xbZp0f8
         3IBdsayuMlcipZfVMJPGPXJAaULDV45rmZsw7haXpx9SM4/F4UGgjne8LBnrhT/SNias
         uZhB60oHyVTJSd/ex3q4xox7CVjiYGXwFIgkWJcE970rPxcPegLNPo3tr09dyYAxNb6Y
         KQhUHRSaN3XIVwSq/Evk1IFz7Ho5DIN2LXX8iJZTxfnoNKOstBFT+4cOOaf1cdRuYzXw
         nw3R9/oT/ywHlmdJZ0SsKUTw3qMLu6uH71b7E+ynU443KTO+p2UsSzrxyKjAi5mAez8B
         rXXw==
X-Gm-Message-State: AOAM531mb/J3/a7YOE4VxjhAzXIZd+MvM+EM/d3sQQ0busGVIZHOQvCp
        s1BLz7w9zODVYDkHzqiNsMF4amnw5UA=
X-Google-Smtp-Source: ABdhPJzsndJWU6ESCTX5fCeh1abc7U//REedB9J40+plLgx7mgrDwkkTfQicDDlG++H+wLxA10l0lw==
X-Received: by 2002:a05:651c:1064:: with SMTP id y4mr974771ljm.107.1601480213985;
        Wed, 30 Sep 2020 08:36:53 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id t17sm188718ljo.23.2020.09.30.08.36.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 08:36:53 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
To:     Thierry Reding <thierry.reding@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, krzk@kernel.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <20200930153131.GB3833404@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ece615ad-8d6b-96ae-d8b4-9667aef17281@gmail.com>
Date:   Wed, 30 Sep 2020 18:36:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930153131.GB3833404@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

 I'...
>> +	struct tegra_mc *mc = devm_tegra_get_memory_controller(dev);
>> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> 
> It looks to me like the only reason why you need this new global API is
> because PCI devices may not have a device tree node with a phandle to
> the IOMMU. However, SMMU support for PCI will only be enabled if the
> root complex has an iommus property, right? In that case, can't we
> simply do something like this:
> 
> 	if (dev_is_pci(dev))
> 		np = find_host_bridge(dev)->of_node;
> 	else
> 		np = dev->of_node;
> 
> ? I'm not sure exactly what find_host_bridge() is called, but I'm pretty
> sure that exists.
> 
> Once we have that we can still iterate over the iommus property and do
> not need to rely on this global variable.

This sounds more complicated than the current variant.

Secondly, I'm already about to use the new tegra_get_memory_controller()
API for all the T20/30/124/210 EMC and devfreq drivers.
