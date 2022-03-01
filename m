Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 264C9C433F5
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Mar 2022 18:12:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233920AbiCASM5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Mar 2022 13:12:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236846AbiCASM4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Mar 2022 13:12:56 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7E46764BD8;
        Tue,  1 Mar 2022 10:12:15 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3931D1042;
        Tue,  1 Mar 2022 10:12:15 -0800 (PST)
Received: from [10.57.39.47] (unknown [10.57.39.47])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4019E3F73D;
        Tue,  1 Mar 2022 10:12:12 -0800 (PST)
Message-ID: <4a748c85-4fdb-0c10-19d8-0379b9e42ab5@arm.com>
Date:   Tue, 1 Mar 2022 18:12:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v4 1/9] dt-bindings: host1x: Add iommu-map property
Content-Language: en-GB
To:     cyndis@kapsi.fi, thierry.reding@gmail.com, jonathanh@nvidia.com,
        joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski@canonical.com
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mikko Perttunen <mperttunen@nvidia.com>
References: <20220301161455.4037062-1-cyndis@kapsi.fi>
 <20220301161455.4037062-2-cyndis@kapsi.fi>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220301161455.4037062-2-cyndis@kapsi.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2022-03-01 16:14, cyndis@kapsi.fi wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Add schema information for specifying context stream IDs. This uses
> the standard iommu-map property.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v3:
> * New patch
> v4:
> * Remove memory-contexts subnode.
> ---
>   .../bindings/display/tegra/nvidia,tegra20-host1x.yaml        | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> index 4fd513efb0f7..0adeb03b9e3a 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> @@ -144,6 +144,11 @@ allOf:
>           reset-names:
>             maxItems: 1
>   
> +        iommu-map:
> +          description: Specification of stream IDs available for memory context device
> +            use. Should be a mapping of IDs 0..n to IOMMU entries corresponding to

Nit: maybe "context IDs 0..n" for maximum possible clarity?

Either way, though, I'm happy that if the simplest and most 
straightforward approach works, then it's the best choice.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

Cheers,
Robin.

> +            usable stream IDs.
> +
>         required:
>           - reg-names
>   
