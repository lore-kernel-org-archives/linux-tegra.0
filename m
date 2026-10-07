Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8915848F026;
	Wed,  7 Oct 2026 15:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791386445; cv=none; b=Zwo2rjyUoA4WJ87szj1BBuKjU6s02LvVOaHX4PQCEOcVYd1/boOB2QEBUkeRXK8OwbsVqsmerdZuxpVlaQXq18CwfhF/7rPpqSDZ5nJQ/s1kb+MyxMkRqGw+M+972NSSkP72es2xEf6eBgM7zAbyIA4W9GhGejKreW6W5rjVqLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791386445; c=relaxed/simple;
	bh=YxU0eEXZ3datwBqjPv6a38qmfV0SH5VoFif4g7d/xYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WiFVZypk5E3BnWBEqpdnD+0n/OAEqwvC6vaopAyTQDnjCgNfAnxji6cHvDwzSj/on67R6RPVAh5E2MnOkkyfNpEZV3ezkxLhIQ/SoaysOthMGyj98tbl+PXhnCG14NaCy4B42y/n128Q7GZ+NOxRWcbsBt3aGDLQqAkO6QqgjAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U9uM6QWN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U9uM6QWN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C9C81F000FF;
	Wed,  7 Oct 2026 15:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791386442;
	bh=EKLsaXjZGAko+XBU27hTkiUmiXtO6L+HGPZBw1tVHs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U9uM6QWNt7ug2orR2RhsvNQTv4ZJcyj2zECiI4NXTdpEEvHsRRH0QcWP5R/SgTphU
	 vG2IiCPkWV5o/p0RsakQ5hUaam1HZ73lAUpXfBxS/st4hjBH+a8+TSeiN3wyoazGk4
	 Seu6OfqpiZ5FBSmZ627NbIM564vEfV7qToc7dRer5kFfUzsUPU1rbHQiQ4iT4bDMS7
	 P4o+GqB2HkPvjmTSS4RCeEmBWxCrKJ8DPoju1CjUgU9TOP6unE/DJJCtiXS8f9bhNM
	 5iq3o5fum71kCVFX1SN3zggSygLBbJJmLuLC/5TnqBmhEGReVCiBPVbnDvVCx66hsa
	 hg5hED12gcJ7w==
Date: Wed, 7 Oct 2026 17:20:34 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, JC Kuo <jckuo@nvidia.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Wayne Chang <waynec@nvidia.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 3/3] phy: tegra: Add support for Tegra238 XUSB pad
 controller
Message-ID: <y7p44oeut66usohn3hdfsx2fndlxhup6osok6uo27c5xreyjvv@uyk37kiedv3u>
References: <20261007-tegra-phy-v3-0-d501de414710@nvidia.com>
 <20261007-tegra-phy-v3-3-d501de414710@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261007-tegra-phy-v3-3-d501de414710@nvidia.com>

On Wed, Oct 07, 2026 at 03:44:43PM +0100, Jon Hunter wrote:
> Add support for the Tegra238 XUSB pad controller by populating the
> Tegra238 specific SoC data for the controller. The Tegra238 has three
> USB2 and USB3 ports, uses the same port ops as Tegra186 and has the
> same supplies as Tegra194. Due to the dependencies the Tegra238 device
> has on the Tegra186 port ops and Tegra194 supplies, drop the compile
> time guards around these structures.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/phy/tegra/Makefile        |  1 +
>  drivers/phy/tegra/xusb-tegra186.c | 29 +++++++++++++++++++++++------
>  drivers/phy/tegra/xusb.c          |  6 ++++++
>  drivers/phy/tegra/xusb.h          |  3 +++
>  4 files changed, 33 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/tegra/Makefile b/drivers/phy/tegra/Makefile
> index f5ed9582d80b..018a4cab2b40 100644
> --- a/drivers/phy/tegra/Makefile
> +++ b/drivers/phy/tegra/Makefile
> @@ -8,6 +8,7 @@ phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_210_SOC) += xusb-tegra210.o
>  phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_186_SOC) += xusb-tegra186.o
>  phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_194_SOC) += xusb-tegra186.o
>  phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_234_SOC) += xusb-tegra186.o
> +phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_238_SOC) += xusb-tegra186.o
>  phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_264_SOC) += xusb-tegra186.o

This is just a mess. As a followup patch, could you please please switch to
generic ARCH_TEGRA Kconfig option as done in this commit, 6b5e2f70a95c
("PCI: dwc: tegra194: Broaden architecture dependency")?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
