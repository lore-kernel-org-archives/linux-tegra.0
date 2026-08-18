Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BC83C109A
	for <linux-tegra@vger.kernel.org>; Tue, 18 Aug 2026 10:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787050454; cv=none; b=mkvpZgymdMgxd9eXvy9mKSWwIftYZ09InKLXVI2Pgf0Uvp/ZsCa7WdEFjFLZPypi1ibOuOugmlHNF3hBnNYACvUTgw1cvrxqagCZdxEZaKdYiCfzGhet60N69Y96bZrhyECvRGzyoIBr1ZE887fm05V2nPdYEDbTNmiqeW5tl2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787050454; c=relaxed/simple;
	bh=uZZdQPF65dJE4d6+RcsD3HIDfUoagh7kQF/9/kSII7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekVg/y9s86K8agrVvmTxc5lOZraBc1EEXaEKLTvJzL4/OSfs4euuMdDJV9t6j0m6ZAsob7KTWh4eTlTgY0nEgACvgmsNdB1dDswyu2zw6651BYk534zDOVVzQ9879ip06gcxjAiaxNPlX2KgvGR7hs/rD24TwnFjH+eyrm0S5M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OR138jyW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OR138jyW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 874CD1F000E9;
	Tue, 18 Aug 2026 10:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787050453;
	bh=LfboI7ceOH14DAYV7+5wnc5ESkoQQzmvQfMyzbHNXRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OR138jyWL5OWUWhTn2XYfQJaVINDjmBy2kmnT11UHIqGz9p9ZBVIg6JqZSDT5Urv6
	 XRPf6Mstu/rXEtqBdW40Rg9neI1854ufN9NOZQN2usX6REm7leg4PRhZm/1FUEWpyl
	 2kE807nCTQKg6wn+etg25cIOcMcwWUMJc4jTcFHQdFyDVxEebq7Zhc+dGudjLQMfan
	 kM5OCgqlQTuWrd0ch8T/fhN/Uaewg6hv1WR+toOgIR0hSPnLz5nTOR+XtZgWqJxn3o
	 zV4YvANbAeVCHQumS83gleQEr6xAiUBAzsYrdjHLxQuJ5tWsCThaqcuJ7usg+1g1Um
	 50y/tCAcjcQYw==
Date: Tue, 18 Aug 2026 12:54:10 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Enable built-in RTC on Jetson AGX Thor
Message-ID: <aoQ4vGb2-FwwXss9@orome>
References: <20260817143205.287870-1-thierry.reding@kernel.org>
 <75f49105-f36a-48cb-877b-5ab96c8fcd90@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5xlgqk4oeaznhwzk"
Content-Disposition: inline
In-Reply-To: <75f49105-f36a-48cb-877b-5ab96c8fcd90@nvidia.com>


--5xlgqk4oeaznhwzk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: tegra: Enable built-in RTC on Jetson AGX Thor
MIME-Version: 1.0

On Mon, Aug 17, 2026 at 03:41:31PM +0100, Jon Hunter wrote:
>=20
> On 17/08/2026 15:32, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The built-in RTC is mostly useful for testing suspend/resume cycles.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >   arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi =
b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
> > index c4ba3322ed9a..113ecf297378 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
> > +++ b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
> > @@ -13,6 +13,12 @@ chosen {
> >   		stdout-path =3D "serial0:115200n8";
> >   	};
> > +	bus@0 {
> > +		rtc@c2c0000 {
> > +			status =3D "okay";
> > +		};
> > +	};
> > +
>=20
>=20
> Any reason we should not just enable in tegra264.dtsi by default? I see t=
hat
> we do that for tegra234.

This is more of a development type of option and not everybody may want
to have it enabled, especially since it's not always hooked up to do
anything useful. We commonly use it on the devkit for suspend/resume
testing, so it's useful there, but even then there's usually another RTC
on a PMIC or something that's considered the primary one.

So in production I suspect people may not want to enable the built-in
RTC. If we enabled it by default, then people would have to explicitly
disable it again.

I don't feel very strongly either way, and I could easily be swayed.

Thierry

--5xlgqk4oeaznhwzk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqEOdIACgkQ3SOs138+
s6Fr4w/+PLD0POiyV3a0Z2AcwWegT/paZCc1bnS2IH+KlxcOWJ2M8/R/unzMuELG
o/9XB4cOeesLcoiBDwCugit0qurUZOXu9Q9JiPexu3MMwsx4KuESwngoLM9rB1Yb
rHVDchoOLlVYltjEq1AN3i5LsqIKQm8s1BRZDHaLw6G3M36hl4URJisNTY5uXMri
QCh2t6jTpGDWryA8Gd9ELAomoJqCk39S+SSzwTGDohE7+35ddR4Un4cN/Qw5NcsC
jX8v2KFbQNHtmvq8Ah5tiehbCNkNgjiv6/aQRCIsuauz+F3w7P4fYg4mzBqbnQJP
0f5q63tqrgFmpup2H84xcT7XIUiS9C9T39Vz0yUnaIfte8VBeTeaF3Eg7RtthF1U
NOKETBnho6wMAemfr6jo+YUE238X5rZn34JGSpXZkGREoag2BauZcbfZr8oSiY/2
N/9HxMJC5xV+MpqHI+1xW2LMHLrmeBdX6J2NKTzpG61pmYiB2YDGoc1DFeXjWerg
A3FM0tJpS/OmLdc67Gja3HZ9igGrd8TfzO6J/iWg0zml4Ld5Cxjx/EaeoUo85CFe
r4MsEShSgpOtJh7A3UPJIokyQqiUOy8AAFbx1qgwwkixWrjMDWFOJ17W/acvCA9I
ja39FSiQdU5KVNFIrL2VucDuoWOFurGoqNK18Wd1bOodoN0/8hg=
=+2Vq
-----END PGP SIGNATURE-----

--5xlgqk4oeaznhwzk--
