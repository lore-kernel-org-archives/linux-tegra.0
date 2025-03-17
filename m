Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696FF156236;
	Mon, 17 Mar 2025 14:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742221112; cv=none; b=Ahr3JXUg6nIHEIhxmLKcO0eIiZsbwSChO18AJ2+SzYXh9Of6xVYDe8utwsZ4UjtUrddpLjaMSgoNJQ334UE7soXX1LRM7C5smMKtv5L//aWeyLWCbZLOnvQuXlQikciABl/ovHNGsmoG33DpmQ6IITYZjkIKivZWK9UTb89k0+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742221112; c=relaxed/simple;
	bh=bt5Rs3CT2xOnZB+3O1psIp5mxD6SXnBsevglCHt+RAQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=XZ29+k/r4aWN/+6VkziVgz6nCUhK3i0XovmiJtO1qExNtSXTXXZJlX+Z+lDf50GF+IUvO/tXN9c5XF3NctyJNd7/LXk4T9s96nI+koLuEkTdWSrW3fG5joLOAnBCs6Z9v5ATBMtk75T/Eaw9lqjssuiZLUnXyHv2eRVtiR9pvfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PS6meNfW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PS6meNfW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9102BC4CEE3;
	Mon, 17 Mar 2025 14:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742221111;
	bh=bt5Rs3CT2xOnZB+3O1psIp5mxD6SXnBsevglCHt+RAQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=PS6meNfWV6lN4wqhCx9MeXUy//H4oQJnnvhmo46oj68s7rRkIEfp35krN5tmEFntJ
	 RDyLahZXR/JKQg+mA7MNNfMFMUVOQ+A01urO9h6TvdBjWLjuO5JqcWt4q/i78orFqy
	 6orNDDWLHtoYbZP3U7bI7ucfKma4bEZsbD3s9UCoABeTcZjbTVHbe6r15YVGhHcRzU
	 IXnT2BVaMDbWqJ8BMKKZih3HPd5FtfgTNgt5Dqv+7Kl+oRFE2i75mqCPY7p7S4LZRO
	 HFqzEc+yHuYQV8eLoXDC5O+2FW/VX4ydoW/H4FzzeSeyuOsOxYIoS2inLDQLPqk64L
	 lP5zUz5r79KzA==
Date: Mon, 17 Mar 2025 09:18:30 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dara Stotland <dstotland@nvidia.com>, 
 Thierry Reding <treding@nvidia.com>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Maxim Schwalm <maxim.schwalm@gmail.com>, linux-tegra@vger.kernel.org, 
 Ion Agorria <ion@agorria.com>, Thierry Reding <thierry.reding@gmail.com>, 
 Brad Griffis <bgriffis@nvidia.com>, devicetree@vger.kernel.org, 
 Jonathan Hunter <jonathanh@nvidia.com>, David Heidelberg <david@ixit.cz>
To: Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20250315074416.8067-1-clamor95@gmail.com>
References: <20250315074416.8067-1-clamor95@gmail.com>
Message-Id: <174221817975.3957151.15051687182580298463.robh@kernel.org>
Subject: Re: [PATCH v1 0/2] ARM: tegra: Add device-tree for ASUS
 Transformer Pad LTE TF300TL


On Sat, 15 Mar 2025 09:44:14 +0200, Svyatoslav Ryhel wrote:
> Add device-tree for ASUS Transformer Pad LTE TF300TL, which is NVIDIA
> Tegra30-based tablet device.
> 
> Svyatoslav Ryhel (2):
>   dt-bindings: arm: tegra: Add Asus Transformer Pad TF300TL
>   ARM: tegra: Add device-tree for ASUS Transformer Pad LTE TF300TL
> 
>  .../devicetree/bindings/arm/tegra.yaml        |   3 +
>  arch/arm/boot/dts/nvidia/Makefile             |   1 +
>  .../boot/dts/nvidia/tegra30-asus-tf300tl.dts  | 857 ++++++++++++++++++
>  3 files changed, 861 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dts
> 
> --
> 2.43.0
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nvidia/' for 20250315074416.8067-1-clamor95@gmail.com:

arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra30-ictlr']
arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /dma@6000a000: failed to match any schema with compatible: ['nvidia,tegra30-apbdma', 'nvidia,tegra20-apbdma']
arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /dma@6000a000: failed to match any schema with compatible: ['nvidia,tegra30-apbdma', 'nvidia,tegra20-apbdma']
arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /i2c@7000d000/pmic@2d: failed to match any schema with compatible: ['ti,tps65911']
arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: core-regulator@60: Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml#
arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clocks' were unexpected)
	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-rt5631.yaml#





