Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B987C433DB
	for <linux-tegra@archiver.kernel.org>; Mon,  8 Feb 2021 16:55:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30A8A64E5A
	for <linux-tegra@archiver.kernel.org>; Mon,  8 Feb 2021 16:55:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234424AbhBHQzN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 8 Feb 2021 11:55:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234539AbhBHQyL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 8 Feb 2021 11:54:11 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7181FC061786;
        Mon,  8 Feb 2021 08:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=FME9VbzmFyLWNxiCozESgnR6SphEi+7tXAYke0+yW0o=; b=CYZbkVwR8/zLr1IC961HpJsuU3
        rdBv/yBzOhjyYfjEJZqsOgvFObqpluR4IqoxODvBfFAeUkoguFJR8WWqQXhTmFs5I8aDF1bOh63gq
        /Zl5wC9oFD53XItWUwbO60FErDMgImrYx+yIsqNKFmtex7Y3mDwuAMQS49H/zPADWNb1MJRkHfVHP
        GAxfrRDo+rVXZMV3hK8EBwqOpDe6J3OMc54qfMxr4vs1sVFzp6K7pBuHJ4swfyT3VnYmxb2keLuk1
        xS6sYAECK3g2Ow7kev4N3ZJCIkAETKILOjTNItN30DYkCWza2UAnbZCDs9EpmvhWR5iHkTe0Ekose
        o2w9zSFQ==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1l99mq-0003Mk-Fh; Mon, 08 Feb 2021 18:53:20 +0200
Subject: Re: [RFC PATCH 1/8] of/device: Allow specifying a custom iommu_spec
 to of_dma_configure
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, joro@8bytes.org, will@kernel.org,
        robh+dt@kernel.org, frowand.list@gmail.com, robin.murphy@arm.com
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210208163848.2504291-1-mperttunen@nvidia.com>
 <20210208163848.2504291-2-mperttunen@nvidia.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <14e29aae-53bc-923f-568e-eb222bd24ba1@kapsi.fi>
Date:   Mon, 8 Feb 2021 18:53:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210208163848.2504291-2-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2/8/21 6:38 PM, Mikko Perttunen wrote:
> ...
> -static int of_iommu_xlate(struct device *dev,
> -			  struct of_phandle_args *iommu_spec)
> +int of_iommu_xlate(struct device *dev, struct of_phandle_args *iommu_spec)
> ...
> +EXPORT_SYMBOL_GPL(of_iommu_xlate);
>   

These two chunks should not be needed.. looks like I left them in from 
some earlier experiments.

Sending patches out is really the best way to notice mistakes, even 
after reading through them 5 times before.. :)

Mikko
