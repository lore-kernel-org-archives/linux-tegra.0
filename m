Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6AA212566;
	Mon, 15 Jun 2026 06:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781506206; cv=none; b=Fne6EdgTCfzBcqMKlbFuLnTOpAshAtdXMIs+Dl1ZPm/VTOpr+iHUvLnG1KfncowGZ0YnnPCqerDHJ8GRv68FSZgXRCMgeASAx78ugor6v9YUSDt2UbmDFo41/Pb8QJ8zMuOXnRmIVVSsFVu9XMp+vNfd7D78SAhlQKCH9eEfiLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781506206; c=relaxed/simple;
	bh=nbBWCN43WhVZchOLIQLo1S7IYZf3BPO42t+KLyycqRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vGZit9/xI/8pgl5bZWHDnxVbBGfA+oauDMSz599kIKdd2PZcIiiW/zBPLuJNxKIKDmVGHKw38ypTQjRKLfGaWjSAPrPzrtxFh2FRxHSoL7KwKEkvrzZIi1xkX80/2S2o0szzIhnKSoYEZdO3KQXVbrfMSud3/K06I9i8bpotK5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dut3mYcX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dut3mYcX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B022C1F000E9;
	Mon, 15 Jun 2026 06:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781506204;
	bh=gkuDNjDmQBYCoi2QouMWrvlizYAYJN38sjYzs5jQLTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dut3mYcXJDV3CCNktfb8pse6t+h1L4ywPAoEe1dPKkFgFRzDqI00nAgQCMb8XyTcv
	 9vyUZUToaIWNQJhIbq60Xyrs0i8tjRjcCh+6e+6CHjbrjeb5kReSaYA4ZoQyAr/0Ql
	 cJ+271A3eaBh0oMKRKICov81jt8o3Ea3X4ulkzCcZQ8e7f7xx5qDSEKjI3cQyWnHy6
	 YcDMCilyhLh5QLWdf2i4jc0kjt7/usyyp9AaVc1aU0ro46HljgSK3HNYJTAcXV2imQ
	 GEkMO0cuTslCKjKBkFWmf4gyVDHn69jH4Uy7Ix3a0/v1cvTzGm4g7Hy5xotvBWLZQC
	 a+GPhE7fDsanA==
Date: Mon, 15 Jun 2026 08:50:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: sound: nvidia,tegra30-ahub: Convert to DT
 schema
Message-ID: <20260615-elastic-spiked-kudu-6ef296@quoll>
References: <20260613-nvidia-ahub-v1-1-5b7e85301736@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260613-nvidia-ahub-v1-1-5b7e85301736@gmail.com>

On Sat, Jun 13, 2026 at 08:24:47AM +0000, Charan Pedumuru wrote:
> Convert NVIDIA Tegra Audio Hub (AHUB) binding to DT schema.

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

ASoC: dt-bindings:

...

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
> +      - const: nvidia,tegra30-ahub
> +      - const: nvidia,tegra114-ahub
> +      - const: nvidia,tegra124-ahub

These three are enum and please sort alphanumerically, not by natural
sorting (so 30 > 124)

> +      - items:
> +          - const: nvidia,tegra132-ahub
> +          - const: nvidia,tegra124-ahub
> +
> +  reg:
> +    minItems: 2
> +    maxItems: 3
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
> +    oneOf:
> +      # Tegra30: d_audio apbif i2s0-4 dam0-2 spdif
> +      - items:
> +          - const: d_audio
> +          - const: apbif
> +          - const: i2s0
> +          - const: i2s1
> +          - const: i2s2
> +          - const: i2s3
> +          - const: i2s4
> +          - const: dam0
> +          - const: dam1
> +          - const: dam2
> +          - const: spdif
> +
> +      # Tegra114: adds amx adx
> +      - items:
> +          - const: d_audio
> +          - const: apbif
> +          - const: i2s0
> +          - const: i2s1
> +          - const: i2s2
> +          - const: i2s3
> +          - const: i2s4
> +          - const: dam0
> +          - const: dam1
> +          - const: dam2
> +          - const: spdif
> +          - const: amx
> +          - const: adx
> +
> +      # Tegra124: adds amx1 adx1 afc0-5
> +      - items:
> +          - const: d_audio
> +          - const: apbif
> +          - const: i2s0
> +          - const: i2s1
> +          - const: i2s2
> +          - const: i2s3
> +          - const: i2s4
> +          - const: dam0
> +          - const: dam1
> +          - const: dam2
> +          - const: spdif
> +          - const: amx
> +          - const: amx1
> +          - const: adx
> +          - const: adx1
> +          - const: afc0
> +          - const: afc1
> +          - const: afc2
> +          - const: afc3
> +          - const: afc4
> +          - const: afc5

These should be placed in allOf: section. Here define only min/maxItems.

> +
> +  dmas:
> +    minItems: 8
> +    maxItems: 20
> +
> +  dma-names:
> +    oneOf:
> +      # Tegra30: rx0..rx3 tx0..tx3 (n=3)
> +      - items:
> +          - const: rx0
> +          - const: tx0
> +          - const: rx1
> +          - const: tx1
> +          - const: rx2
> +          - const: tx2
> +          - const: rx3
> +          - const: tx3
> +
> +      # Tegra114/124: rx0..rx9 tx0..tx9 (n=9)
> +      - items:
> +          - const: rx0
> +          - const: tx0
> +          - const: rx1
> +          - const: tx1
> +          - const: rx2
> +          - const: tx2
> +          - const: rx3
> +          - const: tx3
> +          - const: rx4
> +          - const: tx4
> +          - const: rx5
> +          - const: tx5
> +          - const: rx6
> +          - const: tx6
> +          - const: rx7
> +          - const: tx7
> +          - const: rx8
> +          - const: tx8
> +          - const: rx9
> +          - const: tx9

Keep this list (so drop the "oneOf") and add minItems. Then in
allOf:if:then: block you customize min/maxItems.

> +
> +  "#address-cells":
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  "#size-cells":
> +    $ref: /schemas/types.yaml#/definitions/uint32

You do not need types. You need values (const). See also other bindings
for examples. Even if this is MMIO bus, I doubt children need 64-bit
addressing, so this should be really 32-bit (thus const:1 , not even
enum). If you need 64-bit addressing (e.g. for DMA), this would have to
be explained.

> +
> +  ranges: true
> +
> +patternProperties:
> +  "^i2s@[0-9a-f]+$":

I think this was not in the old binding. so you need to explain in
commit msg why you made this change to the binding.

> +    type: object
> +
> +    allOf:
> +      - $ref: /schemas/sound/nvidia,tegra30-i2s.yaml#

$ref directly, no need for allOf

> +
> +    properties:
> +      nvidia,ahub-cif-ids:
> +        description: Pair of AHUB CIF IDs for the RX and TX data paths.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 2
> +        maxItems: 2
> +
> +    required:
> +      - nvidia,ahub-cif-ids

Why do you need the properties and required here? The child (i2s) schema
should define that.

> +
> +    unevaluatedProperties: false
> +

Best regards,
Krzysztof

