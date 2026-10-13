Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF064A3D43;
	Tue, 13 Oct 2026 19:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791918265; cv=none; b=BgQSArY0UEG3d/kRJG29B7vwogTRYc7ugvcGwnSBV5/WV9v2uwrPIzS6AMoN0pQEjIHWlvKAm86YG9UrNbso9v8eG/rwdqOFUgVD9nPm86aGI25UmWSedq9R4VEAEPYFAMn+vpCNHnO+PzUUeUkeNgyfNH1DvZ7+2IUcWNYqK0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791918265; c=relaxed/simple;
	bh=cTxNr4xfjqJgOFIG9ahZ40rYWkhWSjClsp5PwIgJflw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eGy7P27OnDrRN4HYGyaDW+xGmch4hcvHJhluJnStb3bauOzjavfEU37U440GjMpJA31EbDXiXzCGnhnKLaXnCVoe+OQu4QWNaQOEJx3+tg2uwAUH40IWVV8bgJvjKrtkAuBWfBDFcsNi22APHb5F0u3xcn6cmUFt4ZiFhzPZwm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlp383na; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlp383na"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1049B1F000FF;
	Tue, 13 Oct 2026 19:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791918263;
	bh=w/kXg3M61QuhNT5IH4t/l9rWeIDMAMlBcA0ppHgFPnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dlp383naVdNhtfXfMDDJ1w+8ZzqyqkBDJR3iQu+JIEJFmB5fXfOfI8sw3qNCnYUvh
	 Ls93TKsuEtpyBpav8OlLKWO0k5D72L7rBTdPMbXXbCeA3lH8mDBM21cfosobUq0leI
	 Kr6keryEkLRAfMlI2jvDpEwnSTem79z32PTanEjHf573cNKzbTWdvEDemy/yN6ElD8
	 Y0YFu7+0W/6KagACQYJgDuH4im46rQA9j+wiTVpYnywjwA/vT3DsDEO68Kse4DzKP7
	 ncrogn4UNsEFfx3BZ18dSrrUhRAO5r4oUugMQQ+KFREtck8h6ulGNJHsI5/j6akzH2
	 BT50XFFHSGKeQ==
Date: Tue, 13 Oct 2026 20:04:18 +0100
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
Message-ID: <86a4957f-cb8f-4126-83a4-d525ef7b1dd6@sirena.org.uk>
References: <20261013183226.513658-1-clamor95@gmail.com>
 <20261013183226.513658-3-clamor95@gmail.com>
 <10dca96b-78b2-4f46-bf4f-de67d25c916e@sirena.org.uk>
 <CAPVz0n0X58xfwhQo=V_5UQBc_cLfG8CqFPuoG4FqN9MM8MFisw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a+cai7dNIF4WhxoN"
Content-Disposition: inline
In-Reply-To: <CAPVz0n0X58xfwhQo=V_5UQBc_cLfG8CqFPuoG4FqN9MM8MFisw@mail.gmail.com>
X-Cookie: Some equipment shown is optional.


--a+cai7dNIF4WhxoN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 09:56:03PM +0300, Svyatoslav Ryhel wrote:
> =D0=B2=D1=82, 13 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 21=
:52 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:

> > > +     SOC_DAPM_PIN_SWITCH("Mic Jack"),
> > > +     SOC_DAPM_PIN_SWITCH("Line Out"),
> > > +     SOC_DAPM_PIN_SWITCH("FM Radio"),
> > > +};

> > There's no Line Out or FM Radio widgets, you should get errors during
> > probe.

> These codec targets. LINEOUT(1P/1N/2P/2N) to Line Out and IN1LP/RP are
> used by LG Optimus 2X P990 (star) for FM Radio.

Those are reasons why someone might want to create Line Out or FM Radio
for a system, but the fact remains that the machine driver uses those
widgets without creating them.

--a+cai7dNIF4WhxoN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOgLEACgkQJNaLcl1U
h9DO8gf+JdnUAY1QTDa39Bhg0Lf4BJ9iNAi82hk/JKpUAbj+Ocg8jXTNIeLmG3gu
dd78iJTP7GnL8YHch41DJGHYkKwZQ9bJNF5n423Wf1c9vwBPlZp5I2lVf2boXaQN
kDrKC3xVUdIJ7/qwcT7ZFDYGetCnz+NL+yWKa2Wmitj4ItKsZK6l6VtUlmgy03aQ
XaXymidSkgtVx3pLBeKuaVeQZxv6/UTEAyi/tM8Mfu7hNYIsjY3JasFtxtLdG1DU
KCa/h8prfmbpGiMvpuVjb5HqfcuKaZ7KtL8kE/43u33NZkey4S7eRezyrNgwRxdX
lGuPjJkyhQWL7gsrvOEtkerKLgd+kw==
=0ynn
-----END PGP SIGNATURE-----

--a+cai7dNIF4WhxoN--
