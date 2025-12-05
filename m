Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484F42E9EC3;
	Fri,  5 Dec 2025 22:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764974206; cv=none; b=aEzKnZ0RRKriYwkXYWkxS2bt4AD6LyuDolj8LtfScIA49PBSQ5s/PzmXwX7bet+2UBIYoTPpoGPqOTgRsE8/5IJFyMvl3/GpOhKTuQGgy6fBKFNrU2VdpQYYtzzq1ef/76vFW5efvIz0+Y7V8SfFnHGeGnn7NnGubc2FPEWjpUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764974206; c=relaxed/simple;
	bh=pRvBU8hdBshi9X9/i75oX46Ef1xJoQXQr1hheMftI0g=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=dXvPHa2n4Ql1HY9AlyspHlOdPwv7AUWXgLpm2IUx5mlmNiC1YBzZn3fnaQTf5wxieqMdm8xg1OcjENWWQsi91ayjpNyEo2+d+n/pZ2U+htFDLQc/Qn73P562siEeWt85BLgTrlqRn5ayGJli2ov3SM5lOX2OB5jPpPx/2/s+uwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lYHq/kud; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lYHq/kud"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A9DC4CEF1;
	Fri,  5 Dec 2025 22:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764974205;
	bh=pRvBU8hdBshi9X9/i75oX46Ef1xJoQXQr1hheMftI0g=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=lYHq/kud809TW3bsbzges0zp3fv6LxYXCRbSyi6P/Npp41ojx0a1VDMdwybVETkPo
	 JubZ5OuNP2RIBzbNrFEe0pX+yKsePiNtGKenx4subPa706SbuOrE666MWF11az5X3m
	 +2emWkUDuJ4q8mfYXVA4Dgr48KjgzbwYFh0ZH8gsdzFUcJMUKRsBzysMko//EKoo3y
	 AUdp70h5nYu3PpvT+bO7f5b9xyQRT6apX5ijNNO+fqmnBQzmb1Z/njczlSLyqY7QjN
	 gJm3wiESPpQahKbFLZJlS3wIzHjpG/sTnzOmcGbfof4nojokKXfvUE81jQFnmesCv6
	 1lrLDIWlF8ewQ==
From: Rob Herring <robh@kernel.org>
Date: Fri, 05 Dec 2025 16:36:44 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: Jonathan Hunter <jonathanh@nvidia.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Ion Agorria <ion@agorria.com>, 
 linux-tegra@vger.kernel.org
To: Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20251204060856.4994-1-clamor95@gmail.com>
References: <20251204060856.4994-1-clamor95@gmail.com>
Message-Id: <176497381556.863476.14617613789034811129.robh@kernel.org>
Subject: Re: [PATCH v2 0/1 RESEND] ARM: tegra: add support for Xiaomi Mi
 Pad (A0101)


On Thu, 04 Dec 2025 08:08:55 +0200, Svyatoslav Ryhel wrote:
> The Mi Pad is a tablet computer based on Nvidia Tegra K1 SoC which
> originally ran the Android operating system. The Mi Pad has a 7.9" IPS
> display with 1536 x 2048 (324 ppi) resolution. 2 GB of RAM and 16/64 GB of
> internal memory that can be supplemented with a microSDXC card giving up
> to 128 GB of additional storage.
> 
> This patchset includes some schema changes not yet applied. They can be
> found here:
> - https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250909143432.121323-2-clamor95@gmail.com/
> - https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250912065146.28059-2-clamor95@gmail.com/
> - https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250912064253.26346-2-clamor95@gmail.com/
> 
> UPD: patchsets above were accepted
> 
> ---
> Changes in v2:
> - added fuel gauge interrupt
> - added CE gpio for charger
> - removed always-on for vdd_gpu
> - improved pinmux configuration
> - added camera regulators
> - removed usb@70090000 (already disabled in common tree)
> - set correct modes for mmc devices
> - removed thermistor thermal zone (not used by mocha)
> - fixed pmc interrupt polarity (removed interrupt inverted prop)
> - configured OTG support
> - removed bluetooth reset-gpios
> ---
> 
> Svyatoslav Ryhel (1):
>   ARM: tegra: add device-tree for Xiaomi Mi Pad (A0101)
> 
>  arch/arm/boot/dts/nvidia/Makefile             |    3 +-
>  .../boot/dts/nvidia/tegra124-xiaomi-mocha.dts | 2790 +++++++++++++++++
>  2 files changed, 2792 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dts
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
 Base: tags/v6.18-rc6-2003-gef7de33544a7 (exact match)
 Base: tags/v6.18-rc6-2003-gef7de33544a7 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nvidia/' for 20251204060856.4994-1-clamor95@gmail.com:

arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra124-pcie']
arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: dsi@54300000 (nvidia,tegra124-dsi): Unevaluated properties are not allowed ('port' was unexpected)
	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-dsi.yaml
arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: dsi@54400000 (nvidia,tegra124-dsi): Unevaluated properties are not allowed ('port' was unexpected)
	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-dsi.yaml
arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: dma@60020000 (nvidia,tegra124-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml
arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /i2c@7000d000/pmic@58/extcon: failed to match any schema with compatible: ['ti,palmas-usb-vid']
arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /i2c@7000d000/pmic@58/palmas-clk32k@0: failed to match any schema with compatible: ['ti,palmas-clk32kg']
arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /i2c@7000d000/pmic@58/pinmux: failed to match any schema with compatible: ['ti,tps65913-pinctrl']
arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /i2c@7000d000/pmic@58/rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra124-dfll']
arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /ahub@70300000: failed to match any schema with compatible: ['nvidia,tegra124-ahub']
arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vdd-cpu-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: led-controller (pwm-leds): 'led-button' does not match any of the regexes: '^led(-[0-9a-f]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml





