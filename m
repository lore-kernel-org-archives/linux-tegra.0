Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9A02D877C;
	Thu, 12 Jun 2025 20:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749759143; cv=none; b=jpCtiyzIh8WKdwdqCGSF7it40Gzsu8/74lqyhtauJJGWHk/vcCUbJE5pqdVVzOjFDDZDaEK6p+l2wld3kNtd/4hUrR+o0ZcRfAi5afEg+ifl2D683zoZAlVJO82K6UbH5pYHO2AK++UroTuMz+PbtUYwqWg3Pepze6XKYC3Fn+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749759143; c=relaxed/simple;
	bh=8DE5gyxuSUYJ6WuY9cV5EOG8OsgrZ98PwGjQd7+cpUE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=s7cH9PSztQA6fxqb6UyyEItQq9eA+Pl6+VTAleKe1vkaE7xm8bGhM6nGoWbUTjVoXMHY1Rl2RKa9oxmw45MgVsCnjurB+dZxCeneb1TYGqLWTStDlMZekQvs3yiiHInA7IbMXqtKxKtbNnlQphSO6tNVpq2NVg4U6erovlinlkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cCJDPxm5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cCJDPxm5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1153C4CEF4;
	Thu, 12 Jun 2025 20:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749759143;
	bh=8DE5gyxuSUYJ6WuY9cV5EOG8OsgrZ98PwGjQd7+cpUE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=cCJDPxm5vU+UtubGlmf6ScFDtI2MNLk+c5oqJGUQj+V9TDGyyYaMJ1El8RcEV9qkj
	 sg28JfEofPgAcwkRSBLAgkhmWSKQ80sVtnHnQ7/PsmPiThzBhOf4srewyPngQJvv4C
	 +HDd1wLI8DL/MASBpe7LQmEvt6dtaBQTMPGu8cmN2Q2VF5RHP95V7A5P+R+t9CnZQ5
	 8mPEbVwRiq0uyVmsHfyHc75ipLdh+mblFcyU+s2ddYHFq4cpVy79e1zH23bmnwZ/WT
	 LE950ZXKhYDWCcgY1m4IBhrvHl22QdqcKjJpOVsWxeASbysag4tdQUri/e8CeOKfd7
	 M1Z550mygDmMA==
Date: Thu, 12 Jun 2025 15:12:21 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
To: Aaron Kling <webgeek1234@gmail.com>
In-Reply-To: <20250611-p3452-v2-0-fd2679706c63@gmail.com>
References: <20250611-p3452-v2-0-fd2679706c63@gmail.com>
Message-Id: <174975871455.2915291.8270762115068207135.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] arm64: tegra: Add NVIDIA Jetson Nano 2GB
 Developer Kit support


On Wed, 11 Jun 2025 13:53:36 -0500, Aaron Kling wrote:
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v2:
> - Fix usb power supply to align with downstream power tree
> - Control vdd_hdmi with gpio pa6 and delete unused vdd_hub_3v3 to avoid
>   conflicts
> - Link to v1: https://lore.kernel.org/r/20250608-p3452-v1-0-4c2c1d7e4310@gmail.com
> 
> ---
> Aaron Kling (2):
>       dt-bindings: arm: tegra: Document Jetson Nano Devkits
>       arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer Kit support
> 
>  Documentation/devicetree/bindings/arm/tegra.yaml   |  5 ++
>  arch/arm64/boot/dts/nvidia/Makefile                |  2 +
>  arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dts | 59 ++++++++++++++++++++++
>  3 files changed, 66 insertions(+)
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

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/nvidia/' for 20250611-p3452-v2-0-fd2679706c63@gmail.com:

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





