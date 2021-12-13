Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B17A4C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Dec 2021 18:18:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241819AbhLMSS6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Dec 2021 13:18:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241806AbhLMSS4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Dec 2021 13:18:56 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2196C061748;
        Mon, 13 Dec 2021 10:18:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3DE66611B5;
        Mon, 13 Dec 2021 18:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23CEC34600;
        Mon, 13 Dec 2021 18:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639419535;
        bh=REYgSuVQdxp2bAFggNyzh9NNmOFZO6LbeZVIVnH6Uu8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SUFdmu55C4htemBDQWIPw/vyW7OKgjqa0nwzJt7rqMXVgRU5XY4XdNGBUY68C6dFp
         s65YM1n5cETbhRzRwV3v1BqwauyFQl9kwnnrK+Uz0qxyN6/VfxZnn3kkjPcQTbfjmq
         I2bNQL5Qj683EkRaAlyd9dVnbMq4B/UoplXVoefY4H2fDI4owuJOeU+kC0ptXDvB1p
         /C87W/uA/eFBeQU5D6t6ZW2es3Od7kj5q/+elPGr8H7xHbai2wP2ZCwmMBGyLCMr9I
         +8RgHRFnxsxmwsl5HTZjzNqG1G2OtzgT4uaGgHNlBUNOfd0AqNcPa9iwmkUn1tTNZH
         ijXsUVpMec7PA==
Date:   Mon, 13 Dec 2021 18:18:50 +0000
From:   Will Deacon <will@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/4] iommu/arm-smmu: Support Tegra234 SMMU
Message-ID: <20211213181849.GA12405@willie-the-truck>
References: <20211209163600.609613-1-thierry.reding@gmail.com>
 <20211209163600.609613-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211209163600.609613-3-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Dec 09, 2021 at 05:35:59PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Allow the NVIDIA-specific ARM SMMU implementation to bind to the SMMU
> instances found on Tegra234.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> index 2c25cce38060..658f3cc83278 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> @@ -211,7 +211,8 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>  	if (of_property_read_bool(np, "calxeda,smmu-secure-config-access"))
>  		smmu->impl = &calxeda_impl;
>  
> -	if (of_device_is_compatible(np, "nvidia,tegra194-smmu") ||
> +	if (of_device_is_compatible(np, "nvidia,tegra234-smmu") ||
> +	    of_device_is_compatible(np, "nvidia,tegra194-smmu") ||
>  	    of_device_is_compatible(np, "nvidia,tegra186-smmu"))
>  		return nvidia_smmu_impl_init(smmu);

Acked-by: Will Deacon <will@kernel.org>

Will
