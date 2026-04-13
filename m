Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EEA30C359;
	Mon, 13 Apr 2026 17:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776100688; cv=none; b=LZlQdgOhnRmjaI8PSzc12xIIce0yDjcRcCDTFDuiYOQx31xtkVcnPR9TrGQOjJ8rsHIDHZ8vxP7rPebIirM1VVfh/s+Ipwcq1w/iy+ODvtbKiNG4crxvfXsxZJSEKq+BG/VRaYQXgRUGqRJShsWCOL33f1uDcsRboLzIOGjRkwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776100688; c=relaxed/simple;
	bh=Co2KOb4G3FeJqtqprIR0NBscDKmG9W3FhyZ8+2Wjvl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6tMC6hdaH5mzEarC1r1jJ0Orz8PYJe9CmCPK+rT8sCtzimq8i0/tNzVccIryi7V+nNFN7GP/K9fiU927A5i+Y6+g+a8I5+i3+d/K7sdU6Vyo3YSNycON4/aGxlCs6aIM+ogWsQc6I517NDOpKFMTUj48fRabLZdrsufOQ7fOj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cZ+FTLT7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cZ+FTLT7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF3DC2BCAF;
	Mon, 13 Apr 2026 17:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776100687;
	bh=Co2KOb4G3FeJqtqprIR0NBscDKmG9W3FhyZ8+2Wjvl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cZ+FTLT7bwdqAqcfck2J9ABwwqekxRME6gfB84TPYFOTz56AeWA1gqVMlIObtBulP
	 ctYd1n/W+B/anmzALWMb4ERT57zLs8N+UZtht6e0Bl6sualRRcW6BbEULZ3elOjKdX
	 scqJ079W3tWV4iL9eOCqGfxecT9+csRs+sItEEeJLYW7aiuFOiau3DzorcWpver6m4
	 FYDF7srh8kwpV9m9tIdjdXukiOaTPbr5u9MYHt4fu3GXYQ/ExZ1NVTO2/1/R00qHF9
	 2fDyP/e5eD3U4OewiU9bRuGBITR5l9GBmQ8uH3jGqc2WK78xoiTy8F/0RiU4c9n8kh
	 oX7X7coV23YVw==
Date: Mon, 13 Apr 2026 12:18:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Prathamesh Shete <pshete@nvidia.com>, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: nvidia,tegra234: Correctly use
 additionalProperties
Message-ID: <177610068485.3067173.647144175900143286.robh@kernel.org>
References: <20260410111047.309798-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260410111047.309798-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410111047.309798-4-krzysztof.kozlowski@oss.qualcomm.com>


On Fri, 10 Apr 2026 13:10:49 +0200, Krzysztof Kozlowski wrote:
> The binding does not reference any other schema, thus should use
> "additionalProperties: false" to disallow any undocumented properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml | 2 +-
>  .../devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

