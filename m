Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F2CC433FE
	for <linux-tegra@archiver.kernel.org>; Wed, 13 Apr 2022 22:34:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235864AbiDMWgy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 13 Apr 2022 18:36:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbiDMWgy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 13 Apr 2022 18:36:54 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92CBF3467E
        for <linux-tegra@vger.kernel.org>; Wed, 13 Apr 2022 15:34:31 -0700 (PDT)
Received: from [IPV6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1] (unknown [IPv6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 982E31F4762C;
        Wed, 13 Apr 2022 23:34:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1649889270;
        bh=YG/XPhnWizXt3303tJt/IxDGAZVOLwxkOEcrQ7Z9X1I=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=WuInoSFqyOdJAlFL2xvC3Fd06QpZKkwfuYrjwHkZTkD3PIQmFEM6al0EmXS+wSFGn
         JZoeP7y+9bvcUjK4SH7oYB9OEMOqkZTMeDzVxNGmHqkgDa0QqmsiVLGnrJ+zRtX1C9
         MUV82xVcb7MhPRF/M/j7O56roc/EOLNaJoQERHg6lx1P5tE8M0+rZDp7etRC029xfg
         MyoxvhheqezqCf0zOF5inflSCSTNOoB7aeRKetuaBlY7nhTNK9cIHW9vowIHJy0odE
         Bd4L9c6oS5vzxekRzWMhDNn/jwlaq7YcrmLPUn7Nmrj6LLiYUOvXQzQnQBs9KBmAG9
         2EMXQRqKGBMYA==
Message-ID: <9bb76a5b-d5d7-6f43-ed8a-e6782dda8568@collabora.com>
Date:   Thu, 14 Apr 2022 01:34:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] drm/tegra: Stop using iommu_present()
Content-Language: en-US
To:     Robin Murphy <robin.murphy@arm.com>, thierry.reding@gmail.com
Cc:     jonathanh@nvidia.com, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org
References: <1f7c304a79b8b8dd5d4716786cae7502a0cc31f5.1649684782.git.robin.murphy@arm.com>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <1f7c304a79b8b8dd5d4716786cae7502a0cc31f5.1649684782.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 4/11/22 16:46, Robin Murphy wrote:
> Refactor the confusing logic to make it both clearer and more robust. If
> the host1x parent device does have an IOMMU domain then iommu_present()
> is redundantly true, while otherwise for the 32-bit DMA mask case it
> still doesn't say whether the IOMMU driver actually knows about the DRM
> device or not.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> 
> v2: Fix logic for older SoCs and clarify.
> 
>  drivers/gpu/drm/tegra/drm.c | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index 9464f522e257..4f2bdab31064 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -1092,6 +1092,19 @@ static bool host1x_drm_wants_iommu(struct host1x_device *dev)
>  	struct host1x *host1x = dev_get_drvdata(dev->dev.parent);
>  	struct iommu_domain *domain;
>  
> +	/* For starters, this is moot if no IOMMU is available */
> +	if (!device_iommu_mapped(&dev->dev))
> +		return false;
> +
> +	/*
> +	 * Tegra20 and Tegra30 don't support addressing memory beyond the
> +	 * 32-bit boundary, so the regular GATHER opcodes will always be
> +	 * sufficient and whether or not the host1x is attached to an IOMMU
> +	 * doesn't matter.
> +	 */
> +	if (host1x_get_dma_mask(host1x) <= DMA_BIT_MASK(32))
> +		return true;
> +
>  	/*
>  	 * If the Tegra DRM clients are backed by an IOMMU, push buffers are
>  	 * likely to be allocated beyond the 32-bit boundary if sufficient
> @@ -1122,14 +1135,13 @@ static bool host1x_drm_wants_iommu(struct host1x_device *dev)
>  	domain = iommu_get_domain_for_dev(dev->dev.parent);
>  
>  	/*
> -	 * Tegra20 and Tegra30 don't support addressing memory beyond the
> -	 * 32-bit boundary, so the regular GATHER opcodes will always be
> -	 * sufficient and whether or not the host1x is attached to an IOMMU
> -	 * doesn't matter.
> +	 * At the moment, the exact type of domain doesn't actually matter.
> +	 * Only for 64-bit kernels might this be a managed DMA API domain, and
> +	 * then only on newer SoCs using arm-smmu, since tegra-smmu doesn't
> +	 * support default domains at all, and since those SoCs are the same
> +	 * ones with extended GATHER support, even if it's a passthrough domain
> +	 * it can still work out OK.
>  	 */
> -	if (!domain && host1x_get_dma_mask(host1x) <= DMA_BIT_MASK(32))
> -		return true;
> -
>  	return domain != NULL;
>  }
>  
> @@ -1149,7 +1161,7 @@ static int host1x_drm_probe(struct host1x_device *dev)
>  		goto put;
>  	}
>  
> -	if (host1x_drm_wants_iommu(dev) && iommu_present(&platform_bus_type)) {
> +	if (host1x_drm_wants_iommu(dev)) {
>  		tegra->domain = iommu_domain_alloc(&platform_bus_type);
>  		if (!tegra->domain) {
>  			err = -ENOMEM;

Robin, thank you for the updated version. The patch looks okay to me.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

A bit later I'll also will give it a test, just to be sure because we
had problems with that function in the past.
