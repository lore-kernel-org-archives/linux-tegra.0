Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22E7352FB3;
	Fri,  9 Jan 2026 08:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767948849; cv=none; b=TuU2yq9RkA+ERVaoo+hEWcCDMT38OdJnPNd+xfCDiGrWce5SnSuoPVx5AWCIXFXYHhK7iEO00Tf+xM1D7cBquJcaGPW8A0dDvsgnnlXPZjAcVqTNho5mxW6NezDGaYjw7xA0Sm6K9S7kALqO0GegmbLpqzXZf08EG91ysgFeUG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767948849; c=relaxed/simple;
	bh=/qxnFoaPSbXFrhahnhxSiewnZt1gTO6W1JMqA2SMcDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hFZ3mmKsli58wRe+E7nIbMLwY5HZ0dVmwQ3gRVxjBZ0Qz92vfN/zN0ALEjm4+LLU+E4D9VIUVBSLeUeJDIheVzp4EvDjUP1HE4+9KQ0FhiiG1YMhVul1dLeIYEVJeE6j6KsjXQkOGvywYMX6j9k5AYW5gCYbHy8HRowL/z4NsAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bXS+MBtC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bXS+MBtC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E47C4CEF1;
	Fri,  9 Jan 2026 08:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767948848;
	bh=/qxnFoaPSbXFrhahnhxSiewnZt1gTO6W1JMqA2SMcDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bXS+MBtCmO8KrvZ7Qt6xoR19Z6zGTZz/JFKap2vmDzqyfWKQH5pxiUxJShoTJr3GV
	 JFpya2j41QARy+2pVSJEXpwFnZ0MJlg+evCWZku+ZcjC+bL2g/wceME6eS/5D5JqKS
	 y0XUoI5uEWJGDEyfstbfqJn+Mpb4P5verADjCtfbnBKXopJsnA3OU8a4m3VbZKHmGk
	 8d2U9vW+4ipDBrF3CovR4ImyI745YkzPOuuVENdjmORCwyXL/PuFd+0lWd9A9QgT9d
	 LY5oO43HPENaC6/qQZnY2cNFNgNKrCG11Th98/IaIX5j5ufcP6IA8rAqbepyN2MQTB
	 XhCHqf3VS0dSQ==
Date: Fri, 9 Jan 2026 09:54:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: realtek,rt5640: Update jack-detect
Message-ID: <20260109-enlightened-purple-pogona-d3e475@quoll>
References: <20260108143158.351223-1-jonathanh@nvidia.com>
 <20260108143158.351223-3-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260108143158.351223-3-jonathanh@nvidia.com>

On Thu, Jan 08, 2026 at 02:31:57PM +0000, Jon Hunter wrote:
> The device-tree property 'realtek,jack-detect-source' currently only
> permits values from 0-6. However, commit 2b9c8d2b3c89 ("ASoC: rt5640:
> Add the HDA header support") updated the Realtek rt5640 to support
> setting the 'realtek,jack-detect-source' to 7 to support the HDA header.
> 
> The Tegra234 platforms currently set 'realtek,jack-detect-source' to 7
> for the HDA header and this is causing a warning when building
> device-tree.
> 
>  audio-codec@1c (realtek,rt5640): realtek,jack-detect-source:
>   7 is not one of [0, 1, 2, 3, 4, 5, 6]
> 
> Given that the driver already supports this settings, update the binding
> document for the rt5640 device to add the HDA header as a valid
> configuration for the 'realtek,jack-detect-source' property.
> 
> Fixes: 2b9c8d2b3c89 ("ASoC: rt5640: Add the HDA header support")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  Documentation/devicetree/bindings/sound/realtek,rt5640.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

