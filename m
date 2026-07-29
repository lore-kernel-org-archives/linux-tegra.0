Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F144446EB;
	Wed, 29 Jul 2026 10:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785320867; cv=none; b=DcB7SsnszrpwPp43dFME6t1KbLlAaWJnpIzoycUXX7x1IFvI4L4s44PqzOh0gDtvbuiuxIx3T9+yvcJ66j0Fe/Vh+FT6hm4We7fmN1VQpEaptJEccM2qPAojsP/Oa1fTmX69TnjjkO5UWfJeBuuFlKz5V96y6IKz1eZ8B6TOaSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785320867; c=relaxed/simple;
	bh=IFwbmpaBWgx3/Z+usHGQWI71GBK7xWsAfU+Gh7u93bM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXgjySYhENVpPvk2H97G2ki3A3cki9gH/Hn4vctqdslUCBT5O0/Mv8LLhp44enrAI7R5n5Itix1gvbF2C8i6gIReJU2RzURzbBBGATJZ5r/hV9qSqTYSbHu+6ZZaVJCpe6theiYIMGdMqZ5wGLx5rrbRJQCt9pj44B9LpSe1jwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ndf2VBbL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ndf2VBbL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73E6D1F00A3A;
	Wed, 29 Jul 2026 10:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785320866;
	bh=/NnXMilF8bYMzUCWafQ0bQAmK3Cz3HJiQa8aQZ0c5GM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ndf2VBbLZXhocSv5uP1D+Wn/PC9iDOQoymvqqdjDRMIh+BSPsXAUYT6s81fBJnwFV
	 CHw+cpakgoOSge035aNcJ8ewTz7ZGLRR5EbNurkjNPFqcwQYILblXBVqqyerQJJBta
	 lUlDG1TRaxbepfL4Ttuv+wMwU4dsvPpkWA5Y1b6ZZAB8+amBrvKRJ+M36viyU3nzlm
	 dLeiJb0q0NG/EB52FRvSzbTWnTsoRN2jnI3p1GM54oGbx8O3mzRsrvb0w1edamsUZT
	 8P6Tg+NBaqpWRVVoi4HOqywf8zYuH7ELAvBMgw/qd8u2OF+G0C1Cp1jknFSxwHy8OM
	 6l+S9jR+oK6/Q==
Date: Wed, 29 Jul 2026 12:27:43 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/10] ARM: tegra: tf701t: Fix BCM43341 WiFi/BT chip
 configuration
Message-ID: <amnVVwVoZ7NnclWQ@orome>
References: <20260721101059.451699-1-clamor95@gmail.com>
 <20260721101059.451699-8-clamor95@gmail.com>
 <AHCWpU8lS5mcA3Do5U45Xw@nvidia.com>
 <CAPVz0n2AOJ_rcsCEhVQWUq1fXtd7kXkE9yScY1VwGyZefz50Uw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ga5mcv6lvh6lhfun"
Content-Disposition: inline
In-Reply-To: <CAPVz0n2AOJ_rcsCEhVQWUq1fXtd7kXkE9yScY1VwGyZefz50Uw@mail.gmail.com>


--ga5mcv6lvh6lhfun
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 07/10] ARM: tegra: tf701t: Fix BCM43341 WiFi/BT chip
 configuration
MIME-Version: 1.0

On Tue, Jul 28, 2026 at 05:08:40PM +0300, Svyatoslav Ryhel wrote:
> =D0=B2=D1=82, 28 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 15:13 Mi=
kko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Tuesday, July 21, 2026 7:10=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > Drop reset GPIO from bluetooth part. Add lpo clock to both WiFi and
> > > bluetooth nodes. Add 'brcm,bcm43340-fmac' as primary compatible and
> > > 'brcm,bcm4329-fmac' remains as fallback.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 13 ++++++++-----
> > >  1 file changed, 8 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch=
/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> > > index 3de5c84d5f009..b71a02b3fd86f 100644
> > > --- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> > > +++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> > > @@ -1300,8 +1300,9 @@ bluetooth {
> > >                       compatible =3D "brcm,bcm4334-bt";
> > >                       max-speed =3D <4000000>;
> > >
> > > -                     clocks =3D <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
> > > -                     clock-names =3D "txco";
> > > +                     clocks =3D <&tegra_pmc TEGRA_PMC_CLK_BLINK>,
> > > +                              <&palmas_clk32k>;
> > > +                     clock-names =3D "txco", "lpo";
> > >
> > >                       interrupt-parent =3D <&gpio>;
> > >                       interrupts =3D <TEGRA_GPIO(U, 6) IRQ_TYPE_EDGE_=
RISING>;
> > > @@ -1309,7 +1310,6 @@ bluetooth {
> > >
> > >                       device-wakeup-gpios =3D <&gpio TEGRA_GPIO(EE, 1=
) GPIO_ACTIVE_HIGH>;
> > >                       shutdown-gpios =3D <&gpio TEGRA_GPIO(Q, 7) GPIO=
_ACTIVE_HIGH>;
> > > -                     reset-gpios =3D <&gpio TEGRA_GPIO(Q, 6) GPIO_AC=
TIVE_LOW>;
> >
> > I'd appreciate a note in the commit message on why this is dropped.
> >
>=20
> It does not comply schema for "brcm,bcm4334-bt", further testing with
> this reset gpio removed confirmed that it has nothing to do with
> bluetooth and bluetooth works just fine without it.

Maybe this should be a separate patch to make it obvious that this fixes
a DTB validation issue. At the very least the commit message should say
that this drop the reset GPIO because it's not part of the binding.

Thierry

--ga5mcv6lvh6lhfun
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpp1ZsACgkQ3SOs138+
s6H/jA/6A+LhbnWqfz2ebRYs1q/s2nfQ/3ghGoZQX7QJhicTGDD7RWAHV/uyIWja
QorCQRdZ1vQy/tiex78wleEwh5Rw8Dk5S6UZAerpKs9Lbg8z7HTECVDlB8P+hFaN
+Bp4vek4GYqQh+9PlJXBgzCroWBhcXDaq1NxkGGVaE3DMpi8L1B+dhzTa0EDNash
RhQkj6pHl631ZuENEX6E0lA5tnEFo/YjxWiIDOmb6Av0iH7xl7bJlEw+66eC9Sth
sfMcnoJnnsDbM+UO2iCO7xaqzDur6jmg+xdvXDTFtn3Gpk2hDuUpm+lRK3Xy8War
Zf6fzomo+WJ/w9Y9p0sZ3TmFs8wRUNzHs6olgoB1p3uFoDZlIDJZLxKIixUcsd1U
Uqqjj0/btfqknKh+jS35Sl/zBZd+adBR86kGIl2ZXYQEt3z5WWcE7787eSK8Evhf
WEBPyZZDXN2tiJsMwvQp+MW4R9AVLbCFWIRL7F3m8uidwNuXxcAVFWyzdmzx78y0
bhdt5iGh2mEuhPL3Jsj8SEfEFGQ46A/Cwd0iArqEBs2ULN5LAZioKP8hdqYqeTTQ
SiZ8wb8mGYyA4eC4ZLRUz03Rk7r79K4hCoL8xxTOE8dCFXuTxWS2ir/klE+zIYpm
X6PcnID08YGflsfur4aRubbhV0y5Js4mfqdq7tnHmtLvuPxfnyk=
=e4Xt
-----END PGP SIGNATURE-----

--ga5mcv6lvh6lhfun--
