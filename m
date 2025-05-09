Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5EB21ADB4;
	Fri,  9 May 2025 14:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800226; cv=none; b=tdXVdJshMY3aJQr30iTr1ukaULXccBwqPpUvfD4X6ii243XqYkPiyCOPBhvY/6yYFWIfLHj6HXOkiGMfTNrtWP0MbbN22G0YKN40BWYOq6OClL8sPUEWOrH2IiU1xGjQ/0z7ufPEV4BYBuV1TeVCbFeH7WosMM/8fmtYDKzPvcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800226; c=relaxed/simple;
	bh=y2Dk41ikf2no08XfqeTD6j9mDySyYoV8x2zZIVEA+P8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Bs5YGAD5X5Md1PamZ2xFwfvjB7WKvBKSPK2HrrxinkiHHS0QNsqXsK8k78PIAYPfDeC4jB1GyII5xtNmtSVT8SarHFUzDkj2E6MuiLnDTky5zsYSl677ujTwjCsLiVU7Zfa1zZlqrGPZkAjBWpsg9yCZesBTv2HEF2EFotcK7zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qTNFhwAZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qTNFhwAZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D4FCC4CEEF;
	Fri,  9 May 2025 14:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746800226;
	bh=y2Dk41ikf2no08XfqeTD6j9mDySyYoV8x2zZIVEA+P8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qTNFhwAZG+15SQKaHxtuHVGIVnPcrnWgIAsRKKWpxAr05Jf6LXynUtngORPyz7wnX
	 T7gGN7lDqv7yiDDUjOqywhH48GuXu05eWI24KtVANYIDQfZzDzjTWS1dO0mtasoScA
	 fkwXb2M4Pa9gwcUEY5PbnT2k6VojB/9ugiUS9zlgdWM2ahboXunvKuM1XWrgUXaUJF
	 VhIOn4j7cADXAED+oEqTf4yIXjWJpuTmfob+Ox2krN2eWDQcKQy3YLD7tgdPXNtb37
	 Q2Zr7edjesNYD6de5Rrwzisn3aMCEloSUv39VSvwLbRYXbYV3jwdsAwakoJgreK2X0
	 1/GX3ZtbQoZDg==
Date: Fri, 09 May 2025 09:17:04 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Conor Dooley <conor+dt@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
In-Reply-To: <20250508-tegra210-emc-dt-v2-0-d33dc20a1123@gmail.com>
References: <20250508-tegra210-emc-dt-v2-0-d33dc20a1123@gmail.com>
Message-Id: <174679985362.3369193.11591563013648639015.robh@kernel.org>
Subject: Re: [PATCH v2 0/4] memory: tegra210-emc: Support Device Tree EMC
 Tables


On Thu, 08 May 2025 01:07:37 -0500, Aaron Kling wrote:
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v2:
> - Add patch to describe the emc table bindings
> - Add patch to allow a fallback compatible on the tegra210 emc device to
>   match firmware expectations
> - Add a patch to include the baseline emc tables on p2180
> - Link to v1: https://lore.kernel.org/r/20250430-tegra210-emc-dt-v1-1-99896fa69341@gmail.com
> 
> ---
> Aaron Kling (4):
>       dt-bindings: memory-controllers: Describe Tegra210 EMC Tables
>       dt-bindings: memory-controllers: tegra210: Allow fallback compatible
>       arm64: tegra: Add EMC timings to P2180
>       memory: tegra210-emc: Support Device Tree EMC Tables
> 
>  .../nvidia,tegra21-emc-table.yaml                  |  1692 +
>  .../memory-controllers/nvidia,tegra210-emc.yaml    |    44 +-
>  arch/arm64/boot/dts/nvidia/tegra210-p2180-emc.dtsi | 49749 +++++++++++++++++++
>  arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |     1 +
>  drivers/memory/tegra/tegra210-emc-core.c           |   246 +-
>  5 files changed, 51721 insertions(+), 11 deletions(-)
> ---
> base-commit: 8bac8898fe398ffa3e09075ecea2be511725fb0b
> change-id: 20250429-tegra210-emc-dt-97dce690ad4e
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
 Base: using specified base-commit 8bac8898fe398ffa3e09075ecea2be511725fb0b

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/nvidia/' for 20250508-tegra210-emc-dt-v2-0-d33dc20a1123@gmail.com:

arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^emc-table@[0-9]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^emc-table@[0-9]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^emc-table@[0-9]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^emc-table@[0-9]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^emc-table@[0-9]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^emc-table@[0-9]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#





