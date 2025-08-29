Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767393218A4;
	Fri, 29 Aug 2025 14:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756477656; cv=none; b=iwpybkDVYrfUiVVpe2TDP0Xl2yXUQQosE432LjrBfk6u81Lzj4wfrhdd2o3oDBOoutelMc1Dgl9MS/EQffBieGezhpcPcyWj6yY/w/xGocMm9O6ggRfZbgrikKGwSjKw3jxfdSdR1kbsU6Xy1pVKqOp2dKE58xTiGHxzijb3axY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756477656; c=relaxed/simple;
	bh=4tBUrRyd74FiupUVrJ5fFiV36preehjktcmpPlLe3nM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Q+2kC+uxNsudCsftCNs45ChKfsBV2DttzOXJZ+7H05wmElP3GJ84ZD8Ed0DN6YXWWG2uFj4/t9Ea3QIQ87XgBKlCDopPkd3bLOWZ2ZPFEltdqdKakAV1/SRRNzCHJGpu6CBfDr5WSUQa61wXo2IixeQfBGOpi6rbLDiL/vxFBSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=je5iMdwg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="je5iMdwg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2381C4CEF7;
	Fri, 29 Aug 2025 14:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756477656;
	bh=4tBUrRyd74FiupUVrJ5fFiV36preehjktcmpPlLe3nM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=je5iMdwgPCFuqQzrzqIOE8loBFILcb4OVyIXumvohf2TIzcw8NcSXFmaI6kOw0m7L
	 xiXtqGxeAo1lWJaqJqoe+t4Md6L6lzKJ/eRsYHEDHt36sSdMIvgcWGZusdFdvbgQNm
	 Bf/z7tGigVF0FOJuvmrmCZjG1K5eTy/1O1F3IL7KHtKZcSIv2q1QeJkxDbCye9UiZU
	 1fCG16wt1Ro651Lchb7xZ05S9X2j1AMXoV3fxk4MS63/T/6ObAiZmRZTvrJsi7HMrX
	 hQVPvvo23h73Yf9FmpJ5KzHoFirCu4qAJ/mtp9kxLw5Yal0zKWfBNN/0kgIV2jdh3j
	 +nNOmbFJChPVw==
Date: Fri, 29 Aug 2025 09:27:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, 
 Michael Turquette <mturquette@baylibre.com>, linux-tegra@vger.kernel.org, 
 devicetree@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>, linux-kernel@vger.kernel.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>, 
 Stephen Boyd <sboyd@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20250829122235.119745-1-clamor95@gmail.com>
References: <20250829122235.119745-1-clamor95@gmail.com>
Message-Id: <175647746523.734549.14987983644245053548.robh@kernel.org>
Subject: Re: [PATCH v5 0/4] clk: tegra: add DFLL support for Tegra114


On Fri, 29 Aug 2025 15:22:30 +0300, Svyatoslav Ryhel wrote:
> DFLL is a dedicated clock source for the Fast CPU. The DFLL is based on
> a ring oscillator and translates voltage changes into frequency
> compensation changes needed to prevent the CPU from failing and is
> essential for correct CPU frequency scaling.
> 
> ---
> Changes in v2:
> - dropped 'drivers:' from commit title
> - aligned naming to Tegra114
> 
> Changes in v3:
> - add DFLL support for Tegra 114 was split into dt header addition,
>   DFLL reset configuration and CVB tables implementation.
> - added cleaner commit message to dt header commit
> - added T210_ prefixes to Tegra210 CVB table macros
> 
> Changes in v4:
> - expanded commit message of car header adding commit
> 
> Changes in v5:
> - renamed tegra114-car.h to nvidia,tegra114-car.h
> ---
> 
> Svyatoslav Ryhel (4):
>   dt-bindings: reset: add Tegra114 car header
>   clk: tegra: add DFLL DVCO reset control for Tegra114
>   clk: tegra: dfll: add CVB tables for Tegra114
>   ARM: tegra: Add DFLL clock support for Tegra114
> 
>  arch/arm/boot/dts/nvidia/tegra114.dtsi        |  33 ++++
>  drivers/clk/tegra/Kconfig                     |   2 +-
>  drivers/clk/tegra/clk-tegra114.c              |  30 +++-
>  drivers/clk/tegra/clk-tegra124-dfll-fcpu.c    | 158 +++++++++++++++---
>  drivers/clk/tegra/clk.h                       |   2 -
>  .../dt-bindings/reset/nvidia,tegra114-car.h   |  13 ++
>  6 files changed, 204 insertions(+), 34 deletions(-)
>  create mode 100644 include/dt-bindings/reset/nvidia,tegra114-car.h
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
 Base: tags/next-20250828 (best guess, 3/5 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nvidia/' for 20250829122235.119745-1-clamor95@gmail.com:

arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra114-dfll']
arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra114-dfll']
arch/arm/boot/dts/nvidia/tegra114-roth.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm/boot/dts/nvidia/tegra114-roth.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra114-dfll']
arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra114-dfll']
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#





