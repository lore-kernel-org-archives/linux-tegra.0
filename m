Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB58646D571;
	Thu,  1 Oct 2026 19:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790884517; cv=none; b=jceE56GdIFj5ythuPixQXZu5Mr11U7DnPiG4TYYPVI6iobPIBbSG9GIz/eu3FJRCRA/kny5gLzNhsTQIMo2wW4X16wQ/ooNQHl+Y0KY1L9jrLkQPkqzKLhKaqXPMiHlNoFKCH/kic76JVke9hbFhokWREpBoymZrqqJpdwd44VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790884517; c=relaxed/simple;
	bh=KeNGLoxSr3dvxzl6RfzBtbD33YbgVPjmEzBRA9bAyRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B398nBb30l/HCq6Pz/wn9gjKI5KJX9dFftsFKE2OWtAtvt17UqgRP00Ab5/IFMQYVlqOP7Wi/GSB70hDmkqOMlYLDjQ3XIcsS9+EQ1ZJEKvnUWr8MHj6v/MZxhsPsYWarZNqiawtlEq+lYZGPbg7J0QTTS4hC1q+g1iBF90SCLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j8SgF8re; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8SgF8re"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78AE11F000FF;
	Thu,  1 Oct 2026 19:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790884511;
	bh=iQresKhJjRRteZnS9cU4c1hswvsXl2gs/6zxjOgrp/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j8SgF8reoojphKPLf/NOIU/OKPTjbvePN443QZ/ghiBSNLNxVI+V9sKoMbX/oue45
	 ALY8Zl6sDovFLB34Vet8KGRa7tfAJWjtsawDHYOFzdYgkhQT8Pa96EJ/8C531RSTNo
	 zsTXce1wYf4N3a90ePeQMOWisg1/zt9klSAZQT9xFAox86jYSdXB4FMQcWPKQtLmYD
	 ZkIjdZcRN2hI2LNFh+Jqem69zFaePOpwwIyxlO8H+PMp8r6+p9Fjk+MN5+HjVZeZ7N
	 0xv5/n+KkrxHUwMdUKXCdXioAkGhsGQrdnYeRt6rRZtwrFY0lCz7o8K62cn2d2Xb8F
	 QnH7xvSHEAh+w==
Date: Thu, 1 Oct 2026 14:55:10 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>, linux-sound@vger.kernel.org,
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
	mfd@lists.linux.dev, linux-tegra@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Thierry Reding <treding@nvidia.com>, Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: mfd: as3722: Convert to json-schema
Message-ID: <179088450829.1730371.5182923476099806939.robh@kernel.org>
References: <20260930-as3722-bindings-v2-0-a3bba649ebf9@nvidia.com>
 <20260930-as3722-bindings-v2-1-a3bba649ebf9@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-as3722-bindings-v2-1-a3bba649ebf9@nvidia.com>


On Wed, 30 Sep 2026 16:01:23 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the AMS AS3722 PMIC bindings from the free-form text format to
> json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - use pinmux-node.yaml, pincfg-node.yaml, gpio.yaml and regulator.yaml
> - add #gpio-cells and gpio-controller to list of required properties
> - remove some old and broken references from descriptions
> - use consistent formatting for description property
> - remove some duplicate type definitions
> - add missing additionalProperties
> - order properties consistently
> - constrain #gpio-cells to 2
> ---
>  .../devicetree/bindings/mfd/ams,as3722.yaml        | 293 +++++++++++++++++++++
>  Documentation/devicetree/bindings/mfd/as3722.txt   | 214 ---------------
>  .../bindings/regulator/as3722-regulator.txt        |  91 -------
>  3 files changed, 293 insertions(+), 305 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

