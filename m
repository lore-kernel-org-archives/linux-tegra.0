Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7416296BAF
	for <linux-tegra@vger.kernel.org>; Fri, 23 Jan 2026 07:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769154447; cv=none; b=BRoJP0Xp7Fz0pDPGhsP/40FWxQ/+eTsbFNOWeUnZZs8Z4bBnwUVNdAwNh/HEyOsOpebuWA7XzcyNobWeLCDQy066wlNmAy9C+s1U/BFE6ZUaGdvVscvLIeakm1BzlGh5ZG9bf2Tb+Z35kGbzwyMXw6+S0NSDyBOhSw85wpv52SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769154447; c=relaxed/simple;
	bh=dOll45aJteWe/IdVv749+twRkEY8CjTGFq0bhB2NtGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hXuF50SmFCVpFMnnpIBIx1oF8xlcgXCRrMVMHM5bHz88R+cVfVIIO1InS64OyFyfPwcg1H++aeTioNbf1PEI32DpY6O9XXDl5XX0EohVlTYO7CR0G/oBVOX2WhoKL64xeHAS5/TrK7qBjxcphoaV0A80QrTpC4FuWDtNneu8JWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fbYgL7Ke; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fbYgL7Ke"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F08A8C4CEF1;
	Fri, 23 Jan 2026 07:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769154447;
	bh=dOll45aJteWe/IdVv749+twRkEY8CjTGFq0bhB2NtGs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fbYgL7Kelmvg0PKpKns0GUwSXw+tu1FNKrGVh/a0hMA/06TjoN1BrgTfAon9el6kg
	 ZzhuNlUKPE9xgFOgs3AEqoRGtow9Q4eg8oe2kXs0jVodl3vXUGaVEpvh+mELyhLylg
	 pDpTmGL4JXU09G094RhJsq3oOHCZSY95cdJSzSYTaMUxFdA0EIjZ6+jE2Zzsx0odnI
	 CE4rNTgHJwWdFhfsW4n22bol68M6JBM003248Sb+L+PB38qUT/adHBOIMpTqMk/5Re
	 pT+MrKNZa7Br+V2TM3yb/uQRaIsIx75NzwPWASImZOKna7tdk43HyeOay25n6ZeJoo
	 3yQLOLDyVrYjg==
Message-ID: <53d3a98f-3ad8-43c0-9094-39f229a5b698@kernel.org>
Date: Fri, 23 Jan 2026 08:47:24 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v6.20-rc1
To: Thierry Reding <thierry.reding@gmail.com>, arm@kernel.org, soc@kernel.org
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260118080304.2646387-1-thierry.reding@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260118080304.2646387-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/01/2026 09:03, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.20-dt-bindings
> 
> for you to fetch changes up to b2788f6320722d6059f849f35a77eb082608c627:
> 
>   ASoC: dt-bindings: realtek,rt5640: Document port node (2026-01-17 01:58:18 +0100)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> dt-bindings: Changes for v6.20-rc1
> 
> This series updates various DT bindings for Tegra architecture,
> primarily focusing on schema validation fixes and new feature
> documentation for Tegra234 and Tegra264 SoCs. Key changes include
> correcting realtek,rt5640 audio codec bindings (adding missing ports,
> clocks, and jack-detect sources), converting Tegra20 NAND bindings to
> YAML, and updating memory, DMA, and IOMMU definitions for Tegra264
> (introducing CMDQV and DBB clock support). Additionally, it resolves
> legacy warnings for Tegra30/132 display and VI interfaces.
> 
> ----------------------------------------------------------------
> Ashish Mhetre (1):
>       dt-bindings: iommu: Add NVIDIA Tegra CMDQV support
> 
> Charan Pedumuru (1):
>       dt-bindings: mtd: nvidia,tegra20-nand: convert to DT schema

This should go via MTD. I think Miquel is not ignoring bindings.

> 
> Jon Hunter (4):
>       dt-bindings: tegra: pmc: Update aotag as an optional aperture

...

>       ASoC: dt-bindings: realtek,rt5640: Document mclk
>       ASoC: dt-bindings: realtek,rt5640: Update jack-detect
>       ASoC: dt-bindings: realtek,rt5640: Document port node

No, Mark always promptly picks up bindings patches, so I do not
understand why these are here. These should go via subsystem maintainer.
> 
> Svyatoslav Ryhel (2):
>       dt-bindings: display: tegra: document Tegra132 MIPI calibration device
>       dt-bindings: display: tegra: document Tegra30 VI and VIP
> 
> Thierry Reding (1):
>       dt-bindings: memory: tegra: Document DBB clock for Tegra264

And this one was never publicly acknowledged that you applied it and
lead to ACTUAL warning/review comment from my side postponing your other
patch.

If you took this patch for DTS, then it must be on the DTS branch BEFORE
the DTS uses it. There is explicit rule about this in writing bindings.
You even sent it like that, look:
https://lore.kernel.org/all/176856655186.139432.6919318227218814446.b4-ty@nvidia.com/
1/3: DT binding
2/3: driver
3/3: DTS

so why a correct posting you would disorganize and break the
bisectability rule by applying binding separate?

> 
> sheetal (1):
>       dt-bindings: dma: Update ADMA bindings for tegra264

Vinod also picks up such bindings. If this is for DTS then should be in
DTS branch.

Best regards,
Krzysztof

