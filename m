Return-Path: <SRS0=3r2u=BO=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10930C433DF
	for <linux-tegra@archiver.kernel.org>; Tue,  4 Aug 2020 08:56:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B85012075D
	for <linux-tegra@archiver.kernel.org>; Tue,  4 Aug 2020 08:56:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="RIomN0Af"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729977AbgHDI4Q (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 4 Aug 2020 04:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729968AbgHDI4Q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Aug 2020 04:56:16 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A66DEC06174A
        for <linux-tegra@vger.kernel.org>; Tue,  4 Aug 2020 01:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=0HRmCyyxJKTp1gX1xV3hxn1+mI+/KVgtlNuaYL5nXs0=; b=RIomN0Af1QX+nF4IhI1u/3xpvX
        uyPsW7SLPt1uMngpBmv/fG9JoUhisEnVSy8epK4JYr6ejHYSFahUATOgYUswaI5FXUN9KZjqpD6bz
        B3sfM+hvQ1xPS+lx0w0UPzJaKg1F8mNKLiBXzoDGzRawZiCYUOpLdwnltZAApOWEumZ15QB9E8rsn
        NHgPr2U7gEfuJ39QKVgk9Fg4puWSOqB1cDY3fAA69PxVq13HfZ1MYk3UIDUkbmZLesvXejsnCB7CZ
        7dYZ9Kjjl9wxpVw/9oi78R27kPLg7u0k76FeYBUc/WV4QxjPwb+lql1gxLtmEDHaoBp0sjGG66a6k
        F6KQNkdA==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1k2sk0-0000us-3H; Tue, 04 Aug 2020 11:56:12 +0300
Subject: Re: [PATCH] iommu/dma: Add support for mapping memory as device
 memory
To:     Ashish Mhetre <amhetre@nvidia.com>, vdumpa@nvidia.com,
        treding@nvidia.com, jonathanh@nvidia.com, swarren@nvidia.com,
        Snikam@nvidia.com
Cc:     linux-tegra@vger.kernel.org
References: <1596527558-22566-1-git-send-email-amhetre@nvidia.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <b27819ab-7e80-977a-1107-3cc1dcb07400@kapsi.fi>
Date:   Tue, 4 Aug 2020 11:56:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1596527558-22566-1-git-send-email-amhetre@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

 From what I can tell, dma_map_resource already does this (see 
iommu_dma_map_resource). Can you use that?

(also, dropping internal MLs)

Mikko

On 8/4/20 10:52 AM, Ashish Mhetre wrote:
> Add DMA_ATTRS_DEVICE_MAP attribute to support mapping memory as device
> memory.
> 
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>   drivers/iommu/dma-iommu.c   | 3 +++
>   include/linux/dma-mapping.h | 6 ++++++
>   2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 65ac889..0e411ef 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -388,6 +388,9 @@ static int dma_info_to_prot(enum dma_data_direction dir, bool coherent,
>   	if (attrs & DMA_ATTR_PRIVILEGED)
>   		prot |= IOMMU_PRIV;
>   
> +	if (attrs & DMA_ATTR_DEVICE_MAP)
> +		prot |= IOMMU_MMIO;
> +
>   	switch (dir) {
>   	case DMA_BIDIRECTIONAL:
>   		return prot | IOMMU_READ | IOMMU_WRITE;
> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> index 330ad58..b0cb1b3 100644
> --- a/include/linux/dma-mapping.h
> +++ b/include/linux/dma-mapping.h
> @@ -68,6 +68,12 @@
>   #define DMA_ATTR_PRIVILEGED		(1UL << 9)
>   
>   /*
> + * DMA_ATTR_DEVICE_MAP: This specifies DMA-mapping subsystem to map memory
> + * as device memory.
> + */
> +#define DMA_ATTR_DEVICE_MAP		(1UL << 10)
> +
> +/*
>    * A dma_addr_t can hold any valid DMA or bus address for the platform.
>    * It can be given to a device to use as a DMA source or target.  A CPU cannot
>    * reference a dma_addr_t directly because there may be translation between
> 
