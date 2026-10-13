Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BECC5372E6;
	Tue, 13 Oct 2026 18:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917531; cv=none; b=tdcWneeast7fY5/9XeBRhBpjpFhuNMLOchRZvHFeDtdQec3kiG7vAkvqS5ppUEuDAXfCV2G27+iIOOgYsfHlisEKON7lU0BpmlCmBPoRjbaEewHNODJgFT6sHZPwWaHzbtWWgnj6CEQ8XrzUB7LMcI8ZURbEUy7nMkyLu1VyGas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917531; c=relaxed/simple;
	bh=3smQrgUytn4kfnB0QfxdLN4LSuNpqnT7bMXk09kO9hc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0n+1Sd48hZXWUma0Liu7t8itq+/Aw4JXBo1OSzXVtWty/ptG0YcqCff4uhENNDe7EdV2S8utVp+Iw3Dq6fB6V2svQ8WfinQbhrBiy8Agte1/Ysat9x227g9gyLebGSEDLnUv4Ymmv9lnW4gmF+X6pcslyySYiC2HPh86/R5eCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i9gKZCUS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i9gKZCUS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B9831F00893;
	Tue, 13 Oct 2026 18:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791917529;
	bh=+h9kFlmnRZV0UsN/ctDySuUuRWqmLjjM5RirnDqI1+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i9gKZCUS/6JCBpBqE0JUis3tw+faUV5ezEpsAX/lzoWjJHXpl0mb+KolJE/yAl2dM
	 dIkNsb274UTVAUIe+TAm60tLR0aCFQ8IrHVcsphcIUjkT9fQrNRDB+JXs1axE0hbUY
	 Hxty+iIecxeD213hmbGQRWvDSqeNHVEe0VP5JLQ07EGuwOc18Xci0/lJhrXOc1fWHt
	 149Wa4SLbl08oejh3Z5x/22nRjycCI0qV2FAMT67v4exgFR3eyldW7tc6HDOCWZBZk
	 epAnKzk/T2llr58chCuhe6+0J6LLrxC7wpyZy+sV/D0DiltdRpoeGHONuxDnyHADHy
	 00p6wZEb85Wcw==
Date: Tue, 13 Oct 2026 19:52:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] ASoC: tegra: Support WM8994 by machine driver
Message-ID: <10dca96b-78b2-4f46-bf4f-de67d25c916e@sirena.org.uk>
References: <20261013183226.513658-1-clamor95@gmail.com>
 <20261013183226.513658-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ICdQdRo0QacQgGbU"
Content-Disposition: inline
In-Reply-To: <20261013183226.513658-3-clamor95@gmail.com>
X-Cookie: Some equipment shown is optional.


--ICdQdRo0QacQgGbU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 13, 2026 at 09:32:26PM +0300, Svyatoslav Ryhel wrote:
> Add Wolfson Microelectronics WM8994 codec support to the Tegra ASoC
> machine driver. The WM8994 codec is found on devices like LG Optimus 2X
> (P990/star) and Samsung Captivate Glide (SGH-i927).

> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * tegra_wm8994.c - Tegra machine ASoC driver for boards using WM8994 codec.

Please make the entire comment a C++ one so things look more
intentional.

> +static const struct snd_kcontrol_new tegra_wm8994_controls[] = {
> +	SOC_DAPM_PIN_SWITCH("Int Spk"),
> +	SOC_DAPM_PIN_SWITCH("Internal Mic 1"),
> +	SOC_DAPM_PIN_SWITCH("Internal Mic 2"),
> +	SOC_DAPM_PIN_SWITCH("Mic Jack"),
> +	SOC_DAPM_PIN_SWITCH("Line Out"),
> +	SOC_DAPM_PIN_SWITCH("FM Radio"),
> +};

There's no Line Out or FM Radio widgets, you should get errors during
probe.

--ICdQdRo0QacQgGbU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOfdMACgkQJNaLcl1U
h9ADFgf7BYpPR1FH2aNJcdT3+xYjeXJOuDbXh38wdXYQ0p/CF26jaE3KdNLWtUB5
ejQjllXbQ6vqDYS29MsjkiSrsV2Ks0/MiSrd7KRkB1ve3Xljgr3IG/gNr8mTBppT
nEfL9SsTR9XJuOmyIMjNtto1LuHwOeuBLWJCCsndPBEWd+lOYw7ZUvV58qvNf4rC
uxgSvAh6IsghGfUD8WkETMgEBuwbUTGxSqRbd0yHFd8Pz90NFdUQEzzES5QYBBtj
XYmuHUOPEB8/t9Vf8WF0a2Os3JB3jws0ssIJ2nHmbGw3ncMRatoEhf2nV7Z4Y2me
Osh4bFeX/o37RFKphgSMRYw+mJVA7A==
=WxNe
-----END PGP SIGNATURE-----

--ICdQdRo0QacQgGbU--
