Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7382528FF;
	Mon,  7 Apr 2025 12:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744030080; cv=none; b=YZBT72dX3uKmzT0xE0d8wjFaijxRn4WaP8MsUV3QCdhsAitR08OLYoM7g3SFsmGcnXFiua9Z+CfCDd/xibIdrU5upis3rywSpjwIoK3qDq05O9wlkMfE+qgHP1vcjvvrA9jsYZTVmKgmYL1g1osnc3lhfm3bpeR5HPlVgFWfud0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744030080; c=relaxed/simple;
	bh=OZdlwwbCwgP1SzXb8AgO6cmeLj3TYPFDSdHnElKKvzw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=g47YWkiu0GGXKgH5cZKVniY8nn+jo5j19kPTzsgfqR/YuQsilhQpjrNfqpr1ZPQrdROuSFvWbNtQRCwTQKwsBQynKFyrrnkqi226O23QC/y6j/K2h/2iLBuJNUFJD50CPysvjoJ9/xeSA7IjrwG1kYJlMh7c20VQ2emf+7vEoYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tFhuSO9p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tFhuSO9p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38343C4CEE9;
	Mon,  7 Apr 2025 12:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744030080;
	bh=OZdlwwbCwgP1SzXb8AgO6cmeLj3TYPFDSdHnElKKvzw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=tFhuSO9p9rtbXdI2wOMl57foaoV+aneCOhhCXAtpAAvGevrFHGKyKORqRIPyr2Zm5
	 dji6f8x8eepkK/HnRsg3u2SZUw4sIoD2JA7PJOBxHV7FAINf+Y15MW1W83m33rbFGF
	 4i4HBE+hff6lsdxn8cw8ydaGR919yg7TnqOPuBUKa+5XI5+WRVGzuWUA060btN3ZVn
	 7zAvw3LXHJt1imt69z9Uw2uvgxdJ4vz6CY1xfaWarR09Nl4xo2+PXaWcFEi60fiDnW
	 QYaCD3tqIdwUvkWvtifC4dBOMR8rdCt1ylH8SaFWAYdLD1CgHF0tbdCerlMcwLQTQU
	 boeq/NHZ7/+Pg==
Date: Mon, 07 Apr 2025 07:47:59 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Tony Luck <tony.luck@intel.com>, devicetree@vger.kernel.org, 
 Jonathan Hunter <jonathanh@nvidia.com>, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, 
 linux-tegra@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: Aaron Kling <webgeek1234@gmail.com>
In-Reply-To: <20250406-tegra-pstore-v1-1-bf5b57f12293@gmail.com>
References: <20250406-tegra-pstore-v1-1-bf5b57f12293@gmail.com>
Message-Id: <174402971861.1782962.14546127758047904369.robh@kernel.org>
Subject: Re: [PATCH] arm64: tegra: Enable ramoops on Tegra210 and newer


On Sun, 06 Apr 2025 16:12:43 -0500, Aaron Kling wrote:
> This allows using pstore on all such platforms. There are some
> differences per arch:
> 
> * Tegra132: Flounder does not appear to enumerate pstore and I do not
>   have access to norrin, thus Tegra132 is left out of this commit.
> * Tegra210: Does not support ramoops carveouts in the bootloader, instead
>   relying on a dowstream driver to allocate the carveout, hence this
>   hardcodes a location matching what the downstream driver picks.
> * Tegra186 and Tegra194 on cboot: Bootloader fills in the address and
>   size in a node specifically named /reserved-memory/ramoops_carveout,
>   thus these cannot be renamed.
> * Tegra194 and Tegra234 on edk2: Bootloader looks up the node based on
>   compatible, however the dt still does not know the address, so keeping
>   the node name consistent on Tegra186 and newer.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 16 ++++++++++++++++
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 16 ++++++++++++++++
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 13 +++++++++++++
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 16 ++++++++++++++++
>  4 files changed, 61 insertions(+)
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
 Base: using specified base-commit 91e5bfe317d8f8471fbaa3e70cf66cae1314a516

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/nvidia/' for 20250406-tegra-pstore-v1-1-bf5b57f12293@gmail.com:

arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: ramoops_carveout (ramoops): 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/reserved-memory/ramoops.yaml#
arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ramoops_carveout (ramoops): 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/reserved-memory/ramoops.yaml#
arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: ramoops_carveout (ramoops): 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/reserved-memory/ramoops.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ramoops_carveout (ramoops): 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/reserved-memory/ramoops.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ramoops_carveout (ramoops): 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/reserved-memory/ramoops.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: ramoops_carveout (ramoops): 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/reserved-memory/ramoops.yaml#
arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: ramoops_carveout (ramoops): 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/reserved-memory/ramoops.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: ramoops_carveout (ramoops): 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/reserved-memory/ramoops.yaml#
arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: ramoops_carveout (ramoops): 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/reserved-memory/ramoops.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: ramoops_carveout (ramoops): 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/reserved-memory/ramoops.yaml#
arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dtb: ramoops_carveout (ramoops): 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/reserved-memory/ramoops.yaml#





