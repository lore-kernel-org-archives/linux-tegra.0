Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C5226CE1A;
	Tue, 19 Aug 2025 20:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755635243; cv=none; b=XAXy5/KFU8KFOmiZryy8sqwdYLpWYFRO2RHatOAyJsOBIzE84mdP72d/Rn3lkJ5b9gPhK7M1QdY69ZCq+nd3mQG7LPvxVXZAdcpixoDaqBQ57qvd8mRsVuMWg5OyrCFCw/uo8/mcnt53YcgHa2Y6sf7aSVVpwelXQWERvCeX6xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755635243; c=relaxed/simple;
	bh=oIDpHueO9zGTm/sfs/uw7A7+IqTRVGpRNQrkAMXBRsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AR2DTilx6iR8VPyXBeXnMdu6ETFPgV/AmBcsHwV7E1DgLaV/ozbMuk3yDigY6fXhlX6IPOny90ibNbDJqFZ3MyxY7bf2hIYHOK2oXCIe4CMVkxSHT4tG5xEIACxMBNKffa/X6foZd/mPOngYHcWPooyDvTQhQYYPbX1mXKMOREM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pmCFTRj3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pmCFTRj3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166F6C4CEF1;
	Tue, 19 Aug 2025 20:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755635243;
	bh=oIDpHueO9zGTm/sfs/uw7A7+IqTRVGpRNQrkAMXBRsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pmCFTRj3iZCCkzA57BGea3AnymZmNXaIgJtP0674gt4uZi6udBFgB8yVncHIR7+Ke
	 pIgNDFO1IJi9rf3m2tnECTQ6YY2zQBPPLeKDGzBAnqTKtRxfCMB8cpEVItQLdjo8SH
	 wHONffK+o4aqaRMEUXiGaFgeuLHVWfxOD2GoakCdmi06QMXdGE6K5KF6iIMz97nC1G
	 jnBGlEfBr49Ae10eKlKgXjHv6E1xEcvq18BPlIpq7yfp5uM+HvUYy36KbwBP3kf7Mr
	 DJMx/i+tW6w0FNinu33Pdly+YTqdhMtGe9/A11KzN2Kgv2lHIlAalqpLRg2ygW6JVZ
	 6ApwOp+YhQLAA==
Date: Tue, 19 Aug 2025 15:27:22 -0500
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 04/19] dt-bindings: display: tegra: document Tegra30
 VIP
Message-ID: <20250819202722.GA1264491-robh@kernel.org>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-5-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819121631.84280-5-clamor95@gmail.com>

On Tue, Aug 19, 2025 at 03:16:16PM +0300, Svyatoslav Ryhel wrote:
> Parallel VI interface found in Tegra30 is exactly the same as Tegra20 has.

That's not what the compatible schema says. 'exactly the same' implies a 
fallback to whatever it is exactly the same as.

> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml    | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
> index 14294edb8d8c..39e9b3297dbd 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
> @@ -13,6 +13,7 @@ properties:
>    compatible:
>      enum:
>        - nvidia,tegra20-vip
> +      - nvidia,tegra30-vip
>  
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
> -- 
> 2.48.1
> 
