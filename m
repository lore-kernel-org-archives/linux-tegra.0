Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CA618DF97;
	Wed, 11 Sep 2024 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726062608; cv=none; b=WeUX+H4QCDT4DDNbvlS+OsNqifzCelsKvwwCcFlnUbYx9PevHO5JBF6BpZoHswqT7R3spK80KSRg5LMcodIBFQWoQQJzt+Is2OSgJLXU+tHvSJQp7WvIXyBaqTVUNfdjQcV4Mr9F0t0an4nDSV3YmNCRiOR0QYMZMlkKhyvGc9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726062608; c=relaxed/simple;
	bh=dh4cGCxC59QCCjMzBpLS0kceIXEhuBTk994gfi+eahM=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=cXLqc00U+EbKX9rw+VbYE4J5lv+HGjkA4UsFjt0sMF1hK9RWOMej25JNp0a9BMltwl31ACy+uxo9jmVV1oTfHExZFXNDzey3k2lqIbSbeObu7elAPLlmpldKfkbeHZG8/kZbPAYQD59GbH3meebptvauWUX3a83oWehyPAPXQfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=liJADfRF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="liJADfRF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE010C4CEC7;
	Wed, 11 Sep 2024 13:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726062608;
	bh=dh4cGCxC59QCCjMzBpLS0kceIXEhuBTk994gfi+eahM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=liJADfRFj5YDkEI32IGlCwgzxCK/qPkkovcKfizqdQTqO9vpt7bwKvriZQqWTSSJW
	 OcFQU0AC7N0+ohZTo4VdDmOh37UsREe5QThijkzvt0ux/+VVlx+5AbXv1J7oWSbNvf
	 IHeWqRUbaUhKewmgU1YxYzxtN7WXvtMZT0XXmf1Z38uwpGbRl9uF/3eox1QogFW8i3
	 I2BLA8R+1RoNMpP56t0NZ1BadIEwhjrOEZfbxLqH08hWgVQ1g6RuomkSZpbeeUYyF1
	 xhr8hKIs7YC2a3WIzDvPhBWcCgSUuiXDjjYNW8FzN+AgWGDrNDerIUAU5uXDMeMbFN
	 50irV7NWDnzew==
Date: Wed, 11 Sep 2024 08:50:06 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dara Stotland <dstotland@nvidia.com>
Cc: devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Brad Griffis <bgriffis@nvidia.com>, linux-tegra@vger.kernel.org, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20240910190457.2154367-1-dstotland@nvidia.com>
References: <20240910190457.2154367-1-dstotland@nvidia.com>
Message-Id: <172606223949.90537.11066452244485484767.robh@kernel.org>
Subject: Re: [PATCH 0/2] Tegra234: Add AGX Orin SKU8 support


On Tue, 10 Sep 2024 19:04:55 +0000, Dara Stotland wrote:
> This patchset adds support for the AGX Orin Industrial Module (SKU8)
> in the AGX Orin Developer Kit.
> 
> Dara Stotland (2):
>   dt-bindings: arm: Tegra234 Industrial Module
>   arm64: tegra: Create SKU8 AGX Orin board file
> 
>  .../devicetree/bindings/arm/tegra.yaml        |   5 +
>  arch/arm64/boot/dts/nvidia/Makefile           |   1 +
>  .../nvidia/tegra234-p3737-0000+p3701-0000.dts | 544 +----------------
>  .../nvidia/tegra234-p3737-0000+p3701-0008.dts |  11 +
>  .../dts/nvidia/tegra234-p3737-0000+p3701.dtsi | 547 ++++++++++++++++++
>  5 files changed, 566 insertions(+), 542 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dts
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi
> 
> --
> 2.17.1
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


New warnings running 'make CHECK_DTBS=y nvidia/tegra234-p3737-0000+p3701-0000.dtb nvidia/tegra234-p3737-0000+p3701-0008.dtb' for 20240910190457.2154367-1-dstotland@nvidia.com:

arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: gpio@2200000: 'gpio-ranges' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/nvidia,tegra186-gpio.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: ahub@2900800: admaif@290f000: 'interconnect-names', 'interconnects', 'iommus' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra210-ahub.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: admaif@290f000: 'interconnect-names', 'interconnects', 'iommus' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra210-admaif.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: /bus@0/serial@31d0000: failed to match any schema with compatible: ['arm,sbsa-uart']
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: /bus@0/i2c@31e0000/audio-codec@1c: failed to match any schema with compatible: ['realtek,rt5640']
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: hda@3510000: compatible: 'oneOf' conditional failed, one must be fixed:
	['nvidia,tegra234-hda'] is too short
	'nvidia,tegra30-hda' was expected
	'nvidia,tegra132-hda' was expected
	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: hda@3510000: clock-names:1: 'hda2hdmi' was expected
	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: hda@3510000: reset-names:1: 'hda2hdmi' was expected
	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: padctl@3520000: ports:usb2-0: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: padctl@3520000: ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: padctl@3520000: ports:usb2-1: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: padctl@3520000: ports:usb3-0: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: padctl@3520000: ports:usb3-1: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: ethernet@6800000: phy-mode: ['10gbase-r'] does not contain items matching the given schema
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: ethernet@6800000: 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: ethernet@6900000: 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: ethernet@6a00000: 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: gpio@c2f0000: 'gpio-ranges' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/nvidia,tegra186-gpio.yaml#





