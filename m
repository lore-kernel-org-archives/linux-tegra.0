Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CFC224896;
	Mon,  9 Jun 2025 15:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481275; cv=none; b=ePn25rha9V9e6s55J6bpgBam0b0GB0DFVyd8BU9fA5S0TirdTx14kMhXJj1LkNoxcl5N7CPgfcQ2sc+SFGca9QDWceAE+S5PfFYeXgkh7QPgewFK+Eol/kUwLIeU7CvSN4P/nG5fESkbMJlAe4VgY6lhRsZT8/92ckVwJNPakQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481275; c=relaxed/simple;
	bh=bMGu6bXrspSd6vTEsv4p9+r2Ppn+jbVNqYWzYKyLmsc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=mwAf2XPviKkbb5zhcUQ1Pz6T4gmsQimc8NnYvEjtoABznPyYV6Gfu96wmGvADSj+6JaUKQJ/hr7aFb991mvaHc/YIHABNHaXNT+7KhY6l6ZY+7cYvRN02pxhRET22bDVhlUMYcGfNsF3Lwsv26fJP0d4StkQ/NONT6vwCyNB308=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PlNiwZTR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PlNiwZTR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF32C4CEED;
	Mon,  9 Jun 2025 15:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749481274;
	bh=bMGu6bXrspSd6vTEsv4p9+r2Ppn+jbVNqYWzYKyLmsc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=PlNiwZTRJPkkXxfWUEzS1zcKmJu8KlkIOzzjW1FsR7sK4Gn3ni/93dukK9cY3j+LB
	 7MPRAbYD2qOQ0Nk/gMVMWyVHJx8/toOAf5YplIoI5vWGr/DoCDZJUlwykkbHzQgDG3
	 vQESo1gUBumToIvlohybBWWYOsqY+LRsvDYwy8w1MxVv2SyFbHg/o5m8VG2NIB1ZnO
	 lSr5VrJp6Vm06sSFpQJNda+GLToqbP9q6Jhou26kx8VaNosaHyuZb2Io6r7yJ7NaWJ
	 ROwEn9x+J3O9W3oJ2HtBb9/MD9pqqoWqSrB8ybrfwB9FvpJFPE34ClHN3ujfgSQh3f
	 g5dxuwfMzxFVw==
Date: Mon, 09 Jun 2025 10:01:13 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, 
 Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
In-Reply-To: <20250608-p3452-v1-0-4c2c1d7e4310@gmail.com>
References: <20250608-p3452-v1-0-4c2c1d7e4310@gmail.com>
Message-Id: <174948105045.2282609.1608022090248656959.robh@kernel.org>
Subject: Re: [PATCH RFC 0/2] arm64: tegra: Add NVIDIA Jetson Nano 2GB
 Developer Kit support


On Sun, 08 Jun 2025 23:24:34 -0500, Aaron Kling wrote:
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Aaron Kling (2):
>       dt-bindings: arm: tegra: Document Jetson Nano Devkits
>       arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer Kit support
> 
>  Documentation/devicetree/bindings/arm/tegra.yaml   |  5 +++
>  arch/arm64/boot/dts/nvidia/Makefile                |  2 +
>  arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dts | 43 ++++++++++++++++++++++
>  3 files changed, 50 insertions(+)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250513-p3452-059708ca9993
> 
> Best regards,
> --
> Aaron Kling <webgeek1234@gmail.com>
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
 Base: using specified base-commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/nvidia/' for 20250608-p3452-v1-0-4c2c1d7e4310@gmail.com:

arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gm20b']
arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /i2c@7000d000/pmic@3c: failed to match any schema with compatible: ['maxim,max77620']
arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra210-dfll']
arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: usb-phy@7d000000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /usb-phy@7d000000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: usb-phy@7d004000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /usb-phy@7d004000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: cpu@0 (arm,cortex-a57): 'operating-points' is a dependency of 'clock-latency'
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: cpu@0 (arm,cortex-a57): Unevaluated properties are not allowed ('clock-latency' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-active', 'cpu-critical', 'cpu-hot', 'cpu-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: thermal-zones: mem-thermal:cooling-maps: 'dram-active', 'dram-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#





