Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7DB2EF66A;
	Tue, 17 Jun 2025 14:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750170058; cv=none; b=Cw6jsC4Lcn6Cw8x5aewkYMVm65J9ykqB3TmLx7rPXRGBMKPUwoC7BsyKpYoL3FiHW6I+cUcBt0dQZHQS/SjV324VKJ9kBj7/pU81R74ITXnT1X+HG/5BI3//Z1VDgi+Thb0EZXeKhWxWSEhq2cbZuqVJdZlKnaPy17N8RnlQTn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750170058; c=relaxed/simple;
	bh=sdw7k5oHidQopO79fqxIRmRg+33TTaRec4Ui+YTfxbE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=hS2WqtScFgt8Myano82xChHyG1Q2/jvTEZFxvnbk1wwA8bSG6lgI9tjt/WjyLrNLKiA6KdLUuN/bl274PBuzBwg+r2CZtIFcBg2iyjuOgVnVY5Nn9GDhUjjzx3h2w9S7uPftEHHr73dTpDOpdA5W+FpdVSgJ5dpwiLzyAIx+nsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dO5J/+9T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dO5J/+9T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3174CC4CEE3;
	Tue, 17 Jun 2025 14:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750170057;
	bh=sdw7k5oHidQopO79fqxIRmRg+33TTaRec4Ui+YTfxbE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=dO5J/+9T9GbNFmpOekO7g0QKwObWlEh6XFuM6ilxFED7poYIrvvLrMHwoowYsbL9q
	 Z0kerajDaCu5fPYVAh3f1rDNyuoVHl0wKePHaX/Ubpg8zvD5t+9YXfpZYDRTN0KsmD
	 7Eofcs+I8bvVHkjENz8wm1OP7xaQH9r0Rp3agiUSQkbSETM3uZE5fISW5PXDbTV4qp
	 ohGbiH7F4I9C6GKAGx5PKZIB1dwfSYOQG3L55wprMzXWaTywg0omnLZAUEuRUymJAV
	 ViQnDrBU6JHcdaSBSFCEjSL7F6rEfYhBg+150wwEpaskbkmBBiUTrnD1k6S5vsczsI
	 rSb/k48SIHtRQ==
Date: Tue, 17 Jun 2025 09:20:54 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>, 
 David Heidelberg <david@ixit.cz>, linux-kernel@vger.kernel.org, 
 Ion Agorria <ion@agorria.com>, Thierry Reding <thierry.reding@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20250617070320.9153-1-clamor95@gmail.com>
References: <20250617070320.9153-1-clamor95@gmail.com>
Message-Id: <175016979656.2093474.3678510431694468900.robh@kernel.org>
Subject: Re: [PATCH v1 0/2] ARM: tegra: Add device-tree for ASUS VivoTab RT
 TF600T


On Tue, 17 Jun 2025 10:03:18 +0300, Svyatoslav Ryhel wrote:
> Add device-tree for ASUS VivoTab RT TF600T, which is NVIDIA Tegra30-based
> tablet device with Windows RT.
> 
> Maxim Schwalm (1):
>   dt-bindings: arm: tegra: Add Asus VivoTab RT TF600T
> 
> Svyatoslav Ryhel (1):
>   ARM: tegra: Add device-tree for ASUS VivoTab RT TF600T
> 
>  .../devicetree/bindings/arm/tegra.yaml        |    4 +
>  arch/arm/boot/dts/nvidia/Makefile             |    1 +
>  .../boot/dts/nvidia/tegra30-asus-tf600t.dts   | 2500 +++++++++++++++++
>  3 files changed, 2505 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
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
 Base: failed to guess base

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nvidia/' for 20250617070320.9153-1-clamor95@gmail.com:

arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: /i2c@7000c500/flash-led@33: failed to match any schema with compatible: ['ti,tps61052']
arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: audio-codec@1c (realtek,rt5640): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: /i2c@7000d000/pmic@2d: failed to match any schema with compatible: ['ti,tps65911']
arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: light-sensor@48 (capella,cm32181): 'vdd-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: core-regulator@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml#
arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']





