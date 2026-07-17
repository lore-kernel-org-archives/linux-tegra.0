Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C22C3A8398;
	Fri, 17 Jul 2026 21:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784323641; cv=none; b=gLdUOKsJQbBpIDNiJ++pqFIH1PUvsG5gB7xQZjxDtRIVwR6bMN/ySbfxL6J0cDw5YJ5oG6v6OUngulTDtWm6MnTHFNBeHrhATubZAkrJARssxgSZK2qd/pBpZlp4moSHfnKG4cezjBgWtg7QGBFVl+3pTRcTdYWyCuj43B5jPM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784323641; c=relaxed/simple;
	bh=hlOvDEGjOs+X9GIX7iU0G0rAaBph46MvyoP4I7opZic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=toN4q6kEmVPPVEuMnbGwVlWbJ5plqVeokZ8iwY8jsdpj5aZvDn9Zi+QMJBQ3r6PybE9tDwgIMTE3AAYm1+F5/BiESwbQ99ina4SzDlliUk9ZjNz4WpJY6x9F5onA4N1lsV3FsZqGkheNhi/gBMhDTd07UAxBwVbPTpMBdiYr4OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BPbvkNOR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BPbvkNOR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1F161F000E9;
	Fri, 17 Jul 2026 21:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784323640;
	bh=dBXnne14TzlGPYAE+jbYfL9GYyOWxF/Hk8U7r5KsX5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BPbvkNORLypm5tMeKLGKGv1izmes31ey74tGLqP1f0nloc7ykPU6tRrhX8tOwb0T5
	 /P+l6Y+g2XjbjmiGE1bgryblIglANr9DKZfzapdI85P3ktmk5whQ2khOtIzXAHqXH8
	 VfGR4JPdOMgV9GOO648cnbqY/d2yLMfShrjOb1dNOHDHN0oUsWfOGq22bEh106sc9d
	 vtKTNCe4pPOQgD9MyHSb6qEY5mAxDVBt2U5xYNBxhHAeYNa3L5Y2Q1TfIuAbLKYbvz
	 HBGB/Fkwd19p1VP6qLPPJm+7UXgn6ezJTXQg0ukqMb18nP/IoHdevI4YOQre+bPIbm
	 o+mVVVHzIWuUQ==
Date: Fri, 17 Jul 2026 16:27:19 -0500
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: net: nvidia,tegra234-mgbe: Add missing
 properties
Message-ID: <20260717212719.GA2687584-robh@kernel.org>
References: <20260716212001.989872-1-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716212001.989872-1-thierry.reding@kernel.org>

On Thu, Jul 16, 2026 at 11:20:01PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Being a DWMAC derivative, the Tegra234 MGBE supports AXI configuration
> nodes named stmmac-axi-config and phandle references to them using the
> snps,axi-config property.
> 
> While at it, add the 10gbase-r PHY mode.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> This gets rid of the remaining warnings on half of the Tegra234 boards.
> 
>  .../devicetree/bindings/net/nvidia,tegra234-mgbe.yaml    | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml b/Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml
> index 215f14d1897d..dc897e312c55 100644
> --- a/Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml
> +++ b/Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml
> @@ -81,8 +81,9 @@ properties:
>    phy-mode:
>      contains:
>        enum:
> -        - usxgmii
>          - 10gbase-kr
> +        - 10gbase-r
> +        - usxgmii
>  
>    mdio:
>      $ref: mdio.yaml#
> @@ -90,6 +91,12 @@ properties:
>      description:
>        Optional node for embedded MDIO controller.
>  
> +  snps,axi-config:
> +    $ref: snps,dwmac.yaml#/properties/snps,axi-config
> +
> +  stmmac-axi-config:
> +    $ref: snps,dwmac.yaml#/properties/stmmac-axi-config

You should be referencing the whole snps,dwmac.yaml.

Rob
