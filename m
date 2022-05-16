Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E7B2C433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 16 May 2022 18:30:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbiEPSab (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 May 2022 14:30:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343854AbiEPSaU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 May 2022 14:30:20 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 553E93E0D0;
        Mon, 16 May 2022 11:30:16 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dmitry.osipenko)
        with ESMTPSA id 23CA01F4384E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1652725815;
        bh=Ix9DbNg5SW6/Hg8l/g6Ys0vE0Lf/VXFLJIOKJ19dQGg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=FjDJqTm0OEMr8rsmzD3/IkYT9TAdBsknxHvCK67MfZONV1/a0jlh8dOpi8saYagHy
         qbYLoLlRsHmBfPBf36xMMLFif6L4kBU7N4hIvBLFD/Gqt54g3sk/y04xCCJUpiR6KF
         kuRRC0mn7c2VpC+UgmvtlJ9wnxFBqRP3WiFdfSLKQCNaI8f3Pd/suwiRwIbGLvICME
         kE7hRfojkQcNoUS9D+zUYYXETyn2BNSrNo19LtafS0EUKUmv87ObW+jfEN9BaWCosY
         IwfFl61xan+VwPmW9m+biKgveUSbwxoAi1+JybOeF1Dc09ALRGHY7GAfkqpWHlsXPq
         KWaByP9GPpHzw==
Message-ID: <b1f29af4-bc1c-f288-7960-870f1c68ec56@collabora.com>
Date:   Mon, 16 May 2022 21:30:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 5/5] iommu/tegra-smmu: Support managed domains
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org
References: <20220512190052.1152377-1-thierry.reding@gmail.com>
 <20220512190052.1152377-6-thierry.reding@gmail.com>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220512190052.1152377-6-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 5/12/22 22:00, Thierry Reding wrote:
> -277,7 +278,9 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
>  {
>  	struct tegra_smmu_as *as;
>  
> -	if (type != IOMMU_DOMAIN_UNMANAGED)
> +	if (type != IOMMU_DOMAIN_UNMANAGED &&
> +	    type != IOMMU_DOMAIN_DMA &&
> +	    type != IOMMU_DOMAIN_IDENTITY)
>  		return NULL;

Shouldn't at least pre-210 SoCs be guarded from IOMMU_DOMAIN_DMA? I
don't think that DRM and VDE drivers will work as-is today.

-- 
Best regards,
Dmitry
