Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60C7241686;
	Tue, 30 Jun 2026 16:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782837152; cv=none; b=KJAzbSFXJO0jKtvCJJt/xJxr+sfaAQBPnEmdM+NC1YJOilooVC8TryQehdBYNIsacQjsis9I2yhnAAmbr5iHgqhs3QvtZMIverfPz8p/7b1OGPtrmsaNOooa+9LSA7PosRw6d1T8rbDtpiTNYDJX1WggeqBqEJn+/9BDhhgVKNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782837152; c=relaxed/simple;
	bh=6H6k8LUo4pM0jTAf+cmBMP7ME73UIMHQVxt+e6JG7ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9zP+rHHehmXIi/R8QIZDkqKJOM9aeqXuGTZaxzJ+lclCigPLR4GDJ0GOLJEY9KwjD7fUrNLSlVuwDaft/4w54ucJuVWUVfc3IKTLDUuEEdR0iEZsR0mIAR4UNyoLDnAHKvHixJG6UA0+q6h5VabqsX88ccUOX51Ekhw3be79MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e4HcqTch; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e4HcqTch"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 284C01F000E9;
	Tue, 30 Jun 2026 16:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782837151;
	bh=cZA+rBl+CczWQWJIFzL56sY9zOdyEBAGbEMiEyp4qoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e4HcqTchm8gnuTYCG2O9/toh0hBP0QRQMTi/mP0OASyYb2Ebitc/5cJjCAcWhHd+2
	 tR4ycs2NolMZhu9mJvwHYn8ghnq9pZv3n+IY25OnvB8rQEcFeXHYKmDkxcYhWkxIaR
	 bul9VtBkxtbfHHEtFSOhUo04MqTQBYuxOjVVULcOUVaQNZ4JA2S2acxL/l3W7Hv4aN
	 uah9eIi1HnyGiUOIBVd9B+8S5DFbXCI07qZhrv3/1wwJLIqzcWAT/u99FZzhDaKi2V
	 f7nuZgcC5UzpAIc2Tel92bvRkg41LX71fRfX1Gysog9qvsVapjfg+QCDkKz6m7+FUQ
	 scH39KG/1T34A==
Date: Tue, 30 Jun 2026 11:32:30 -0500
From: Rob Herring <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: sound: nvidia,tegra30-ahub:
 Convert to DT schema
Message-ID: <20260630163230.GA3903861-robh@kernel.org>
References: <20260625-nvidia-ahub-v2-1-eb041c30f1f8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625-nvidia-ahub-v2-1-eb041c30f1f8@gmail.com>

On Thu, Jun 25, 2026 at 03:28:48PM +0000, Charan Pedumuru wrote:
> Convert NVIDIA Tegra Audio Hub (AHUB) binding to DT schema.
> 
> Per-SoC differences in reg, reset-names, and dma-names are enforced
> via allOf conditionals.
> 
> Add patternProperties for i2s child nodes referencing
> nvidia,tegra30-i2s.yaml, reflecting actual DTSI usage where i2s
> controllers are placed directly under ahub. nvidia,ahub-cif-ids is
> not redeclared here as it is defined in the child i2s schema.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---

[...]

> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.yaml
> new file mode 100644
> index 000000000000..1c3fc7a97465
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.yaml
> @@ -0,0 +1,297 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nvidia,tegra30-ahub.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra Audio Hub (AHUB)
> +
> +maintainers:
> +  - Jonathan Hunter <jonathanh@nvidia.com>
> +
> +description:
> +  The NVIDIA Tegra AHUB (Audio Hub) is an audio interconnect block used to
> +  route data between various audio clients such as I2S, DAM, SPDIF, and
> +  APBIF. It exposes multiple register regions and supports different
> +  configurations depending on the Tegra SoC generation. The AHUB also
> +  provides a configlink bus for child audio components, which use CIF
> +  (Client Interface) IDs to identify their data paths. The number of DMA
> +  channels, reset lines, and additional modules varies across Tegra30,
> +  Tegra114, and Tegra124 platforms.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - nvidia,tegra114-ahub
> +          - nvidia,tegra124-ahub
> +          - nvidia,tegra30-ahub
> +      - items:
> +          - const: nvidia,tegra132-ahub
> +          - const: nvidia,tegra124-ahub
> +
> +  reg:
> +    minItems: 2
> +    maxItems: 3

Somewhere what each entry is needs to be defined.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Clock for the D_AUDIO domain
> +      - description: Clock for the APBIF interface
> +
> +  clock-names:
> +    items:
> +      - const: d_audio
> +      - const: apbif
> +
> +  resets:
> +    minItems: 11
> +    maxItems: 21
> +
> +  reset-names:
> +    minItems: 11
> +    maxItems: 21
> +
> +  dmas:
> +    minItems: 8
> +    maxItems: 20
> +
> +  dma-names:
> +    minItems: 8
> +    items:
> +      - const: rx0
> +      - const: tx0
> +      - const: rx1
> +      - const: tx1
> +      - const: rx2
> +      - const: tx2
> +      - const: rx3
> +      - const: tx3
> +      - const: rx4
> +      - const: tx4
> +      - const: rx5
> +      - const: tx5
> +      - const: rx6
> +      - const: tx6
> +      - const: rx7
> +      - const: tx7
> +      - const: rx8
> +      - const: tx8
> +      - const: rx9
> +      - const: tx9
> +
> +  "#address-cells":
> +    enum: [1, 2]
> +
> +  "#size-cells":
> +    enum: [1, 2]
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^i2s@[0-9a-f]+$":
> +    $ref: /schemas/sound/nvidia,tegra30-i2s.yaml#
> +    unevaluatedProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nvidia,tegra30-ahub
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2

Drop. 2 is already the min.

> +          maxItems: 2
> +
> +        resets:
> +          minItems: 11

Drop. 11 is already the min at the top-level.

Same issue elsewhere.

> +          maxItems: 11
> +
> +        reset-names:
> +          items:
> +            - const: d_audio
> +            - const: apbif
> +            - const: i2s0
> +            - const: i2s1
> +            - const: i2s2
> +            - const: i2s3
> +            - const: i2s4
> +            - const: dam0
> +            - const: dam1
> +            - const: dam2
> +            - const: spdif
> +
> +        dmas:
> +          minItems: 8
> +          maxItems: 8
> +
> +        dma-names:
> +          minItems: 8
> +          maxItems: 8
> +
> +        "#address-cells":
> +          const: 1
> +
> +        "#size-cells":
> +          const: 1
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nvidia,tegra114-ahub
> +    then:
> +      properties:
> +        reg:
> +          minItems: 3
> +          maxItems: 3

3 is already the max.

> +
> +        resets:
> +          minItems: 13
> +          maxItems: 13
> +
> +        reset-names:
> +          items:
> +            - const: d_audio
> +            - const: apbif
> +            - const: i2s0
> +            - const: i2s1
> +            - const: i2s2
> +            - const: i2s3
> +            - const: i2s4
> +            - const: dam0
> +            - const: dam1
> +            - const: dam2
> +            - const: spdif
> +            - const: amx
> +            - const: adx
> +
> +        dmas:
> +          minItems: 20
> +          maxItems: 20
> +
> +        dma-names:
> +          minItems: 20
> +          maxItems: 20
> +
> +        "#address-cells":
> +          const: 1
> +
> +        "#size-cells":
> +          const: 1
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nvidia,tegra124-ahub
> +    then:
> +      properties:
> +        reg:
> +          minItems: 3
> +          maxItems: 3
> +
> +        resets:
> +          minItems: 21
> +          maxItems: 21
> +
> +        reset-names:
> +          items:
> +            - const: d_audio
> +            - const: apbif
> +            - const: i2s0
> +            - const: i2s1
> +            - const: i2s2
> +            - const: i2s3
> +            - const: i2s4
> +            - const: dam0
> +            - const: dam1
> +            - const: dam2
> +            - const: spdif
> +            - const: amx
> +            - const: amx1
> +            - const: adx
> +            - const: adx1
> +            - const: afc0
> +            - const: afc1
> +            - const: afc2
> +            - const: afc3
> +            - const: afc4
> +            - const: afc5
> +
> +        dmas:
> +          minItems: 20
> +          maxItems: 20
> +
> +        dma-names:
> +          minItems: 20
> +          maxItems: 20
> +
> +        "#address-cells":
> +          const: 2
> +
> +        "#size-cells":
> +          const: 2
> +
> +required:
> +  - reg
> +  - compatible
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - dmas
> +  - dma-names
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/tegra30-car.h>

blank line

> +    ahub@70080000 {

