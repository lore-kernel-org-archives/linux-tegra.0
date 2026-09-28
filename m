Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC7248CD50;
	Mon, 28 Sep 2026 21:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790631988; cv=none; b=sKevnXyR2Iy0s0nlvXBan9vE4U83ie+5aGaO52kBNhR8QGCVmLgqTJAxU8f9Bebb8KTXuzcmec9L6F1oHs19hSRD6UPMsbOckg8iiH64578zc3+qrMTDgr+q8H4cqDaK9U06b3rrGZc6dfBVDlqwBncCCH/w5A5gMMV3H20FWEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790631988; c=relaxed/simple;
	bh=CQt49t+MN3sTKuxWLz8qmvE9j3U97SgYETRg8kRECvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vsk3QTDz221s7H+0yQjFhLBG9s9NV1iJzcPZmy+b47+Pg4WgReOPVEEbfByUpuGRu4cSoMW5zJcxibDyEjuCoRy/NI0epCr4JIx0eOWRLIIZLFN3r/MUbG8nBmgALmPluJp8l4VsvZeIWWtI9vB4o85iakP3wRBCYNEtvxochgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AIdFkN5a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AIdFkN5a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AAAC1F000FF;
	Mon, 28 Sep 2026 21:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790631977;
	bh=y/Atjq+YNbLepkXbAJsuUwkZd/yWBjBM/VM157Ek4w0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AIdFkN5aWvrJGi3cUpaK044VDVPGSQ7lDaOlIWJpXpn1q/x0cHj8JFFpREvjSywle
	 M0mD82XbcosKGoJrl8slWtLE0j33DGgcf5sd8hihNsBmQB1PV8yDfzUFzoNkr7lpCd
	 eP976LWMkxemByOiMtWDdA6f8nW6JsRmYUu1eVqzl4QEa7AbqmL+wnZkCU5hncRGvz
	 2hkOECiyrjp5biwxtEGAbjReBc+eEGhV2gTEFyb/Tmt8yF1uBOMQrecMXu0j7v3ruM
	 tPoW2qnyI80WvzKqheJfp/c0Uxbhi3awSAKN012IgWLD+zszhAOizBUbabBupGt+my
	 Mga+/Foe0zIOg==
Date: Mon, 28 Sep 2026 16:46:15 -0500
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 2/2] dt-bindings: sound: tegra-ahub: Convert to
 json-schema
Message-ID: <20260928214615.GA886365-robh@kernel.org>
References: <20260928-as3722-bindings-v1-0-35f423a9f2b2@nvidia.com>
 <20260928-as3722-bindings-v1-2-35f423a9f2b2@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928-as3722-bindings-v1-2-35f423a9f2b2@nvidia.com>

On Mon, Sep 28, 2026 at 06:24:41PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert Tegra AHUB bindings from the free-form text format to
> json-schema.

Pretty sure there was a prior version posted... Please check any 
comments there.

> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/sound/nvidia,tegra30-ahub.txt         |  88 -------
>  .../bindings/sound/nvidia,tegra30-ahub.yaml        | 260 +++++++++++++++++++++
>  2 files changed, 260 insertions(+), 88 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.txt
> deleted file mode 100644
> index 0e9a1895d7fb..000000000000
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.txt
> +++ /dev/null
> @@ -1,88 +0,0 @@
> -NVIDIA Tegra30 AHUB (Audio Hub)
> -
> -Required properties:
> -- compatible : For Tegra30, must contain "nvidia,tegra30-ahub".  For Tegra114,
> -  must contain "nvidia,tegra114-ahub".  For Tegra124, must contain
> -  "nvidia,tegra124-ahub".  Otherwise, must contain "nvidia,<chip>-ahub",
> -  plus at least one of the above, where <chip> is tegra132.
> -- reg : Should contain the register physical address and length for each of
> -  the AHUB's register blocks.
> -  - Tegra30 requires 2 entries, for the APBIF and AHUB/AUDIO register blocks.
> -  - Tegra114 requires an additional entry, for the APBIF2 register block.
> -- interrupts : Should contain AHUB interrupt
> -- clocks : Must contain an entry for each entry in clock-names.
> -  See ../clocks/clock-bindings.txt for details.
> -- clock-names : Must include the following entries:
> -  - d_audio
> -  - apbif
> -- resets : Must contain an entry for each entry in reset-names.
> -  See ../reset/reset.txt for details.
> -- reset-names : Must include the following entries:
> -  Tegra30 and later:
> -  - d_audio
> -  - apbif
> -  - i2s0
> -  - i2s1
> -  - i2s2
> -  - i2s3
> -  - i2s4
> -  - dam0
> -  - dam1
> -  - dam2
> -  - spdif
> -  Tegra114 and later additionally require:
> -  - amx
> -  - adx
> -  Tegra124 and later additionally require:
> -  - amx1
> -  - adx1
> -  - afc0
> -  - afc1
> -  - afc2
> -  - afc3
> -  - afc4
> -  - afc5
> -- ranges : The bus address mapping for the configlink register bus.
> -  Can be empty since the mapping is 1:1.
> -- dmas : Must contain an entry for each entry in clock-names.
> -  See ../dma/dma.txt for details.
> -- dma-names : Must include the following entries:
> -  - rx0 .. rx<n>
> -  - tx0 .. tx<n>
> -  ... where n is:
> -  Tegra30: 3
> -  Tegra114, Tegra124: 9
> -- #address-cells : For the configlink bus. Should be <1>;
> -- #size-cells : For the configlink bus. Should be <1>.
> -
> -AHUB client modules need to specify the IDs of their CIFs (Client InterFaces).
> -For RX CIFs, the numbers indicate the register number within AHUB routing
> -register space (APBIF 0..3 RX, I2S 0..5 RX, DAM 0..2 RX 0..1, SPDIF RX 0..1).
> -For TX CIFs, the numbers indicate the bit position within the AHUB routing
> -registers (APBIF 0..3 TX, I2S 0..5 TX, DAM 0..2 TX, SPDIF TX 0..1).
> -
> -Example:
> -
> -ahub@70080000 {
> -	compatible = "nvidia,tegra30-ahub";
> -	reg = <0x70080000 0x200 0x70080200 0x100>;
> -	interrupts = < 0 103 0x04 >;
> -	nvidia,dma-request-selector = <&apbdma 1>;
> -	clocks = <&tegra_car 106>, <&tegra_car 107>;
> -	clock-names = "d_audio", "apbif";
> -	resets = <&tegra_car 106>, <&tegra_car 107>, <&tegra_car 30>,
> -		<&tegra_car 11>, <&tegra_car 18>, <&tegra_car 101>,
> -		<&tegra_car 102>, <&tegra_car 108>, <&tegra_car 109>,
> -		<&tegra_car 110>, <&tegra_car 10>;
> -	reset-names = "d_audio", "apbif", "i2s0", "i2s1", "i2s2",
> -		"i2s3", "i2s4", "dam0", "dam1", "dam2",
> -		"spdif";
> -	dmas = <&apbdma 1>, <&apbdma 1>;
> -	       <&apbdma 2>, <&apbdma 2>;
> -	       <&apbdma 3>, <&apbdma 3>;
> -	       <&apbdma 4>, <&apbdma 4>;
> -	dma-names = "rx0", "tx0", "rx1", "tx1", "rx2", "tx2", "rx3", "tx3";
> -	ranges;
> -	#address-cells = <1>;
> -	#size-cells = <1>;
> -};
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.yaml
> new file mode 100644
> index 000000000000..c064a2acae5e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.yaml
> @@ -0,0 +1,260 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nvidia,tegra30-ahub.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra30 AHUB (Audio Hub)
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +description: AHUB client modules need to specify the IDs of their CIFs (Client InterFaces). For RX
> +  CIFs, the numbers indicate the register number within AHUB routing register space (APBIF 0..3 RX,
> +  I2S 0..5 RX, DAM 0..2 RX 0..1, SPDIF RX 0..1). For TX CIFs, the numbers indicate the bit position
> +  within the AHUB routing registers (APBIF 0..3 TX, I2S 0..5 TX, DAM 0..2 TX, SPDIF TX 0..1).

CR after 'description' and rewrap to 80 chars.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - nvidia,tegra30-ahub
> +      - nvidia,tegra114-ahub
> +      - nvidia,tegra124-ahub
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
> +      - description: digital audio clock
> +      - description: module clock
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
> +  ranges: true
> +
> +  dmas:
> +    minItems: 8
> +    maxItems: 20
> +
> +  dma-names:
> +    minItems: 8
> +    maxItems: 20
> +
> +  "#address-cells":
> +    enum: [ 1, 2 ]
> +
> +  "#size-cells":
> +    enum: [ 1, 2 ]
> +
> +patternProperties:
> +  "^i2s@[0-9a-f]+$":
> +    type: object

       required:
         - compatible

Otherwise, we can't be sure it is validated. Or if there isn't a 
compatible, then the schema needs to go here (directly or via a $ref).

Rob
