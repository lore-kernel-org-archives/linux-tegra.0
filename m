Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8102E33121F;
	Thu, 22 Jan 2026 18:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769105235; cv=none; b=BDDeZbQC67/AtN4xaKSoYlAV3akNJ+kLGMo7fj+TI85YysOlN3cUiiAJMfzQCL8s5nkymUDYHFr09G9sd/BOwL9/5KtjRhcskkGoyN629srrV2QgprtTAXd1/pe7rW9UqRZp6doNGD9pKWmgB1vWCLZl+SkIJp4uerSJKUrrBDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769105235; c=relaxed/simple;
	bh=Hsd3ZQlD1HlwYxcnrBzb04fEmgDWvYyBfv030RV9lPk=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Rk8zdRauOPpmafq/Unae1Nh4sm7/sIJ0sITE/i16Il6W97c5uxXSirr6Sp4Wgmh1/bY36LG8nLgWCmeZOC+U5AXi0tXNnHqj4Ahse3yNYZu0PmE1AHHhvNFpvywDyhA/u+KDZaBQftSEQr9OMX2fU6CLZXDH8gnXE7GS2+70rwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BckzC+SQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BckzC+SQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A9DC116C6;
	Thu, 22 Jan 2026 18:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769105234;
	bh=Hsd3ZQlD1HlwYxcnrBzb04fEmgDWvYyBfv030RV9lPk=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=BckzC+SQiWY/8mtYq5ZVAQeBDytz58TDKZ94CPGeSE1QtiNGk/6tGWwPS/jN2KUw6
	 JRD9BC7j5bvjYqe0JhoYJHw+bIOcMWbBESjqwXU+Zbk+oRC4tdZcsV9CtKAkblTsDI
	 DLbnX+qRaOuRigna2IC0Xdnv8z4+hIV36kQUN/4m1W842HcbtN8/KYcutjHfYOt6xi
	 Cdfu4ICbrXdegK30/KqJ1cz3GJc2VPtzDwQ+MRy5+yK+aciJTY81knItfXPjjS7gYM
	 Fg2QiAbLfHK/WIVroI4y+xJeLgCESVnXbJwSK/KvXlHlCheJ8nTDdGhmO9Fym5g42U
	 VWNDPjZ4eRIpw==
From: Rob Herring <robh@kernel.org>
Date: Thu, 22 Jan 2026 12:07:13 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, 
 =?utf-8?q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
 Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org, 
 Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org
To: Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20260122152713.8311-1-clamor95@gmail.com>
References: <20260122152713.8311-1-clamor95@gmail.com>
Message-Id: <176910484081.3006932.4278499225364273753.robh@kernel.org>
Subject: Re: [PATCH v1 0/3] ARM: tegra: lg-x3: add missing nodes


On Thu, 22 Jan 2026 17:27:10 +0200, Svyatoslav Ryhel wrote:
> With the recent kernel updates, Tegra30-based LG smartphones now support
> several additional features, including an RGB-DSI bridge, DSI panels,
> MUIC, a charger, a battery temperature sensor, OTG mode, and capacitive
> buttons on the P895. Add required nodes to device trees.
> 
> Svyatoslav Ryhel (3):
>   ARM: tegra: lg-x3: add panel and bridge nodes
>   ARM: tegra: lg-x3: add USB and power related nodes
>   ARM: tegra: lg-x3: add node for capacitive buttons
> 
>  arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts |  23 +++
>  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts |  33 ++++
>  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi  | 174 ++++++++++++++++++-
>  3 files changed, 227 insertions(+), 3 deletions(-)
> 
> --
> 2.51.0
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
 Base: tags/next-20260121 (exact match)
 Base: tags/next-20260121 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nvidia/' for 20260122152713.8311-1-clamor95@gmail.com:

arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: adc@48 (ti,tsc2007): '#io-channel-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2007.yaml
arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: adc@48 (ti,tsc2007): '#io-channel-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2007.yaml
arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: coil@c (dongwoon,dw9714): 'enable-gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9714.yaml
arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /i2c@7000c500/camera-pmic@7d: failed to match any schema with compatible: ['ti,lp8720']
arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: coil@c (dongwoon,dw9714): 'enable-gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9714.yaml
arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /i2c@7000c500/camera-pmic@7d: failed to match any schema with compatible: ['ti,lp8720']
arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /i2c@7000d000/max77663@1c: failed to match any schema with compatible: ['maxim,max77663']
arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /i2c@7000d000/max77663@1c: failed to match any schema with compatible: ['maxim,max77663']
arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: dsi@2 (solomon,ssd2825): '#address-cells', '#size-cells', 'panel@1' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/bridge/solomon,ssd2825.yaml
arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: dsi@2 (solomon,ssd2825): ports:port@0:endpoint: Unevaluated properties are not allowed ('data-lines' was unexpected)
	from schema $id: http://devicetree.org/schemas/display/bridge/solomon,ssd2825.yaml
arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: dsi@2 (solomon,ssd2825): '#address-cells', '#size-cells', 'panel@1' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/bridge/solomon,ssd2825.yaml
arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: dsi@2 (solomon,ssd2825): ports:port@0:endpoint: Unevaluated properties are not allowed ('data-lines' was unexpected)
	from schema $id: http://devicetree.org/schemas/display/bridge/solomon,ssd2825.yaml
arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: panel@1 (jdi,dx12d100vm0eaa): 'backlight' is a required property
	from schema $id: http://devicetree.org/schemas/display/panel/renesas,r69328.yaml
arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: panel@1 (koe,tx13d100vm0eaa): 'renesas,inversion' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/panel/renesas,r61307.yaml
arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: panel@1 (koe,tx13d100vm0eaa): 'backlight' is a required property
	from schema $id: http://devicetree.org/schemas/display/panel/renesas,r61307.yaml
arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: gpio-leds (gpio-leds): led-power:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
	'battery-charging' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'netdev', 'none', 'rc-feedback', 'torch', 'usb-gadget', 'usb-host', 'usbport']
	'battery-charging' does not match '^cpu[0-9]*$'
	'battery-charging' does not match '^hci[0-9]+-power$'
	'battery-charging' does not match '^mmc[0-9]+$'
	'battery-charging' does not match '^phy[0-9]+tx$'
	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml
arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: sound (lg,tegra-audio-max98089-p880): nvidia,audio-routing:13: 'Mic Jack' is not one of ['Int Spk', 'Headphone Jack', 'Earpiece', 'Headset Mic', 'Internal Mic 1', 'Internal Mic 2', 'HPL', 'HPR', 'SPKL', 'SPKR', 'RECL', 'RECR', 'INA1', 'INA2', 'INB1', 'INB2', 'MIC1', 'MIC2', 'MICBIAS']
	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-max9808x.yaml
arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: thermal-sensor-battery (generic-adc-thermal): Unevaluated properties are not allowed ('#io-channel-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/thermal/generic-adc-thermal.yaml
arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: sound (lg,tegra-audio-max98089-p895): nvidia,audio-routing:13: 'Mic Jack' is not one of ['Int Spk', 'Headphone Jack', 'Earpiece', 'Headset Mic', 'Internal Mic 1', 'Internal Mic 2', 'HPL', 'HPR', 'SPKL', 'SPKR', 'RECL', 'RECR', 'INA1', 'INA2', 'INB1', 'INB2', 'MIC1', 'MIC2', 'MICBIAS']
	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-max9808x.yaml
arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: thermal-sensor-battery (generic-adc-thermal): Unevaluated properties are not allowed ('#io-channel-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/thermal/generic-adc-thermal.yaml





