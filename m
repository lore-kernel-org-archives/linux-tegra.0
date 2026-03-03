Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069B23845CC;
	Tue,  3 Mar 2026 06:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772520002; cv=none; b=aWRkDYX0WNuJKG8VY7RrZN2V1o6ynumXQSUBVgVP8pt71ctQl7h2YKJC2o28oKp0p8/r+nIBJg/OfFwxtCXeg2cXk2pjFjv9eIFHiK4bkDBZsh5nMieAf49tHfzIrbWqW3z3c6XnM6GUllZccTPjU0MJ9M3bqOo7Cg6q0iCgu3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772520002; c=relaxed/simple;
	bh=nv7SNkT6u73s0PJnVxRhAnXt1aYwF81l1iFND6YVC5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aGtTjZs2wMCVnREue/9+0njIdNL7r8ZhksQIy4DCZ34SmgEZmiecYcgqUs/7syCwJSMAy2TRMkUaTvH5R6Jpb2buA9fWe7e0yziDHrY1zuJuyLZrA+agTq8CsXCeFCNYNnmm4HkLgo2XTXnmL1KIiWzA/a+TbIimGMHsZxxGFnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H/XDlZAt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H/XDlZAt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F125BC2BC87;
	Tue,  3 Mar 2026 06:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772520001;
	bh=nv7SNkT6u73s0PJnVxRhAnXt1aYwF81l1iFND6YVC5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H/XDlZAtJ+qOW1+MMU28iqpCVv3xqjo3Tr4c/fW6vtheX56qmK+EymGTWCYKRsMuq
	 6oFDWP0TebQZiNN/i63mNHnIsp/F8WVBibrzFP8s8e2qN/+RLAlCbK7e2JrZb/4kk7
	 W8L1Ymk1ZeUXcMXtxupmw45VeptsK7Kk0eJkTZoe9E732Tw0A+/r+Zd25mtXXb6c0V
	 GL/Vs4+k1GBXXvBAiGedxJXK/EbSCEqWGrusE0nKP91wIjfQRatXKDDaiqcnwJRhLQ
	 VHQc6PBSwSB2PQ65f5OdhDaRKFx29310iymHyZ0gJ9PsmaQF1q9BtdljlCPYApS9iJ
	 yTtSos7J5DSpg==
Date: Tue, 3 Mar 2026 07:39:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/9] dt-bindings: dma: nvidia,tegra186-gpc-dma: Add
 iommu-map property
Message-ID: <20260303-famous-fearless-asp-1240cb@quoll>
References: <20260302123239.68441-1-akhilrajeev@nvidia.com>
 <20260302123239.68441-2-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302123239.68441-2-akhilrajeev@nvidia.com>

On Mon, Mar 02, 2026 at 06:02:31PM +0530, Akhil R wrote:
> Add iommu-map property to specify separate stream IDs for each DMA
> channel. This enables each channel to be in its own IOMMU domain,
> keeping memory isolated from other devices sharing the same DMA
> controller.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  .../devicetree/bindings/dma/nvidia,tegra186-gpc-dma.yaml     | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/nvidia,tegra186-gpc-dma.yaml b/Documentation/devicetree/bindings/dma/nvidia,tegra186-gpc-dma.yaml
> index 0dabe9bbb219..1e7b5ddd4658 100644
> --- a/Documentation/devicetree/bindings/dma/nvidia,tegra186-gpc-dma.yaml
> +++ b/Documentation/devicetree/bindings/dma/nvidia,tegra186-gpc-dma.yaml
> @@ -14,6 +14,7 @@ description: |
>  maintainers:
>    - Jon Hunter <jonathanh@nvidia.com>
>    - Rajesh Gumasta <rgumasta@nvidia.com>
> +  - Akhil R <akhilrajeev@nvidia.com>
>  
>  allOf:
>    - $ref: dma-controller.yaml#
> @@ -51,6 +52,10 @@ properties:
>    iommus:
>      maxItems: 1
>  
> +  iommu-map:
> +    minItems: 1
> +    maxItems: 32

Why is this flexible? If it is, means usually items are distinctive, so
I would expect defining/listing them. If they are not distinctive,
commit msg is incorrect. If the list is as simple as 1-to-1 channel
mapping, just add it in the description how they are ordered.

> +
>    dma-coherent: true
>  
>    dma-channel-mask:
> -- 
> 2.50.1
> 
