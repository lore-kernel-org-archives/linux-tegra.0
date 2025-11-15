Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A285212564;
	Sat, 15 Nov 2025 12:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763209523; cv=none; b=bnfVw97jknH39r4PX2LlkJEbzoE0y5eGaQ8Ad6pxbqQK9AcP9Gi6FUOO8nlv889MxEHiI5P1HbRT57X25B8kAzYBkZupoaQXe19+RpDBBODO6ADk+MSPHCpTXFKXyN2MHh/MtGZl9jQt6ktluRId/kB2FNNnTGNwsg3uKJ1SZNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763209523; c=relaxed/simple;
	bh=E/0rM1P8xYLG3SX2bhJwIytZleNGPmMhckH8W/ngHZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=utA1wZnwmSusTejlimWmBwQsTfnx8DmXo7NcWZvnX8F3MzyjK5c6hwulhyleUxiXLLrfFfadJylbBRdUf9CAaIWHggPZfhq+dX84GlJ9siq5D65/qKZ6iojUBlDma3BHWVVV8X2j6JSNTwDtiNHMLF7EqMwa5/fA8O7fxA2CBMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u50Ki7O3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u50Ki7O3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A865C113D0;
	Sat, 15 Nov 2025 12:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763209522;
	bh=E/0rM1P8xYLG3SX2bhJwIytZleNGPmMhckH8W/ngHZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u50Ki7O3vjoSQ1OZgz2qK8KXt94XUzeHUZooh7H6CXn7v+f9eo7vAdO5Rx7IkPfYN
	 xA9BLN0pnjB7+N5PhNM5T1JjWd03nycbHkROuI5i9+R/HxuiKR4h0f1ur4mOWr7P77
	 XNOmBbbyJD1IUsHIGOfUxAnbq2bjkDbk0EKArlOPWexId4yfsH8At88y1KyUeybOCw
	 qCcQfSEynb5IOdVgUvJcF15mizaFCSk9QN0qBCOHaf6bRrtbZuFRIdoYCZX6/Wrjel
	 LBmkZbN+EAWotCuZyWADGVmV28Iyvmhz5r2Q+E7MV3K9h3J3hJ0+haRzp/Q4PJcJ3f
	 3DwUXMjRWqf+g==
Date: Sat, 15 Nov 2025 13:25:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Prathamesh Shete <pshete@nvidia.com>
Subject: Re: [PATCH 1/2] dt-bindings: tegra: pmc: Update aotag as an optional
 aperture
Message-ID: <20251115-accurate-fair-salmon-64eca9@kuoka>
References: <20251114161711.2655355-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251114161711.2655355-1-jonathanh@nvidia.com>

On Fri, Nov 14, 2025 at 04:17:10PM +0000, Jon Hunter wrote:
> Not all Tegra SoCs or all versions of a particular Tegra SoC may include
> the AOTAG aperture. This change makes "aotag" as an optional aperture for
> Tegra234 and Tegra264.
> 
> Co-developed-by: Prathamesh Shete <pshete@nvidia.com>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> Admittedly I don't know if there is a better way to handle this,
> but if there is please let me know!
> 
>  .../arm/tegra/nvidia,tegra186-pmc.yaml        | 57 ++++++++++++-------
>  1 file changed, 38 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
> index be70819020c5..defd9000eed2 100644
> --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
> @@ -19,17 +19,12 @@ properties:
>        - nvidia,tegra264-pmc
>  
>    reg:
> -    minItems: 4
> +    minItems: 3
>      maxItems: 5
>  
>    reg-names:
> -    minItems: 4
> -    items:
> -      - const: pmc
> -      - const: wake
> -      - const: aotag
> -      - enum: [ scratch, misc ]
> -      - const: misc
> +    minItems: 3
> +    maxItems: 5

  minItems: 3
  items:
    - const: pmc
    - const: wake
    - enum: [ aotag, cratch, misc ]
    - enum: [ scratch, misc ]
    - const: misc

Should work, no?

>    interrupt-controller: true
>  
> @@ -50,12 +45,12 @@ allOf:
>              const: nvidia,tegra186-pmc
>      then:
>        properties:
> -        reg:
> -          maxItems: 4

You need to keep reg here. Each variant needs matching constraints
between xxx and xxx-names.


>          reg-names:
> -          maxItems: 4
> -          contains:
> -            const: scratch
> +          items:
> +            - const: pmc
> +            - const: wake
> +            - const: aotag
> +            - const: scratch
>  
>    - if:
>        properties:
> @@ -64,21 +59,45 @@ allOf:
>              const: nvidia,tegra194-pmc
>      then:
>        properties:
> -        reg:
> -          minItems: 5

Same here

>          reg-names:
> -          minItems: 5
> +          items:
> +            - const: pmc
> +            - const: wake
> +            - const: aotag
> +            - const: scratch
> +            - const: misc
>  
>    - if:
>        properties:
>          compatible:
>            contains:
> -            const: nvidia,tegra234-pmc
> +            enum:
> +              - nvidia,tegra234-pmc
> +              - nvidia,tegra264-pmc
>      then:
>        properties:

This is fine.

>          reg-names:
> -          contains:
> -            const: misc

Best regards,
Krzysztof

