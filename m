Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B822F22;
	Wed, 14 May 2025 21:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747259394; cv=none; b=f3DyW1bRbLnGe76o0FJWffbIngxR8hlq4YcoYZfP6Bk5P48+S0+N3RYoADl+mAgJepn4IPo076CKKF0kNf9FS9Kez2oFrn+s6amT77+BSKHPYFk1ffhJNq1Em6XLexAbI+YLplkpcUiuPPYMHYnuV/AT6JOIVaC7tG/f1pIHhR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747259394; c=relaxed/simple;
	bh=M5N9Uj/TVRF761dj227/sDDUY6pKb0r7vhQltz99Uy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MBCh14K+UYXBLZzOqHjPXbQKLbyYF1AXWeo6ZCA6IDeBEiDBaeSYM58uPPIhsYKgPxV4O4i8v5Ri7ubfGML+f9INVNvO4rywTe75SwGtY6Gg7elejzxr582Tiwcmo4qTTuz/4W27WfPOj2YmQUPYq/eBEl/i6id+pY5UNpWA3cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACB5d+4r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACB5d+4r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 786F4C4CEE3;
	Wed, 14 May 2025 21:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747259393;
	bh=M5N9Uj/TVRF761dj227/sDDUY6pKb0r7vhQltz99Uy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ACB5d+4rorlnzgQu5K5d+aeD+h/PTxV932idcjEdEeftAbA/X8gI07rjneHv2KYV3
	 baZ7VU1ASBmmVorEnZeZuV9DAqxJyhRZUOycgfSK9dN+BO0dVFaHFBostujw9VhdxG
	 E5W0Q2XCKQ+1Vs7VBkzqbfVY8K+h4LzyjIUyBaZxqQE4geCkwNnSlec9EzkFYdAXtM
	 Ka4O+AyKeDJaBcxBYv6ZBTD/DjLg8iT2/Q/tkVzqpPHZ+qSY/C02H3BnotAqCDieiX
	 duCXTdZtY75YY4ejQJ52SgR4OkaLwlIgMAqTzOHWjQ0MPb+J+ev2h9jERaba6LySxq
	 08wl2c9jvzW5w==
Date: Wed, 14 May 2025 16:49:51 -0500
From: Rob Herring <robh@kernel.org>
To: "Sheetal ." <sheetal@nvidia.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
	jonathanh@nvidia.com, perex@perex.cz, tiwai@suse.com
Subject: Re: [PATCH 1/3] dt-bindings: Update Tegra194 and Tegra234 HDA
 bindings
Message-ID: <20250514214951.GA3093539-robh@kernel.org>
References: <20250512064258.1028331-1-sheetal@nvidia.com>
 <20250512064258.1028331-2-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512064258.1028331-2-sheetal@nvidia.com>

On Mon, May 12, 2025 at 06:42:56AM +0000, Sheetal . wrote:
> From: Sheetal <sheetal@nvidia.com>

Needs a 'ASoC' subject prefix on both patches.

> 
> - Tegra194 and Tegra234 HDA is not compatible with Tegra30, hence update
>   them as standalone compatibles. Also, add necessary logic to the binding
>   doc as HDA clocks and resets for Tegra194 and Tegra234 are different from
>   Tegra30. This fixes below dtbs_check errors:
>    - compatible: 'oneOf' conditional failed, one must be fixed:
>         ['nvidia,tegra194-hda'] is too short
>         'nvidia,tegra30-hda' was expected
>         'nvidia,tegra132-hda' was expected
>    - compatible: 'oneOf' conditional failed, one must be fixed:
> 	['nvidia,tegra234-hda'] is too short
> 	'nvidia,tegra30-hda' was expected
>         'nvidia,tegra132-hda' was expected
>    - hda@3510000: clock-names:1: 'hda2hdmi' was expected
>    - hda@3510000: reset-names:1: 'hda2hdmi' was expected
> 
> Signed-off-by: Sheetal <sheetal@nvidia.com>
> ---
>  .../bindings/sound/nvidia,tegra30-hda.yaml    | 83 ++++++++++++++++---
>  1 file changed, 72 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
> index 3ca9affb79a2..703f009862a4 100644
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
> @@ -20,11 +20,12 @@ properties:
>  
>    compatible:
>      oneOf:
> -      - const: nvidia,tegra30-hda
> +      - enum:
> +          - nvidia,tegra30-hda
> +          - nvidia,tegra194-hda
> +          - nvidia,tegra234-hda
>        - items:
>            - enum:
> -              - nvidia,tegra234-hda
> -              - nvidia,tegra194-hda
>                - nvidia,tegra186-hda
>                - nvidia,tegra210-hda
>                - nvidia,tegra124-hda
> @@ -48,10 +49,7 @@ properties:
>  
>    clock-names:
>      minItems: 2
> -    items:
> -      - const: hda
> -      - const: hda2hdmi
> -      - const: hda2codec_2x
> +    maxItems: 3
>  
>    resets:
>      minItems: 2
> @@ -59,10 +57,7 @@ properties:
>  
>    reset-names:
>      minItems: 2
> -    items:
> -      - const: hda
> -      - const: hda2hdmi
> -      - const: hda2codec_2x
> +    maxItems: 3
>  
>    power-domains:
>      maxItems: 1
> @@ -93,6 +88,72 @@ required:
>  
>  additionalProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra30-hda
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          items:
> +            - const: hda
> +            - const: hda2hdmi
> +            - const: hda2codec_2x
> +        resets:
> +          minItems: 3
> +        reset-names:
> +          items:
> +            - const: hda
> +            - const: hda2hdmi
> +            - const: hda2codec_2x
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra194-hda
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          items:
> +            - const: hda
> +            - const: hda2hdmi
> +            - const: hda2codec_2x
> +        resets:
> +          maxItems: 2
> +        reset-names:
> +          items:
> +            - const: hda
> +            - const: hda2hdmi
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra234-hda
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +        clock-names:
> +          items:
> +            - const: hda
> +            - const: hda2codec_2x
> +        resets:
> +          maxItems: 2
> +        reset-names:
> +          items:
> +            - const: hda
> +            - const: hda2codec_2x
> +
>  examples:
>    - |
>      #include<dt-bindings/clock/tegra124-car-common.h>
> -- 
> 2.17.1
> 
