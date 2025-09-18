Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFAC30C629;
	Thu, 18 Sep 2025 14:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758207019; cv=none; b=XiSRe2YLtxdkKkOIvqyRR5RTxt2moOzBZ8sW8fAge19crDagmvjpp5H2Maj7AzqhOwDUvmy23V1e7mjMFOZMQJg5YHUdA0sfAZV+DV7uR+icX5kRLrc8zUNajiKEZyl4atqEmUGaPk+GNLY3upIBh5Awm+Y6uoKSkVXqCWM9LQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758207019; c=relaxed/simple;
	bh=Rcf3B0DAejjSqSgIDquDJyFE5L8CqiwqQLvZw2O/UQE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=iC+ZjxFAW6NipaiLst4CWAaXcqswj6E44oGA4Hq6sbJXC3VdU2zM0PVPyX1t0dlpr7mREI8PJn0kDOv2H64NpgfkDqwdEkc75G6ySmPn6PPlSfzcEWoOhXc5L6RVo+L0HMUtNQe9Eoo6WNqYvnb/Mq03sfwDq4hWHP2TvAOXpWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oo6rWe6R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oo6rWe6R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2FB8C4CEFB;
	Thu, 18 Sep 2025 14:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758207018;
	bh=Rcf3B0DAejjSqSgIDquDJyFE5L8CqiwqQLvZw2O/UQE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Oo6rWe6R1knG0nNCCAyDLOYlVJe1c/FvXjuqeJbDKL50RJtzk8AWGKgFQPTVv9rTu
	 ICK7L9tm+M10RiMttvlW4PJnl0KkHMKw2n6lwsHm/eC5xOgyiXcQn8k2ojvcATHhis
	 i6ZAgoIjLkovHUy0reUvxUm7FHNrMU3tPy0IBW6IF7dvs9BIk8G+tl2bgZ0bM5R17S
	 gJ5xJ2dMJI19SQO5hdKWxYnuFqFtzujVMPUFZs4WWt0Oeuzo/o9dBgnbr7ma8is/wF
	 lFIBm2IT3+lOuItz5n2C6D7yfNNqbHDcluiygSHgVwa7IUwloEWHnE+FW/juvbNux8
	 2PF5YbXQ3rl9A==
Date: Thu, 18 Sep 2025 09:50:17 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Gautham Srinivasan <gauthams@nvidia.com>, linux-tegra@vger.kernel.org, 
 Vidya Sagar <vidyas@nvidia.com>, 
 Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>, 
 Conor Dooley <conor+dt@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
In-Reply-To: <20250918120138.17572-2-cassel@kernel.org>
References: <20250918120138.17572-2-cassel@kernel.org>
Message-Id: <175820686494.1653871.8284165728773708790.robh@kernel.org>
Subject: Re: [PATCH] arm64: tegra: Add pinctrl definition for PCIe C4 EP


On Thu, 18 Sep 2025 14:01:39 +0200, Niklas Cassel wrote:
> From: Gautham Srinivasan <gauthams@nvidia.com>
> 
> Commit 0580286d0d22 ("arm64: tegra: Add Tegra234 PCIe C4 EP definition")
> added the device tree entry "pcie-ep@14160000" for C4 endpoint. However,
> it missed pinctrl definition. Without the pinctl definition, the C4
> endpoint of Jetson Orin Nano does not work. Add the missing definition.
> 
> Signed-off-by: Gautham Srinivasan <gauthams@nvidia.com>
> [cassel: add to the existing nodes instead of creating new ones]
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
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
 Base: tags/next-20250917 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/nvidia/' for 20250918120138.17572-2-cassel@kernel.org:

arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: pinmux@2430000 (nvidia,tegra234-pinmux): Unevaluated properties are not allowed ('pex_rst_c4_in' was unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/nvidia,tegra234-pinmux.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: pinmux@2430000 (nvidia,tegra234-pinmux): Unevaluated properties are not allowed ('pex_rst_c4_in' was unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/nvidia,tegra234-pinmux.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: pinmux@2430000 (nvidia,tegra234-pinmux): Unevaluated properties are not allowed ('pex_rst_c4_in' was unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/nvidia,tegra234-pinmux.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: pinmux@2430000 (nvidia,tegra234-pinmux): Unevaluated properties are not allowed ('pex_rst_c4_in' was unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/nvidia,tegra234-pinmux.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: pinmux@2430000 (nvidia,tegra234-pinmux): Unevaluated properties are not allowed ('pex_rst_c4_in' was unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/nvidia,tegra234-pinmux.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: pinmux@2430000 (nvidia,tegra234-pinmux): Unevaluated properties are not allowed ('pex_rst_c4_in' was unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/nvidia,tegra234-pinmux.yaml#





