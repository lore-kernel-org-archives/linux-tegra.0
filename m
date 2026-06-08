Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1367135836A;
	Mon,  8 Jun 2026 05:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780898162; cv=none; b=EcGtI8QfSaPvNdKzP/LqhKPbL74dNHgyr6ZOLZc2qCpSJzNTtvFoY7HE7KEFpK+Qda7qvdLmgSyQbtIgZVGt/Mi0mNIFqaEpK14jhPMkEiiRUpdfJo3VVgJBa2leeSo3tKMB+oYjlJ64sQ1arfYx8B5exaQ0bOV3ZUoP0Nci6/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780898162; c=relaxed/simple;
	bh=1tedobO0Y+zCiMJOKxoZsfxqE8GEtPoz++Zcs6G5RDo=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OYPnbQieemlzn+RG6OUOM1Zuf3IC5d0reHcI+Lq6Seo5uaAT64F7LwosLjS4UQpXacZFLYmeTL112tZx/ktdg0S6XPtgSA+wSrW4+XTjMZr9DUSLy0fUjForQbSRs6p6wEqEmWZmVpLFXVYYBv2HfG3o+Z5giNFHy0BCs+QvnR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQqLYcOh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQqLYcOh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A6CD1F00898;
	Mon,  8 Jun 2026 05:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780898160;
	bh=BHCcwuBurL/77nGhILnx41LfdVHpOdtqW6tXK8NbuQk=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=RQqLYcOhBwJSuYSlrGvUPh6oC21eVBEKMikZuwGjjOo4OuDmGZvMau88T/IBEDCxU
	 yDV0n5gGyX3SV58Q+Gh1zKA/VxBmapQFf/4plfucaJmJ5bnaaozhoqgGZ/pvr9w2Af
	 sRERvkwFjF+/X0iXadjlS1GEt+Lub4+RSOSwYyT2/9sadkYzZCWy5eGFriYeXXYKt9
	 u/TjAE2Fk6+Yjwcy5l7ooFMuspcdJ1U/X3w8K/2me19cCRkB0qSH06QyJCDJLlvVlq
	 uPWqIGx2lr/1XsZ9kUqLjc8u8/dhSQM6BVGOvU2zeGgABqfW3v4xD4jEssZeo+p76F
	 sTkzWolPKfp5g==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Akhil R <akhilrajeev@nvidia.com>
In-Reply-To: <20260331102303.33181-1-akhilrajeev@nvidia.com>
References: <20260331102303.33181-1-akhilrajeev@nvidia.com>
Subject: Re: (subset) [PATCH v6 00/10] Add GPCDMA support in Tegra264
Message-Id: <178089815693.15844.9585336609711943843.b4-ty@kernel.org>
Date: Mon, 08 Jun 2026 11:25:56 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 31 Mar 2026 15:52:53 +0530, Akhil R wrote:
> This series adds support for GPCDMA in Tegra264 with additional
> support for separate stream ID for each channel. Tegra264 GPCDMA
> controller has changes in the register offsets and uses 41-bit
> addressing for memory. Add changes in the tegra186-gpc-dma driver
> to support these.
> 
> v5->v6:
> - Replace dev_err() with dev_err_probe() in the probe function for fixed
>   return values also.
> v4->v5:
> - Use dev_err_probe() when returning error from the probe function.
> - Remove tegra194 and tegra234 compatible from the reset 'if' condition
>   in the bindings as suggested in v2 (which I missed).
> v3->v4:
> - Split device tree changes to two patches.
> - Reordered patches to have fixes first.
> - Added fixes tag to dt-bindings and device tree changes.
> v2->v3:
> - Add description for iommu-map property and update commit descriptions.
> - Use enum for compatible string instead of const.
> - Remove unused registers from struct tegra_dma_channel_regs.
> - Use devm_of_dma_controller_register() to register the DMA controller.
> - Remove return value check for mask setting in the driver as the bitmask
>   value is always greater than 32.
> v1->v2:
> - Fix dt_bindings_check warnings
> - Drop fallback compatible "nvidia,tegra186-gpcdma" from Tegra264 DT
> - Use dma_addr_t for sg_req src/dst fields and drop separate high_add
>   variable and check for the addr_bits only when programming the
>   registers.
> - Update address width to 39 bits for Tegra234 and before since the SMMU
>   supports only up to 39 bits till Tegra234.
> - Add a patch to do managed DMA controller registration.
> - Describe the second iteration in the probe.
> - Update commit descriptions.
> 
> [...]

Applied, thanks!

[01/10] dt-bindings: dma: nvidia,tegra186-gpc-dma: Make reset optional
        commit: cc6049bd3fa8501ee27042df469a19ed69cf406d
[03/10] dt-bindings: dma: nvidia,tegra186-gpc-dma: Add iommu-map property
        commit: d6d7ffb994c676e6414a725d7eb8f208d901b63a
[04/10] dmaengine: tegra: Make reset control optional
        commit: 680e1b928a6adc1b2d95038ffe9c9887ceafd478
[05/10] dmaengine: tegra: Use struct for register offsets
        commit: 5000beabae65310ec81db40dcda181b0a6192ff3
[06/10] dmaengine: tegra: Support address width > 39 bits
        commit: 286632b9bf1cf239482d54b592cc1d5bbd5ec783
[07/10] dmaengine: tegra: Use managed DMA controller registration
        commit: 45921a3282d642038d92737fab24107522324bd4
[08/10] dmaengine: tegra: Use iommu-map for stream ID
        commit: 321c0a15f027b83b20ed37717191a2187c9e2eb7
[09/10] dmaengine: tegra: Add Tegra264 support
        commit: b236b7973808195fd9c471492bee0041148b823e

Best regards,
-- 
~Vinod


