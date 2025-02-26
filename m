Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050BE21C184;
	Wed, 26 Feb 2025 15:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740584529; cv=none; b=sQv4zShFM1/H/TUzwOQTGoKr7gQnM20AhXudYuDl/pMtI7humKcnsZMC3K33Vllm03zL9Adfwt6JQwVjvKowCAYqyb/GXPL4JLbW2tEiKzbvQKHbitg0GEchVlUzk4WnyuwVey4MV+5xZXbqy7inEWErPoUM/VG5gior2xzBUps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740584529; c=relaxed/simple;
	bh=4lwpw1eA/OAPQ5ze01nLd6Rlmb9Y7GXtIaV2zlbGfNc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=RZVgJ1/72ija4g6+M1rKhzkTGH4kmGzOB8AM7gvwHdiEA70oP8oc+KxiQP+o5AyjDz3oSOEGLPgaqJ5P/AZN2/RZUfP3puq5Mx+TRAAVFa/jvc4zBCdhVP0Qm753tOViquj18KV6nBFdbw0+hMQkAmcq8tKCFlIbW0uPmUCbAW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dXnhwFEw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dXnhwFEw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44595C4CED6;
	Wed, 26 Feb 2025 15:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740584528;
	bh=4lwpw1eA/OAPQ5ze01nLd6Rlmb9Y7GXtIaV2zlbGfNc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=dXnhwFEwBY6VP6k7cOZwDBV1N5vsNzykK8CthuOaXQ2jeLgaF+JX4B43aMCNVf7yC
	 PbnI7DElkJwpHJzVd337zgkQfJhuByiCe/Dm7CaafCcCIWYAUGpn48CmMtqMhV38Q7
	 u6TOS+jhcizfpd/mVVaDet2JGXGWq00m9rpxBOKh01OFxkTjr2NxYdCo+n+Wy1aTnt
	 Iz317hYKewS5jGMvj9oJ1fg/LjEuJGReXlrbPZotbpuVsRXSW4lzdcMsyh0IKysSI2
	 qru9t3IE355Fk7EOKIoFotJobEsAcx7SFWeZSu8Vf5aHqBRps9n4Q0wWjf7MpJHJZZ
	 tBmghqK3FbSyA==
Date: Wed, 26 Feb 2025 09:42:06 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Georgi Djakov <djakov@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-tegra@vger.kernel.org, 
 Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, 
 Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20250225143501.68966-1-clamor95@gmail.com>
References: <20250225143501.68966-1-clamor95@gmail.com>
Message-Id: <174058435857.2478604.15934788005971294558.robh@kernel.org>
Subject: Re: [PATCH v1 0/9] Tegra114: implement EMC support


On Tue, 25 Feb 2025 16:34:52 +0200, Svyatoslav Ryhel wrote:
> Add support for External Memory Controller found in Tegra 4 SoC along
> with adjustments required for it to work properly.
> 
> Tested on ASUS TF701T (T40X) and Nvidia Tegratab (T40S). Both work fine.
> 
> Svyatoslav Ryhel (9):
>   ARM: tegra: Add ACTMON support on Tegra114
>   dt-bindings: memory: Document Tegra114 Memory Controller
>   drivers: memory: tegra: implement EMEM regs and ICC ops for T114
>   dt-bindings: memory: tegra114: Add memory client IDs
>   clk: tegra114: remove emc to mc clock mux
>   dt-bindings: memory: Document Tegra114 External Memory Controller
>   memory: tegra: Add Tegra114 EMC driver
>   ARM: tegra: Add External Memory Controller node on Tegra114
>   ARM: tegra: Add EMC OPP and ICC properties to Tegra114 EMC and ACTMON
>     device-tree nodes
> 
>  .../nvidia,tegra114-emc.yaml                  |  431 +++++
>  .../nvidia,tegra114-mc.yaml                   |  154 ++
>  .../dts/nvidia/tegra114-peripherals-opp.dtsi  |  151 ++
>  arch/arm/boot/dts/nvidia/tegra114.dtsi        |   32 +
>  drivers/clk/tegra/clk-tegra114.c              |   48 +-
>  drivers/memory/tegra/Kconfig                  |   12 +
>  drivers/memory/tegra/Makefile                 |    1 +
>  drivers/memory/tegra/tegra114-emc.c           | 1487 +++++++++++++++++
>  drivers/memory/tegra/tegra114.c               |  193 +++
>  include/dt-bindings/memory/tegra114-mc.h      |   67 +
>  10 files changed, 2561 insertions(+), 15 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra114-emc.yaml
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra114-mc.yaml
>  create mode 100644 arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
>  create mode 100644 drivers/memory/tegra/tegra114-emc.c
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nvidia/' for 20250225143501.68966-1-clamor95@gmail.com:

arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: clock@60006000: 'nvidia,external-memory-controller' does not match any of the regexes: '^(sclk)|(pll-[cem])$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/clock/nvidia,tegra20-car.yaml#
arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: actmon@6000c800: compatible: ['nvidia,tegra114-actmon', 'nvidia,tegra124-actmon'] is too long
	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml#
arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: actmon@6000c800: '#cooling-cells' is a required property
	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml#
arch/arm/boot/dts/nvidia/tegra114-roth.dtb: clock@60006000: 'nvidia,external-memory-controller' does not match any of the regexes: '^(sclk)|(pll-[cem])$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/clock/nvidia,tegra20-car.yaml#
arch/arm/boot/dts/nvidia/tegra114-roth.dtb: actmon@6000c800: compatible: ['nvidia,tegra114-actmon', 'nvidia,tegra124-actmon'] is too long
	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml#
arch/arm/boot/dts/nvidia/tegra114-roth.dtb: actmon@6000c800: '#cooling-cells' is a required property
	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml#
arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: clock@60006000: 'nvidia,external-memory-controller' does not match any of the regexes: '^(sclk)|(pll-[cem])$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/clock/nvidia,tegra20-car.yaml#
arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: actmon@6000c800: compatible: ['nvidia,tegra114-actmon', 'nvidia,tegra124-actmon'] is too long
	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml#
arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: actmon@6000c800: '#cooling-cells' is a required property
	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml#
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: clock@60006000: 'nvidia,external-memory-controller' does not match any of the regexes: '^(sclk)|(pll-[cem])$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/clock/nvidia,tegra20-car.yaml#
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: actmon@6000c800: compatible: ['nvidia,tegra114-actmon', 'nvidia,tegra124-actmon'] is too long
	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml#
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: actmon@6000c800: '#cooling-cells' is a required property
	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml#
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: bluetooth: reset-gpios: False schema does not allow [[22, 134, 1]]
	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bluetooth.yaml#





