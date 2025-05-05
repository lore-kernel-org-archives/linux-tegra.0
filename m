Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEF825C6FA;
	Mon,  5 May 2025 14:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456247; cv=none; b=mgF4nMUWrQr3yed2vBvXz0pi5HIFcm8x7fGKliaSjQwJwFYvFen5HeUQxJYhBdZkKYEz6JlCterxJ9kkOpT44P5oDBEDMlwmZcNTuko0oSQ4X1Q7uul90MgaSghjlPbDTVZTaFU/OjBEQ82/382d0JPiYl0EnAvHfF0kH3NSMqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456247; c=relaxed/simple;
	bh=smndseL7QsdGKsYZbpXw+Dfwl3TugLqDP36Rp1QyXxw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=AKVQoiGAPPBO5LAAHwlQgcQXZ6MbcpMGMxLCpVccYHd5iUZQVWAndvsoYDGHy3BwZAMuVuva1Jhaz8OiFWDTgJ6VVB++LcksTytsA769Ddl3dk34722bdnlv0dQrEvgU4jNnUIZcJJsjgVOSjdTSibTY9wgWbaAKfxNYUbXicSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AAsX/6mo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AAsX/6mo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23C6EC4CEEE;
	Mon,  5 May 2025 14:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456247;
	bh=smndseL7QsdGKsYZbpXw+Dfwl3TugLqDP36Rp1QyXxw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=AAsX/6mobA5uy2ErTm/GtzwEEolNtZAOUFlA2fdM9/9xqHv2UcA/+La1KjJrxfh0e
	 4h3Hv54xH4yERt/Q58wTOm+Q/+ZEKWcvdSYIshQmgkSmCBpAO0lrDAPODVNLskZdae
	 ISuxS5i0e88knVIGnm06tQnnS+cUDtVR/kI0irhhzGNIVSdC74r9toJzHsrh77uF0Y
	 lYenICq88HMYSd5y5BeFA3X26nyO5K3hvLDmvxcNT3yeCue6sLtmu+UIfLGh/4SwPI
	 5vTK3Jp2z0aCvrJjY8N9ndwWCxOqrsogJadMKJ/90eGQ3ggBYfK01gAMgwQ3ag5yyG
	 nNBZww+TXhSNg==
Date: Mon, 05 May 2025 09:44:05 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thierry Reding <treding@nvidia.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Brad Griffis <bgriffis@nvidia.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxim Schwalm <maxim.schwalm@gmail.com>, Ion Agorria <ion@agorria.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, devicetree@vger.kernel.org
To: Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20250503102950.32744-1-clamor95@gmail.com>
References: <20250503102950.32744-1-clamor95@gmail.com>
Message-Id: <174645594016.1246176.2189109539631594537.robh@kernel.org>
Subject: Re: [PATCH v2 0/3] ARM: tegra: Add device-tree for ASUS
 Transformer Pad LTE TF300TL


On Sat, 03 May 2025 13:29:47 +0300, Svyatoslav Ryhel wrote:
> Add device-tree for ASUS Transformer Pad LTE TF300TL, which is NVIDIA
> Tegra30-based tablet device.
> 
> ---
> Changes from v2:
> - optimized the schema for Transformers
> ---
> 
> Svyatoslav Ryhel (3):
>   dt-bindings: arm: tegra: group Tegra30 based ASUS Transformers
>   dt-bindings: arm: tegra: Add Asus Transformer Pad TF300TL
>   ARM: tegra: Add device-tree for ASUS Transformer Pad LTE TF300TL
> 
>  .../devicetree/bindings/arm/tegra.yaml        |  19 +-
>  arch/arm/boot/dts/nvidia/Makefile             |   1 +
>  .../boot/dts/nvidia/tegra30-asus-tf300tl.dts  | 857 ++++++++++++++++++
>  3 files changed, 866 insertions(+), 11 deletions(-)
>  create mode 100644 arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dts
> 
> --
> 2.48.1
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


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/v6.15-rc4-268-g0a08a7ddff7e (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nvidia/' for 20250503102950.32744-1-clamor95@gmail.com:

arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra30-ictlr']
arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /dma@6000a000: failed to match any schema with compatible: ['nvidia,tegra30-apbdma', 'nvidia,tegra20-apbdma']
arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /dma@6000a000: failed to match any schema with compatible: ['nvidia,tegra30-apbdma', 'nvidia,tegra20-apbdma']
arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /i2c@7000d000/pmic@2d: failed to match any schema with compatible: ['ti,tps65911']
arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: core-regulator@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml#
arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']





