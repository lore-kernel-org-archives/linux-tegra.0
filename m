Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCF8222597;
	Tue, 30 Dec 2025 17:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767115395; cv=none; b=PwkMR6hIuE4Cs4crdLoA1n9o/b8j5RAkP7GcMW+5e3lyWFOkqhkSmhDgzRTLkK9rJ34We4LOoKoTavZro1hGxyraX6QuoFX/GptqWAKletCWwwREvDHH5MlfjpPPRrPPiiP2kmtO2l4LSCFOhFurEoIWTvf/otGtf5L09IiwCmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767115395; c=relaxed/simple;
	bh=qTfYVCT20ISh6uWwWb09hSAKqHDU8HNRpEm2gjALqFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nk9Ng6WjKAlMad5LBDkKxpEDxYpNfvGliqIwzVpmu7Iz6r0tAlXrcD/Rh+dURKgvFoiJt+q2JfJev0ygIRtBfgOHGxi2NM1o3b+m0LFKr44ilQmPJsljokJweReCnUWanattNHAc7f+p8g8j/2FuHvX2AnTeb07OJwTfTwLIapo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=enbE9nHg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="enbE9nHg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 565BBC4CEFB;
	Tue, 30 Dec 2025 17:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767115394;
	bh=qTfYVCT20ISh6uWwWb09hSAKqHDU8HNRpEm2gjALqFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=enbE9nHgwOKOlSCGgp957fOBFPKPgcnNHZ8AW8DfpmYYzPuGS2u5iZxCn9qilNccj
	 do3r7YYXwkCyMCdqf/nHmiOQ29GzD+7zPeePrF+bn5uJEP6OBBhArfx17raHMtYZ0o
	 tckbakqnzCa7LI0uuS4wFotj4eVbGdHWYvMj70JzlcUZEiq3Gbwx3NdqPuwR9S6LfT
	 wEbGCgonjYvuglB0A4OIZPpFroBIOTeneyBMBH6OccOjTD4hX+24U8Fe6Do7R2X670
	 klI7gfoKmSjaQfKlNDPrAeTLrJPKtC8BewnNh8gy7m4JtD3yIa4MCB8R5Ol61ovKvM
	 o3vGZoyYPWFUw==
Date: Tue, 30 Dec 2025 11:23:13 -0600
From: Rob Herring <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: mtd: nvidia,tegra20-nand: convert to DT
 schema
Message-ID: <20251230172313.GA505571-robh@kernel.org>
References: <20251229-nvidia-nand-v2-1-b697d9724b0b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229-nvidia-nand-v2-1-b697d9724b0b@gmail.com>

On Mon, Dec 29, 2025 at 02:31:12PM +0000, Charan Pedumuru wrote:
> Convert NVIDIA Tegra NAND Flash Controller binding to YAML format.
> Changes during Conversion:
> - Define new properties `power-domains` and `operating-points-v2`
>   because the existing in tree DTS uses them.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
> Changes in v2:
> - Edited the commit description to match the updated changes.
> - Modified the description for the YAML.
> - Removed all the duplicated properties, defined a proper ref for both parent
>   and child nodes.
> - Removed unnecessary properties from the required following the old
>   text binding.
> - Link to v1: https://lore.kernel.org/r/20251030-nvidia-nand-v1-1-7614e1428292@gmail.com
> ---
>  .../bindings/mtd/nvidia,tegra20-nand.yaml          | 107 +++++++++++++++++++++
>  .../bindings/mtd/nvidia-tegra20-nand.txt           |  64 ------------
>  2 files changed, 107 insertions(+), 64 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
> new file mode 100644
> index 000000000000..f34eaad67e11
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/nvidia,tegra20-nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra NAND Flash Controller
> +
> +maintainers:
> +  - Jonathan Hunter <jonathanh@nvidia.com>
> +
> +allOf:
> +  - $ref: nand-controller.yaml
> +
> +description:
> +  The NVIDIA NAND controller provides an interface between NVIDIA SoCs
> +  and raw NAND flash devices. It supports standard NAND operations,
> +  hardware-assisted ECC, OOB data access, and DMA transfers, and
> +  integrates with the Linux MTD NAND subsystem for reliable flash management.
> +
> +properties:
> +  compatible:
> +    const: nvidia,tegra20-nand
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: nand
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: nand
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  operating-points-v2:
> +    maxItems: 1
> +

> +patternProperties:
> +  "^nand@[0-5]$":

'^nand@':

The unit-address restriction here doesn't restrict anything.

Single quotes are preferred over double quotes.

> +    type: object
> +    description: Individual NAND chip connected to the NAND controller
> +    $ref: raw-nand-chip.yaml#
> +

properties:
  reg:
    maximum: 5

> +    patternProperties:
> +      "^partition@[0-9a-f]+$":
> +        description:
> +          Optional MTD partitions for the NAND chip, as defined in mtd.yaml
> +        $ref: mtd.yaml#

Drop. All of this is handled by raw-nand-chip.yaml.

> +
> +    required:
> +      - reg

Drop. Already required by nand-chip.yaml.

> +
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/tegra20-car.h>
> +    #include <dt-bindings/gpio/tegra-gpio.h>
> +
> +    nand-controller@70008000 {
> +        compatible = "nvidia,tegra20-nand";
> +        reg = <0x70008000 0x100>;
> +        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&tegra_car TEGRA20_CLK_NDFLASH>;
> +        clock-names = "nand";
> +        resets = <&tegra_car 13>;
> +        reset-names = "nand";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        nand@0 {
> +            reg = <0>;
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +            nand-bus-width = <8>;
> +            nand-on-flash-bbt;
> +            nand-ecc-algo = "bch";
> +            nand-ecc-strength = <8>;
> +            wp-gpios = <&gpio TEGRA_GPIO(S, 0) GPIO_ACTIVE_LOW>;
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt b/Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
> deleted file mode 100644
> index 4a00ec2b2540..000000000000
> --- a/Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -NVIDIA Tegra NAND Flash controller
> -
> -Required properties:
> -- compatible: Must be one of:
> -  - "nvidia,tegra20-nand"
> -- reg: MMIO address range
> -- interrupts: interrupt output of the NFC controller
> -- clocks: Must contain an entry for each entry in clock-names.
> -  See ../clocks/clock-bindings.txt for details.
> -- clock-names: Must include the following entries:
> -  - nand
> -- resets: Must contain an entry for each entry in reset-names.
> -  See ../reset/reset.txt for details.
> -- reset-names: Must include the following entries:
> -  - nand
> -
> -Optional children nodes:
> -Individual NAND chips are children of the NAND controller node. Currently
> -only one NAND chip supported.
> -
> -Required children node properties:
> -- reg: An integer ranging from 1 to 6 representing the CS line to use.
> -
> -Optional children node properties:
> -- nand-ecc-mode: String, operation mode of the NAND ecc mode. Currently only
> -		 "hw" is supported.
> -- nand-ecc-algo: string, algorithm of NAND ECC.
> -		 Supported values with "hw" ECC mode are: "rs", "bch".
> -- nand-bus-width : See nand-controller.yaml
> -- nand-on-flash-bbt: See nand-controller.yaml
> -- nand-ecc-strength: integer representing the number of bits to correct
> -		     per ECC step (always 512). Supported strength using HW ECC
> -		     modes are:
> -		     - RS: 4, 6, 8
> -		     - BCH: 4, 8, 14, 16
> -- nand-ecc-maximize: See nand-controller.yaml
> -- nand-is-boot-medium: Makes sure only ECC strengths supported by the boot ROM
> -		       are chosen.
> -- wp-gpios: GPIO specifier for the write protect pin.
> -
> -Optional child node of NAND chip nodes:
> -Partitions: see mtd.yaml
> -
> -  Example:
> -	nand-controller@70008000 {
> -		compatible = "nvidia,tegra20-nand";
> -		reg = <0x70008000 0x100>;
> -		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&tegra_car TEGRA20_CLK_NDFLASH>;
> -		clock-names = "nand";
> -		resets = <&tegra_car 13>;
> -		reset-names = "nand";
> -
> -		nand@0 {
> -			reg = <0>;
> -			#address-cells = <1>;
> -			#size-cells = <1>;
> -			nand-bus-width = <8>;
> -			nand-on-flash-bbt;
> -			nand-ecc-algo = "bch";
> -			nand-ecc-strength = <8>;
> -			wp-gpios = <&gpio TEGRA_GPIO(S, 0) GPIO_ACTIVE_LOW>;
> -		};
> -	};
> 
> ---
> base-commit: 43edce71d70c603d3f3f1b1c886f65cd02d80c24
> change-id: 20251011-nvidia-nand-024cc7ae8b0a
> 
> Best regards,
> -- 
> Charan Pedumuru <charan.pedumuru@gmail.com>
> 
