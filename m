Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BB8225A40;
	Mon, 16 Jun 2025 21:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750110419; cv=none; b=qZ+o18Sr4iLjqXTYw1ctDr6rHw2l5y+dtosIHRE1bWfrUPhEnfRdjPhB34ddrAZiASDOTOpp1oqUWFwopEXIarBQ8zzKw3wmdhvcPR09lh3IoTy2lL2PtpG27CZg9HXiBMgvTt94MSii3w0AhgdDHk5yv2keOZt+Ww7DOzTZ0k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750110419; c=relaxed/simple;
	bh=A36aYuwtURoz40aiNwrEmviY+Zb8/EdLr3ClzFqkUdA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=r+k8ZxcmnHT0rFSbl1tufn65HWS7ifh9l6ZlS7p5k5KAG7aETELMOR0FXwVFzLB2LxzjBvHSj2aga1ATbikATmtUiD9Ik7Tbgd0PbopSAJ7jq3qXPWTfIDi4PdmhzPlU/41/aOTfkEAMUWSYn88LxNoLzpcNIR92j5bClSsc01w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oPIPpn0H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oPIPpn0H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C9EC4CEEF;
	Mon, 16 Jun 2025 21:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750110418;
	bh=A36aYuwtURoz40aiNwrEmviY+Zb8/EdLr3ClzFqkUdA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=oPIPpn0HPAZX2WYOYfblJ91P4xoMIpp4CA9H7IdDnH1nfJ3aeC5Afn1cMXZFXXZRB
	 3a/47WrMOkRa0OG7OnNZWiniBgYMUmt0XnVSzr8nc9YZno6UsGOyIqBxcAxL79XwhO
	 2orr7DtCCtKEvC1518QcqGRd7r+G+4do224nAZ9axY3eNYog4EhXz0euC1EH/ivgto
	 yRxA1KTLq6bqy33XPpSeOQPsV2KLjRUX/6nmf3tGwUkWvWDMhBZR9DqeSCXZ2TWR1M
	 BgzfAJCDx5h8QdVIFOv6yirQ2hFw8Nyg6NalWrFfzamid+zu5X5SiJrREJPf0t1xDy
	 qIRFgB61clBPw==
Date: Mon, 16 Jun 2025 16:46:57 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Ion Agorria <ion@agorria.com>, David Heidelberg <david@ixit.cz>, 
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maxim Schwalm <maxim.schwalm@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
 devicetree@vger.kernel.org
To: Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20250616073947.13675-1-clamor95@gmail.com>
References: <20250616073947.13675-1-clamor95@gmail.com>
Message-Id: <175011006248.2433980.10650629747156591552.robh@kernel.org>
Subject: Re: [PATCH v1 0/2] ARM: tegra: Add device-tree for Asus Portable
 AiO P1801-T


On Mon, 16 Jun 2025 10:39:45 +0300, Svyatoslav Ryhel wrote:
> Add a device-tree for the Asus Portable AiO P1801-T, which is a NVIDIA
> Tegra30-based 2-in-1 detachable tablet, originally running Android.
> 
> Device tree contains "mstar,tsumu88adt3-lf-1" compatible, a simple bridge
> which was submitted a while ago here [1] but was not applied yet.
> 
> [1] https://lore.kernel.org/lkml/CAPVz0n1udjVZY3400hYMY07DjNKfOt4bwpW6He6A4qo_3pXtqQ@mail.gmail.com/T/#mb50632e269d89275d97c485037da8893239b5410
> 
> Maxim Schwalm (1):
>   dt-bindings: arm: tegra: Add Asus Portable AiO P1801-T
> 
> Svyatoslav Ryhel (1):
>   ARM: tegra: Add device-tree for Asus Portable AiO P1801-T
> 
>  .../devicetree/bindings/arm/tegra.yaml        |    4 +
>  arch/arm/boot/dts/nvidia/Makefile             |    1 +
>  .../boot/dts/nvidia/tegra30-asus-p1801-t.dts  | 2087 +++++++++++++++++
>  3 files changed, 2092 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dts
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
 Base: tags/next-20250616 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nvidia/' for 20250616073947.13675-1-clamor95@gmail.com:

arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: hdmi@54280000 (nvidia,tegra30-hdmi): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-hdmi.yaml#
arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: hdmi@54280000 (nvidia,tegra30-hdmi): 'nvidia,ddc-i2c-bus' is a required property
	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-hdmi.yaml#
arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: hdmi@54280000 (nvidia,tegra30-hdmi): 'nvidia,hpd-gpio' is a required property
	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-hdmi.yaml#
arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: audio-codec@1c (realtek,rt5640): 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: audio-codec@1c (realtek,rt5640): Unevaluated properties are not allowed ('clock-names', 'clocks', 'realtek,ldo1-en-gpios' were unexpected)
	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: /i2c@7000d000/pmic@2d: failed to match any schema with compatible: ['ti,tps65911']
arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: core-regulator@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml#
arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: /bridge: failed to match any schema with compatible: ['mstar,tsumu88adt3-lf-1']





