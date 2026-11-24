Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506115;
	b=cgdgJLSxIurYDg0AHr5Fz+7+WfUj3KnbTHR5PLU3ZsRNHj4s39hBP/h4JLG/DuNno1Fg
	 oZnIiwkUNBnTn3/kRoAjKvWnjQjPGVQFpgqDbQE5+AcuheaeIo3Y/rWLcUsF0RyyLFHAT
	 pPszy/UhYMuv3GFQRnmx0tnlcu8zPCSqIf+MRbiTdI/AHW+C4aXO9DLn3LMzR9SAxoPdX
	 whCI8llqPZaAKn6UlYPz0hiVwyebaahMyM5NZWGdbwLsdirkrer6Ho5tB4vIR20nwTgPb
	 WqdeW9X8TK7xqUClecyBalt5TI1G65MA+e3QR5lw++RUFofluUrXINOW67MkO9uoMDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506115;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=WOQ0LSfJ3yzPOJMcGvGReEaGmu9m+T2RW4nTPIrRKy0=;
	b=lVxKpV6e6TdElQ7Fv3dBKjKFErvEh1brwNFyJrq0iz6/fgS4IwtqgAn6IvRGrGWgFWgs
	 pVQEQFrde/53mnL3kpUbbZLb8RU7vz9O+CuquWUoePPSyI+e/lxAkLKNCwZGqlJ2Fmg9S
	 wxT8c7TRARQsGlC3wbAFCUwBxCxAP8Ibl3M36LWXyUE9a95f5aplvCVNTBpvcAS4U4Lvt
	 nznBxd2uchjniPyhCLOuZwwn7hAm/KRjhnzntzeOxjJ9zEOdmQjUqI5cqLnrXsa7l40DT
	 HUJSzNxH6aeMMpxkaJMtxJEVhSH4msMxjigi5JCCfeFuh7gVAaCmFPIu9plLSC5lRyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NhOzS5PB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8702D606A31E;
	Tue, 24 Nov 2026 07:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NhOzS5PB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC9201F000D0;
	Tue, 24 Nov 2026 07:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795506114;
	bh=WOQ0LSfJ3yzPOJMcGvGReEaGmu9m+T2RW4nTPIrRKy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NhOzS5PBJ+RK83W8/g63XFDH3g+vl8gmtSktDfP/aAO0Ypt2Bq3qjPLGxNHkIDBeS
	 NL9j8UP0BPkq4mohwgw7c+Etr9hmTwuDHqwYR9Y2h/vzfSvxwsUya8ERU1xLZcCRRb
	 1TdXFilgVPKxLuLiM4ECNeIBTpVd8apyDnIRgLaUGtbyUR8LAJa32FgGRPHuVpyzXI
	 cB91V6I0iqfgEqYC3LJyDUA1J1HENHIeOil2YrJ/8bRNO7KbQV/6k4J6WbfI5+i1J+
	 TMlipHhUGTOtnBz18s1mUNIIf0IUg0yOuL50uLQzOSt+fPnmGHf+zUcVaixKU+h5vw
	 dvgnlAecGmA0A==
Date: Tue, 24 Nov 2026 08:41:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Nagarjuna Kristam <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>, 
	Mathias Nyman <mathias.nyman@intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Thierry Reding <treding@nvidia.com>, Wayne Chang <waynec@nvidia.com>
Subject: Re: [PATCH v2 02/12] dt-bindings: usb: Add Tegra238 XUSB host
 controller support
Message-ID: <20261124-silky-bull-of-democracy-cdbeae@quoll>
References: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
 <20261116-tegra-usb-v2-2-42efc03a9700@nvidia.com>
 <20261123-sassy-fragrant-markhor-c6fbb3@quoll>
 <9e84ec1f-2c41-4be8-8ed1-f9350d9f2d67@nvidia.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9e84ec1f-2c41-4be8-8ed1-f9350d9f2d67@nvidia.com>

On Mon, Nov 23, 2026 at 01:36:36PM +0000, Jon Hunter wrote:
> >> +  reset-names:
> >> +    items:
> >> +      - const: xusb_host
> >> +      - const: xusb_ss
> > 
> > Drop xusb_ prefix, that's the name of this device.
> 
> 
> While I don't disagree, this is consistent with the other naming for
> things such as ...
> 
>   clock-names:
>     items:
>       - const: xusb_host
>       - const: xusb_falcon_src
>       - const: xusb_ss
>       - const: xusb_ss_src
>       - const: xusb_hs_src
>       - const: xusb_fs_src
>       - const: pll_u_480m
>       - const: clk_m
>       - const: pll_e
> 
>   power-domain-names:
>     items:
>       - const: xusb_host
>       - const: xusb_ss
> 
> We probably should have dropped the 'xusb_' for all of these. Given the
> above do you still prefer we drop 'xusb_' for the resets?

I prefer inconsistency, so resets without xusb, because otherwise we
will never move from discouraged namings.

Best regards,
Krzysztof

