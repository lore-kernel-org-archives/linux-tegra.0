Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F9426A1CC;
	Fri, 29 Aug 2025 07:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756452565; cv=none; b=ghqSh20YPkYd0RLfGa6H3J4B8kbgxd3ZzvHVi8IdYitPeiiAhmN+AxqpfsnFZNsQKXfAEbjDQ+Zf2/EMDNlI47nVhcYKvP3EXRhkDhzNolw6k4eiHsgPkgnPW94eqMvZLU4TxAnOcHlKSlzYAr4vBMruOQKZGfpwaN2nLpjP1q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756452565; c=relaxed/simple;
	bh=LtKditM3783lUD+7tNNW2BewtV55GmdnezEjkTitfSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4fYWC/I0EyAzrYigEV2bvgtOqpUNyUbDk7xJ6g7JokdVduIDOly6cHhHlZmQq9lV3DpV5Vn1oaOXWE3drCzPpx9MLtoTcgdA48+V9UA/sS7ZbLHUGgHQ1ZS/S4HlxDDPrjcuLXJ0O3eGByCqtJ6FR6ogLEkjX56dXvre6uR5JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wh30pSn5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wh30pSn5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B62C4CEF0;
	Fri, 29 Aug 2025 07:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756452564;
	bh=LtKditM3783lUD+7tNNW2BewtV55GmdnezEjkTitfSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wh30pSn5K70IhV+mB/N1Tv62WkIIaKCQ86dgXkSAHitMHQypYgigdw7+CDg3/qEXd
	 KiblDZJMNjR3g06oWaYdF+duEAaBXESRbnWb+vxFm2YUgqoefhMEblPIUKRUEtBDmW
	 I33+bjcAydj2iuEdnatiS5+tJnMDRGxqaKaZpP/3OfszAb95rSZ/akQ9TUBoxnO1OM
	 lbXAA9yjGz6SbJ40Q/b110XKKK9RML1kG7Fxrt6/1pa270JpZYYfb2rLV1eOzvc60I
	 ac9/HV/c8ylqYo2VA/KdFythEqSZvYW/JwIUg5mVoMrJfp8XylEpZN6jNyibDXv2D4
	 MsrJ0fOkjx0VA==
Date: Fri, 29 Aug 2025 09:29:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: reset: add Tegra114 car header
Message-ID: <20250829-hot-spicy-puma-c9a9b3@kuoka>
References: <20250828054403.7112-1-clamor95@gmail.com>
 <20250828054403.7112-2-clamor95@gmail.com>
 <53b596e5-42da-418c-addf-d53fd12c528c@kernel.org>
 <1865189.3VsfAaAtOV@senjougahara>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1865189.3VsfAaAtOV@senjougahara>

On Thu, Aug 28, 2025 at 04:50:03PM +0900, Mikko Perttunen wrote:
> > > 
> > >  include/dt-bindings/reset/tegra114-car.h | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > >  create mode 100644 include/dt-bindings/reset/tegra114-car.h
> > > 
> > > diff --git a/include/dt-bindings/reset/tegra114-car.h
> > > b/include/dt-bindings/reset/tegra114-car.h new file mode 100644
> > > index 000000000000..d7908d810ddf
> > > --- /dev/null
> > > +++ b/include/dt-bindings/reset/tegra114-car.h
> > 
> > Still incorrectly named. Use full compatible, just like the other file
> > where we already switched to recommended format (see also writing bindings).
> > 
> > I asked for this at v1 and then reminded about unresolved comments at v3.
> > 
> 
> Ah, I guess you mean using 'nvidia,tegra114-car.h'? At least I hadn't realized 
> practice had changed to include the vendor prefix.

That practice is VERY old. For example first patches from my subsystem
are around 2015. It is true, though, that we ask for this since 3-4
years. In the upstream Linux kernel 3-4 years is also very long time,
though...

> 
> It can be said that 'tegra114-car.h' is also based on the compatible, so I 
> hadn't quite understood the original comment.

With that approach "tegra114.h" or "t.h" is also based on the compatible.

Best regards,
Krzysztof

