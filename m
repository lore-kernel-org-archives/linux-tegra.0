Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54493C465;
	Fri,  2 Jan 2026 15:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767369518; cv=none; b=E4Pe2g9RmgqhxLJ9H7VK8AE+OaqwmSCdTLM2tKkEjvds/kcXTKlTlvtyZ8YR0b6TcoKsP7ss0MlwiNt7vXLmp2r5g/cr7/O8+wXYz7WGj/O+RIV/9jtglKD/EV9AmXJqhheE2czK0hScjbadCL/lTf8jBnulVkZSBFgWVzIHp8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767369518; c=relaxed/simple;
	bh=PPpDFLKy+MzvxXHjluPSv/KXPSJTNW+J04zNHdxiXE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jRxJtk42GI9DF80md+/CSiImgwsD36VWZZNs07fGhQ3XUUmsgb1HulqIAUTRzqfF5w5fkawBRWDaluSjCYXsq8SmZIMZhHuhsux8NocOdu2wXYhj1TmiwXW8IZZ7JYiPqrWBQRCs+bSvTn0cbYvqdzC1ZEeaWsfCI39GxA9If8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lg5xcQkF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lg5xcQkF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89F92C116B1;
	Fri,  2 Jan 2026 15:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767369518;
	bh=PPpDFLKy+MzvxXHjluPSv/KXPSJTNW+J04zNHdxiXE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lg5xcQkFX76bBotONUpLGc6Wei1S7UNg/nZ3yvWe/MQ234Q4YalthRijWTFUdP2rH
	 NJYHaJdgMQdgItxpEqYC6EKNytLGJYMmRJ2M6ncFlAJG5CnXp245f6pGeE+XsfxWqP
	 70FgYgV2fRp1Wm5Br6JLHcUj5jj9Je0eAVyOR7/d7HS+5iDQMrZkKZSFCIBFFCmeiw
	 qQIh1R2KqoVZY9l7kM1p4MaGcNLRMRAVgbZgzZ8WmhXD69kIAhKMhoYs05RNdotU2m
	 cNcGycccxNIUtznysD2a6JAkKZbRm5O3GUxfH76gjSqd3o2bEaN+r4vSzExoxltg1Y
	 ypsasO1Z0gKNw==
Date: Fri, 2 Jan 2026 09:58:37 -0600
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
Subject: Re: [PATCH v3] dt-bindings: mtd: nvidia,tegra20-nand: convert to DT
 schema
Message-ID: <20260102155837.GA3840725-robh@kernel.org>
References: <20251231-nvidia-nand-v3-1-2e67664d3674@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231-nvidia-nand-v3-1-2e67664d3674@gmail.com>

On Wed, Dec 31, 2025 at 09:29:32AM +0000, Charan Pedumuru wrote:
> Convert NVIDIA Tegra NAND Flash Controller binding to YAML format.
> Changes during Conversion:
> - Define new properties `power-domains` and `operating-points-v2`
>   because the existing in tree DTS uses them.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
> Changes in v3:
> - Removed pattern properties for partition.
> - Used single quotes for nand string in pattern properties.
> - Modified maxItems value and added minItems to reg property under nand child node.
> - Link to v2: https://lore.kernel.org/r/20251229-nvidia-nand-v2-1-b697d9724b0b@gmail.com
> 
> Changes in v2:
> - Edited the commit description to match the updated changes.
> - Modified the description for the YAML.
> - Removed all the duplicated properties, defined a proper ref for both parent
>   and child nodes.
> - Removed unnecessary properties from the required following the old
>   text binding.
> - Link to v1: https://lore.kernel.org/r/20251030-nvidia-nand-v1-1-7614e1428292@gmail.com
> ---
>  .../bindings/mtd/nvidia,tegra20-nand.yaml          | 103 +++++++++++++++++++++
>  .../bindings/mtd/nvidia-tegra20-nand.txt           |  64 -------------
>  2 files changed, 103 insertions(+), 64 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
> new file mode 100644
> index 000000000000..632cfd7dc5e2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
> @@ -0,0 +1,103 @@
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
> +  '^nand@':
> +    type: object
> +    description: Individual NAND chip connected to the NAND controller
> +    $ref: raw-nand-chip.yaml#
> +
> +    properties:
> +      reg:
> +        minItems: 1
> +        maxItems: 5

Sigh. I gave you the exact schema to use. How is 5 address ENTRIES 
valid? Again:

reg:
  maximum: 5

Rob
