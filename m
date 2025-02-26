Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB27D2248BD;
	Wed, 26 Feb 2025 15:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740584213; cv=none; b=jbfh7t8J8Xjc9KF4NAYKuTxmFyMRB618Y2dr6sbkVUIGsOZeIH6CJD4czTlz0E+S0uMxoYN9CMf6Z3mwEWDukogSPIpuc6+ec9Dx5EY/0R8fps/za6VSS/8R1SVVT8xtmZTKdOmLZbKcUAAwOMiL3G65bDGZ5iKTWpOJP/4nNKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740584213; c=relaxed/simple;
	bh=+NiE9VghINqTJHPS0uLlK2tQ7VZdWTREoosIHvHEUb0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=H3mdh2Bmp2ZDjCfhAvZi7TvrffkaNqiWIrDL1KD90GXjJFA2zgf/+a1Jwe/3+T1B/caYr/Lmf8iqTB8matISKSLolQNGpE4von+fQiTTRt00EcjeDmSp22YAuxd6X/ImlP38stbO6lDz+6H2WaO4d1tUc3zAY1YJ6jc+Cem8OXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YWgpthZk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YWgpthZk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B96AC4CED6;
	Wed, 26 Feb 2025 15:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740584213;
	bh=+NiE9VghINqTJHPS0uLlK2tQ7VZdWTREoosIHvHEUb0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=YWgpthZkEcnYnxOkTV7IYr1RK1tAsFyrZsx9yhFZ2fCqNbWO1yKy7BHwD3igfq8Vt
	 aqxltUI2bLI5DVMj2xV6NLAv1okzUE/Us9e8/H7XoNEN2IfOr7/xE1x+SJvIo20P6i
	 9IBaTdzFW9qvuxkeODlWHBy4LmFuoOavhXZenREEJBUAQJPG1YUBD5BA8Q3stsHN2O
	 mhhe+IQ6PNGdW65xSWwXpSOrDke1Qno8ZtPbbTqwXInedKpe4Nn9OgxkDSkAWWpe4T
	 2/oZcMbya7QvME77kk3ax56EFybwrQxF4mFp8ukTSq3d/pZ1WP8FOkqCBzUhLH2QEP
	 XvPvjlFMsg7zw==
Date: Wed, 26 Feb 2025 09:36:51 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
 Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20250226105615.61087-1-clamor95@gmail.com>
References: <20250226105615.61087-1-clamor95@gmail.com>
Message-Id: <174058387361.2466901.13549061484279488738.robh@kernel.org>
Subject: Re: [PATCH v1 0/6] ARM: tegra: complete Tegra 4 and Tegra K1
 device trees


On Wed, 26 Feb 2025 12:56:09 +0200, Svyatoslav Ryhel wrote:
> Complete T114 and T124 device trees.
> 
> Svyatoslav Ryhel (6):
>   ARM: tegra114: complete HOST1X devices binding
>   ARM: tegra114: switch DSI-B clock parent to PLLD
>   ARM: tegra114: add ARM PMU node
>   ARM: tegra114: add HDA node
>   ARM: tegra124: Add DSI-A and DSI-B nodes
>   ARM: tegra124: complete HOST1X devices binding
> 
>  arch/arm/boot/dts/nvidia/tegra114.dtsi |  99 +++++++++++++++++++++--
>  arch/arm/boot/dts/nvidia/tegra124.dtsi | 105 +++++++++++++++++++++++++
>  2 files changed, 199 insertions(+), 5 deletions(-)
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nvidia/' for 20250226105615.61087-1-clamor95@gmail.com:

arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /host1x@50000000/isp@54100000: failed to match any schema with compatible: ['nvidia,tegra114-isp']
arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /host1x@50000000/isp@54100000: failed to match any schema with compatible: ['nvidia,tegra114-isp']
arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /host1x@50000000/isp@54100000: failed to match any schema with compatible: ['nvidia,tegra114-isp']
arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /host1x@50000000/msenc@544c0000: failed to match any schema with compatible: ['nvidia,tegra114-msenc']
arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra114-tsec']
arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /host1x@50000000/msenc@544c0000: failed to match any schema with compatible: ['nvidia,tegra114-msenc']
arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /host1x@50000000/msenc@544c0000: failed to match any schema with compatible: ['nvidia,tegra114-msenc']
arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra114-tsec']
arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra114-tsec']
arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: /host1x@50000000/isp@54600000: failed to match any schema with compatible: ['nvidia,tegra124-isp']
arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: /host1x@50000000/isp@54680000: failed to match any schema with compatible: ['nvidia,tegra124-isp']
arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: /host1x@50000000/isp@54600000: failed to match any schema with compatible: ['nvidia,tegra124-isp']
arch/arm/boot/dts/nvidia/tegra124-venice2.dtb: /host1x@50000000/isp@54600000: failed to match any schema with compatible: ['nvidia,tegra124-isp']
arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: /host1x@50000000/isp@54680000: failed to match any schema with compatible: ['nvidia,tegra124-isp']
arch/arm/boot/dts/nvidia/tegra124-nyan-big.dtb: /host1x@50000000/isp@54600000: failed to match any schema with compatible: ['nvidia,tegra124-isp']
arch/arm/boot/dts/nvidia/tegra124-venice2.dtb: /host1x@50000000/isp@54680000: failed to match any schema with compatible: ['nvidia,tegra124-isp']
arch/arm/boot/dts/nvidia/tegra124-nyan-big.dtb: /host1x@50000000/isp@54680000: failed to match any schema with compatible: ['nvidia,tegra124-isp']
arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: /host1x@50000000/isp@54600000: failed to match any schema with compatible: ['nvidia,tegra124-isp']
arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: /host1x@50000000/isp@54680000: failed to match any schema with compatible: ['nvidia,tegra124-isp']
arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: /host1x@50000000/msenc@544c0000: failed to match any schema with compatible: ['nvidia,tegra124-msenc']
arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra124-tsec']
arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: /host1x@50000000/msenc@544c0000: failed to match any schema with compatible: ['nvidia,tegra124-msenc']
arch/arm/boot/dts/nvidia/tegra124-venice2.dtb: /host1x@50000000/msenc@544c0000: failed to match any schema with compatible: ['nvidia,tegra124-msenc']
arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra124-tsec']
arch/arm/boot/dts/nvidia/tegra124-nyan-big.dtb: /host1x@50000000/msenc@544c0000: failed to match any schema with compatible: ['nvidia,tegra124-msenc']
arch/arm/boot/dts/nvidia/tegra124-venice2.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra124-tsec']
arch/arm/boot/dts/nvidia/tegra124-nyan-big.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra124-tsec']
arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: /host1x@50000000/msenc@544c0000: failed to match any schema with compatible: ['nvidia,tegra124-msenc']
arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra124-tsec']
arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: hda@70030000: compatible: 'oneOf' conditional failed, one must be fixed:
	['nvidia,tegra114-hda', 'nvidia,tegra30-hda'] is too long
	['nvidia,tegra114-hda', 'nvidia,tegra30-hda'] is too short
	'nvidia,tegra30-hda' was expected
	'nvidia,tegra114-hda' is not one of ['nvidia,tegra234-hda', 'nvidia,tegra194-hda', 'nvidia,tegra186-hda', 'nvidia,tegra210-hda', 'nvidia,tegra124-hda']
	'nvidia,tegra132-hda' was expected
	'nvidia,tegra124-hda' was expected
	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /hda@70030000: failed to match any schema with compatible: ['nvidia,tegra114-hda', 'nvidia,tegra30-hda']
arch/arm/boot/dts/nvidia/tegra114-roth.dtb: hda@70030000: compatible: 'oneOf' conditional failed, one must be fixed:
	['nvidia,tegra114-hda', 'nvidia,tegra30-hda'] is too long
	['nvidia,tegra114-hda', 'nvidia,tegra30-hda'] is too short
	'nvidia,tegra30-hda' was expected
	'nvidia,tegra114-hda' is not one of ['nvidia,tegra234-hda', 'nvidia,tegra194-hda', 'nvidia,tegra186-hda', 'nvidia,tegra210-hda', 'nvidia,tegra124-hda']
	'nvidia,tegra132-hda' was expected
	'nvidia,tegra124-hda' was expected
	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /hda@70030000: failed to match any schema with compatible: ['nvidia,tegra114-hda', 'nvidia,tegra30-hda']
arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: hda@70030000: compatible: 'oneOf' conditional failed, one must be fixed:
	['nvidia,tegra114-hda', 'nvidia,tegra30-hda'] is too long
	['nvidia,tegra114-hda', 'nvidia,tegra30-hda'] is too short
	'nvidia,tegra30-hda' was expected
	'nvidia,tegra114-hda' is not one of ['nvidia,tegra234-hda', 'nvidia,tegra194-hda', 'nvidia,tegra186-hda', 'nvidia,tegra210-hda', 'nvidia,tegra124-hda']
	'nvidia,tegra132-hda' was expected
	'nvidia,tegra124-hda' was expected
	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /hda@70030000: failed to match any schema with compatible: ['nvidia,tegra114-hda', 'nvidia,tegra30-hda']
arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: /host1x@50000000/isp@54600000: failed to match any schema with compatible: ['nvidia,tegra124-isp']
arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: /host1x@50000000/isp@54680000: failed to match any schema with compatible: ['nvidia,tegra124-isp']
arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: /host1x@50000000/msenc@544c0000: failed to match any schema with compatible: ['nvidia,tegra124-msenc']
arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra124-tsec']
arch/arm/boot/dts/nvidia/tegra124-venice2.dtb: /mipi@700e3000: failed to match any schema with compatible: ['nvidia,tegra124-mipi']
arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /host1x@50000000/isp@54600000: failed to match any schema with compatible: ['nvidia,tegra124-isp']
arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /host1x@50000000/isp@54680000: failed to match any schema with compatible: ['nvidia,tegra124-isp']
arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /host1x@50000000/msenc@544c0000: failed to match any schema with compatible: ['nvidia,tegra124-msenc']
arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra124-tsec']
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /host1x@50000000/isp@54100000: failed to match any schema with compatible: ['nvidia,tegra114-isp']
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /host1x@50000000/msenc@544c0000: failed to match any schema with compatible: ['nvidia,tegra114-msenc']
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra114-tsec']
arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: /mipi@700e3000: failed to match any schema with compatible: ['nvidia,tegra124-mipi']
arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: /mipi@700e3000: failed to match any schema with compatible: ['nvidia,tegra124-mipi']
arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: /mipi@700e3000: failed to match any schema with compatible: ['nvidia,tegra124-mipi']
arch/arm/boot/dts/nvidia/tegra124-nyan-big.dtb: /mipi@700e3000: failed to match any schema with compatible: ['nvidia,tegra124-mipi']
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: hda@70030000: compatible: 'oneOf' conditional failed, one must be fixed:
	['nvidia,tegra114-hda', 'nvidia,tegra30-hda'] is too long
	['nvidia,tegra114-hda', 'nvidia,tegra30-hda'] is too short
	'nvidia,tegra30-hda' was expected
	'nvidia,tegra114-hda' is not one of ['nvidia,tegra234-hda', 'nvidia,tegra194-hda', 'nvidia,tegra186-hda', 'nvidia,tegra210-hda', 'nvidia,tegra124-hda']
	'nvidia,tegra132-hda' was expected
	'nvidia,tegra124-hda' was expected
	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /hda@70030000: failed to match any schema with compatible: ['nvidia,tegra114-hda', 'nvidia,tegra30-hda']
arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /mipi@700e3000: failed to match any schema with compatible: ['nvidia,tegra124-mipi']
arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: /mipi@700e3000: failed to match any schema with compatible: ['nvidia,tegra124-mipi']





