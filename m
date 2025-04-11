Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA93215171;
	Fri, 11 Apr 2025 11:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370458; cv=none; b=eUZr1eQsaVbDNCtYDahqbKR5SyfTX8kIVTOMeJjNKz5wA4GdeiHSFHqtfmTCkmnQmvki1i63Sz82LWcyufe6AwQ3xRculNAG91MtafOzj3G5bOqdHjAIrvjkkgaXB+mZNgCGouAUOCRKt11wnHPU/ryl/ANetSTAWAlT1i/HgpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370458; c=relaxed/simple;
	bh=EcYG/g8DZi4Q6gr2HP2qs4xQZ+9z5aVwORnINoywG58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKI6hhixnEU5fPvHeU8anhlJvRuDjT8tPDpkG4fK8j7E8TxproUGIh8P0Y4QLdAT2xt4uMIX4UuUY7xxhx11NhlIRYjZY1WsTcxHU3cSBoiA18uQ0vOZqAU8Y2VYxYOa1hwlElBzLljOXMf2NJjRq1RYAU7jn/rGhzyaADqVwps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SMWg3Bl0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SMWg3Bl0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02767C4CEE2;
	Fri, 11 Apr 2025 11:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744370457;
	bh=EcYG/g8DZi4Q6gr2HP2qs4xQZ+9z5aVwORnINoywG58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SMWg3Bl0WAbkrm9olDCQ76zjOG/UbZQ8tQw4h7dTIFJzz9w7M04BLeKjNWyH2mFBa
	 GmHSog+f6PkiOWjnq9SjJP4jBiiMBHnbNhk0z8n3c8B+fJng+vpyPMCv2R0nqXk40h
	 ldIyU20oTl9kreSWjwd3T12IluKzS9e9tK9I2wr259PSgGj13Zmsc9sVrIus/xTDtl
	 al3296xXsbd9XJzMUGibEjxwBooTtB5VYMnnUC2xmmU2E1exd6gf0saMtPbOgzDN2h
	 aMr6tj9eDKjuKAHItPI7GHHFafvER6DdOV9sQ7Nj3izWvUfmVueeSkNNok1/lmLfvX
	 0nmn/kCgPRZqA==
Date: Fri, 11 Apr 2025 16:50:53 +0530
From: Vinod Koul <vkoul@kernel.org>
To: shao.mingyin@zte.com.cn
Cc: miquel.raynal@bootlin.com, jckuo@nvidia.com, kishon@kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	thierry.reding@gmail.com, jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org, yang.yang29@zte.com.cn,
	xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn, xie.ludan@zte.com.cn
Subject: Re: [PATCH 1/2] phy: =?iso-8859-1?Q?marvel?=
 =?iso-8859-1?Q?l=3A_a3700-comphy=3A_Use=A0devm=5Fplatform=5Fioremap=5Fres?=
 =?iso-8859-1?Q?ource=5Fbyname?=
Message-ID: <Z/j7FWmvhS83FnrA@vaman>
References: <20250401193134281Nbc40spYmxjVmftwF0KTZ@zte.com.cn>
 <20250401193836885cYSO33OlICvYYYmEMlB5J@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401193836885cYSO33OlICvYYYmEMlB5J@zte.com.cn>

On 01-04-25, 19:38, shao.mingyin@zte.com.cn wrote:
> From: Xie Ludan <xie.ludan@zte.com.cn>
> 
> Introduce devm_platform_ioremap_resource_byname() to simplify resource
> retrieval and mapping.This new function consolidates
> platform_get_resource_byname() and devm_ioremap_resource() into
> a single call, improving code readability and reducing API call overhead.
> 
> Signed-off-by: Xie Ludan <xie.ludan@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
>  drivers/phy/marvell/phy-mvebu-a3700-comphy.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/phy/marvell/phy-mvebu-a3700-comphy.c b/drivers/phy/marvell/phy-mvebu-a3700-comphy.c
> index 1d1db1737422..e629a1a73214 100644
> --- a/drivers/phy/marvell/phy-mvebu-a3700-comphy.c
> +++ b/drivers/phy/marvell/phy-mvebu-a3700-comphy.c
> @@ -1253,26 +1253,20 @@ static int mvebu_a3700_comphy_probe(struct platform_device *pdev)
> 
>  	spin_lock_init(&priv->lock);
> 
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "comphy");

res is unused so this should lead to warnings by this patch, did you at
least compile test it?

> -	priv->comphy_regs = devm_ioremap_resource(&pdev->dev, res);
> +	priv->comphy_regs = devm_platform_ioremap_resource_byname(pdev, "comphy");
>  	if (IS_ERR(priv->comphy_regs))
>  		return PTR_ERR(priv->comphy_regs);
> 
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -					   "lane1_pcie_gbe");
> -	priv->lane1_phy_regs = devm_ioremap_resource(&pdev->dev, res);
> +	priv->lane1_phy_regs = devm_platform_ioremap_resource_byname(pdev, "lane1_pcie_gbe");
>  	if (IS_ERR(priv->lane1_phy_regs))
>  		return PTR_ERR(priv->lane1_phy_regs);
> 
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -					   "lane0_usb3_gbe");
> -	priv->lane0_phy_regs = devm_ioremap_resource(&pdev->dev, res);
> +	priv->lane0_phy_regs = devm_platform_ioremap_resource_byname(pdev, "lane0_usb3_gbe");
>  	if (IS_ERR(priv->lane0_phy_regs))
>  		return PTR_ERR(priv->lane0_phy_regs);
> 
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -					   "lane2_sata_usb3");
> -	priv->lane2_phy_indirect = devm_ioremap_resource(&pdev->dev, res);
> +	priv->lane2_phy_indirect = devm_platform_ioremap_resource_byname(pdev,
> +									 "lane2_sata_usb3");
>  	if (IS_ERR(priv->lane2_phy_indirect))
>  		return PTR_ERR(priv->lane2_phy_indirect);
> 
> -- 
> 2.25.1

-- 
~Vinod
