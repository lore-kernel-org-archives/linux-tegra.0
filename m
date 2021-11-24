Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B8BAC4321E
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Nov 2021 14:07:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349513AbhKXOKc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Nov 2021 09:10:32 -0500
Received: from foss.arm.com ([217.140.110.172]:39196 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1355110AbhKXOIa (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Nov 2021 09:08:30 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3873ED1;
        Wed, 24 Nov 2021 06:05:20 -0800 (PST)
Received: from [10.57.56.56] (unknown [10.57.56.56])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66E5D3F73B;
        Wed, 24 Nov 2021 06:05:19 -0800 (PST)
Message-ID: <0dfb2ee7-e6ec-f085-ed16-650e646d24d7@arm.com>
Date:   Wed, 24 Nov 2021 14:05:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/9] gpu: host1x: Add missing DMA API include
Content-Language: en-GB
From:   Robin Murphy <robin.murphy@arm.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, willy@infradead.org,
        iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, joro@8bytes.org, will@kernel.org
References: <cover.1637671820.git.robin.murphy@arm.com>
 <d7bc49bfda25a7ea19dc574f8e212cd9e42bf2e2.1637671820.git.robin.murphy@arm.com>
In-Reply-To: <d7bc49bfda25a7ea19dc574f8e212cd9e42bf2e2.1637671820.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2021-11-23 14:10, Robin Murphy wrote:
> Host1x seems to be relying on picking up dma-mapping.h transitively from
> iova.h, which has no reason to include it in the first place. Fix the
> former issue before we totally break things by fixing the latter one.
> 
> CC: Thierry Reding <thierry.reding@gmail.com>
> CC: Mikko Perttunen <mperttunen@nvidia.com>
> CC: dri-devel@lists.freedesktop.org
> CC: linux-tegra@vger.kernel.org
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> 
> Feel free to pick this into drm-misc-next or drm-misc-fixes straight
> away if that suits - it's only to avoid a build breakage once the rest
> of the series gets queued.

Bah, seems like tegra-vic needs the same treatment too, but wasn't in my 
local config. Should I squash that into a respin of this patch on the 
grounds of being vaguely related, or would you prefer it separate?

(Either way I'll wait a little while to see if the buildbots uncover any 
more...)

Cheers,
Robin.

>   drivers/gpu/host1x/bus.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
> index 218e3718fd68..881fad5c3307 100644
> --- a/drivers/gpu/host1x/bus.c
> +++ b/drivers/gpu/host1x/bus.c
> @@ -5,6 +5,7 @@
>    */
>   
>   #include <linux/debugfs.h>
> +#include <linux/dma-mapping.h>
>   #include <linux/host1x.h>
>   #include <linux/of.h>
>   #include <linux/seq_file.h>
> 
