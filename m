Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA234B8298;
	Wed, 14 Oct 2026 11:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978586; cv=none; b=R5mPmHFduz3TeOkkLfV53xJxTXOGIw6dCUKqZq42hGXQHizd0tEJbSUA4nerBF8N0oubm7wF2/0DkERaDJ6heECXXg37pIbRHCHTnEfsrWPGIELmUf8oJLjyJ5/qj50rH5s+NlQpc9kNzADKm/lNPcMGjAxF+knBIAIwuS34g+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978586; c=relaxed/simple;
	bh=hGb7b/5SXxlz683vgCL3vE66j2izRt0r+y3lcstocew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SEwfj38Lv38rHvZZbVXsEbkZXw4EEWC8CSY5E7q/hYUTv6zM6QhU5V9w57hi+B8V5P2mqrZirJrj68UtBEmr150rPAKjAYy/AhUcSK0K6OccIOmY+h2jkNPcdEtqQ5CHy2berxrK4rlc7+kzzMBMvlGR9AAsNdSZXjUUd441Zj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0MoJte8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0MoJte8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0561F000FF;
	Wed, 14 Oct 2026 11:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791978579;
	bh=hGb7b/5SXxlz683vgCL3vE66j2izRt0r+y3lcstocew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y0MoJte8CFCWQ5Z/wI+32Sn3LK8yQzrOXCr9LuaNKLjfPfhK63GMnFi6+BuoQeRyd
	 DOn9y6IeCHpuzSXZJr+9c7O6I32hGzSzGUJpK2W3iYnY+cbApBE5rtDz4czypHgJQN
	 3rylwfhhduzT53BpD8iGM4kPVR5471tptQcUJD00JQwB6V4NyCj7V3jBzIGPSeaSOI
	 4nf1FX7zBh6BWgFoKtVO4QoEGXSVvV2V+/e7EbzbfoBMOflMpQ8DaPZdY8txdSBh3X
	 2p8ywTKyw8uksme4VJMQa5SacVsEYAhpHGINNg78HE3/fCDO82TuKd02ilzSPGne37
	 8s2AQxRTKtzHQ==
Date: Wed, 14 Oct 2026 12:49:34 +0100
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
Message-ID: <22fd0ef9-2995-498e-a212-c07a01172dcc@sirena.org.uk>
References: <20261013183226.513658-1-clamor95@gmail.com>
 <20261013183226.513658-3-clamor95@gmail.com>
 <10dca96b-78b2-4f46-bf4f-de67d25c916e@sirena.org.uk>
 <CAPVz0n0X58xfwhQo=V_5UQBc_cLfG8CqFPuoG4FqN9MM8MFisw@mail.gmail.com>
 <86a4957f-cb8f-4126-83a4-d525ef7b1dd6@sirena.org.uk>
 <CAPVz0n2L_4ik6nS_eQY-tQqtdLqgHofumZUU7wJjzbLGVft8kQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hnn4yMXF7KGTHvw7"
Content-Disposition: inline
In-Reply-To: <CAPVz0n2L_4ik6nS_eQY-tQqtdLqgHofumZUU7wJjzbLGVft8kQ@mail.gmail.com>
X-Cookie: Live free or die.


--hnn4yMXF7KGTHvw7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 12:00:31PM +0300, Svyatoslav Ryhel wrote:
> =D0=B2=D1=82, 13 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 22=
:04 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:

> > On Tue, Oct 13, 2026 at 09:56:03PM +0300, Svyatoslav Ryhel wrote:
> > > =D0=B2=D1=82, 13 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=
=BE 21:52 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:

> > Please make the entire comment a C++ one so things look more intentiona=
l.

> May you please be more specific how the title comment should look?
> Just to be sure we are on the same page here.

C++ comments are ones that start with //

> Ohh, you are right. There is a missing asoc_machine fragment that adds

> SND_SOC_DAPM_LINE("Line Out", NULL),
> SND_SOC_DAPM_INPUT("FM Radio"),

> If these are all required changes and you are ok with picking this
> patch, may I reload it without delays?

Yes.

--hnn4yMXF7KGTHvw7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrPbE0ACgkQJNaLcl1U
h9A4/Qf/fSNG54QWI8X3hWalEQr7JxIBPf25tMg2w6dnBEhnzDMWZmmML497/E1Q
dpYgCWVADwHMKhog0L0s3mLpGbv4XR+O0VLMEtP4KpN0i7d3nUFR3eJT4qruXmju
3C2tSzhH/U4Vpye1d1lNjbDfvItNjSQxUscdVKEy6PCcX+ANIs3ZEgq+YyF5n2l3
2Bo9ZpG7CC87K50aeEteaUAtxCVUE58q6Xc4dsio894P6X5PoEdLH0eee32s+Civ
iR7q3hVOVJZO1xWuy0B8ltm1/YxRr5Rfv3y/acRZHLaAF43J2qH1MwSnNhJNnmSX
P+j0VSQ8DDYVcrkRSzRTUblRA8PX5Q==
=JrMG
-----END PGP SIGNATURE-----

--hnn4yMXF7KGTHvw7--
