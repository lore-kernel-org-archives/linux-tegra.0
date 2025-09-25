Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5C63054F5;
	Thu, 25 Sep 2025 15:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758815628; cv=none; b=dZva3IhCwgkRyPcIuJVauiStDmxijqB+0EOBDWiM9NUPB1wFWnI/BK3iktQ/xWV1+/NP7XstIwgrZ7kd/l2YGdTq/CHpWikg/FC0vBW4XYz1Zgj2QLxKLucx7Ain27Cmq5t07SZmttfZ0hXikVJnfxYhicxFentEi2hvCE0ocTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758815628; c=relaxed/simple;
	bh=qLfkQayUyyTpUxmMxQgCh6va1bTgKv06CeN7W+Guxp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUsyheXchPn/gJhcmlCFOc2TxOpLzgWqD5jUca5xrCJX/F9gTUGy5HiHoeW2X9b4Ds8/+qwwdf08p/wLz7WwXsEk2N7iY1xAPnpBfmFZHKeSFloysaDAxX/1p1+HqVCFCUj2esx0h6fZNJQgU9MyUpZiR7PeELs6KkD5xdTUxnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NaImFg2S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NaImFg2S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EEF1C4CEF0;
	Thu, 25 Sep 2025 15:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758815627;
	bh=qLfkQayUyyTpUxmMxQgCh6va1bTgKv06CeN7W+Guxp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NaImFg2SnKjD0D/KNSGIlpkjMoJ5hZy57r2Pbp1seEOHsEUgkPBnIqOxzMsuRmJi8
	 3AW+nm1hAgaB8SV5+Nl9rthJzAGgycc0AD6kSI8u2meSi6+lIuVKAL8v4Kbj7VHixu
	 ttexOjVHdQfoI6gf9LR+XkLVV9a40a1OMj8rk/29ops+oQL0jDLTbUy8RkGc5DUis3
	 uiWkE51gLfsImpinug9iVKAenkVA4t1U2wa5Jk74sOEAGDQ/5heR2SFWDBrC1jC4E3
	 4WMV4CoVVYPQ/0GTVLyjowCMYaiG9MqLt/DvWJkibHh0voBUQ+08mA3iKLGJRsbl+l
	 S6JN3HgTQ7DKQ==
Date: Thu, 25 Sep 2025 17:53:42 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Vidya Sagar <vidyas@nvidia.com>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Gautham Srinivasan <gauthams@nvidia.com>,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] arm64: tegra: Add pinctrl definition for PCIe C4 EP
Message-ID: <aNVlhjAcCnGI0ziT@ryzen>
References: <20250919120920.158497-2-cassel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919120920.158497-2-cassel@kernel.org>

On Fri, Sep 19, 2025 at 02:09:21PM +0200, Niklas Cassel wrote:
> From: Gautham Srinivasan <gauthams@nvidia.com>
> 
> Commit 0580286d0d22 ("arm64: tegra: Add Tegra234 PCIe C4 EP definition")
> added the device tree entry "pcie-ep@14160000" for C4 endpoint. However,
> it missed pinctrl definition. Without the pinctl definition, the C4
> endpoint of Jetson Orin Nano does not work. Add the missing definition.
> 
> Signed-off-by: Gautham Srinivasan <gauthams@nvidia.com>
> [cassel: Add to the existing nodes instead of creating new ones.
> Remove non-existing nvidia,lpdr property. Rename node to match dtschema.]
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
> Changes since v1:
> -Remove non-existing nvidia,lpdr pinmux property.
> -Rename pex_rst_c4_in to pinmux-pex-rst-c4-in to match dtschema requirement.
> 
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Hello Tegra architecture maintainers,

any chance that this could get queued up for 6.18-rc1 ?

The device tree node it modifies pcie-ep@14160000 is marked as disabled
by default, so there should be no risk of regressions.


Kind regards,
Niklas
