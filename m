Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252E7434983;
	Fri, 11 Sep 2026 10:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122754; cv=none; b=TwtZ3u8EVVATjzfNPX1eqEyFBANrdKS0F2rOpgsHdvJzyAldW9uqiIG3IatU83HULpgqzgrxzXkSUtnwoUBwIGhHCv3FRBqp5Wwi/ScxP755RPHbu6xXOeWMBqD/Dbjncs46fElyxGTw96QoEQGrLuUCNpkH5Bn2qLnjZG90H0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122754; c=relaxed/simple;
	bh=fYi9FhVpfZvClDeGGuC5tm1+LiB694kKocQDUJili6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u+bjMy6es6AeXTHGcjxiGKGMUE7SqazHJAD5mliwm7FVb4PjRA1BdHf1IUsev6Gzu9EskTAMDAytKBmmohfuTbi5nf2EqGaRouFEjbAcBf6TSeLv4zaHCuWyRsZ9CZlER8B+/5g+Y2ccau6/36iE/k5wEZuNuzUUkkMwwGaVB1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hUgfb/EW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hUgfb/EW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EB081F000FF;
	Fri, 11 Sep 2026 10:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789122750;
	bh=sHkwCx+X8PY/ghJUBF25VRnJNYbNjRdZUgWWM+k8AEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hUgfb/EWBnGlb7RlYOENZ2pXvcXCXYgDvn+wJkmaK/w7Fk+XozbDh6rmt0/3R/mcZ
	 wq9LYipdsr3zId6f7o+a4+BikpaBZapkEY+ODCHMUqhtx6yhZqwc00npYnspHdbf33
	 XdX7CvZlvu1ULcJwhM/rI1324A3f7aZ3kSML0Ru2GTM948YClJ00a/X+TxjilZpkMA
	 dlqEP70v3crNWXtxM6LohZR5yFchwd6Eh3Gke6qpUVB+IJ0lzdvwAt8BytzhJUrPN9
	 tCE7PQ7Ri5UybjHK8OeE1/ixFG96hMhGGzftuXSS6fbSTSxvVg/wA/hamH7M20yBmd
	 FDbeFkSleSH8A==
Date: Fri, 11 Sep 2026 12:32:27 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Charan Pedumuru <charan.pedumuru@gmail.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 7/8] arm64: tegra: Clean up AHUB on Tegra264
Message-ID: <aqPYjLrf8h8RVXKI@orome>
References: <20260902-tegra-ahub-dt-cleanup-v1-0-028f3c5e72f6@nvidia.com>
 <20260902-tegra-ahub-dt-cleanup-v1-7-028f3c5e72f6@nvidia.com>
 <c9ad15c1-10c0-4111-a143-baf72fccf1f2@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m5jca5lq2775jgcj"
Content-Disposition: inline
In-Reply-To: <c9ad15c1-10c0-4111-a143-baf72fccf1f2@nvidia.com>


--m5jca5lq2775jgcj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 7/8] arm64: tegra: Clean up AHUB on Tegra264
MIME-Version: 1.0

On Thu, Sep 10, 2026 at 05:36:41PM +0100, Jon Hunter wrote:
>=20
>=20
> On 02/09/2026 11:17, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Use #address-cells =3D <1> and #size-cells =3D <1> because we don't need
> > 64-bit register addressing for this hardware. While at it, also adjust
> > the ranges property to encompass the entire AHUB range as per the TRM.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >   arch/arm64/boot/dts/nvidia/tegra264.dtsi | 118 +++++++++++++++-------=
---------
> >   1 file changed, 59 insertions(+), 59 deletions(-)
> >=20
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot=
/dts/nvidia/tegra264.dtsi
> > index 6b2e3a6ab810..4ed7dabafee5 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> > +++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> > @@ -129,13 +129,13 @@ aconnect@9000000 {
> >   			power-domains =3D <&bpmp TEGRA264_POWER_DOMAIN_AUD>;
> >   			status =3D "disabled";
>=20
> ...
>=20
> >   					ports {
> > @@ -1584,7 +1584,7 @@ sfc1_cif_out: endpoint {
> >   				tegra_sfc2: sfc@9710000 {
> >   					compatible =3D "nvidia,tegra264-sfc",
> >   							"nvidia,tegra210-sfc";
> > -					reg =3D <0x0 0x9710000 0x0 0x10000>;
> > +					reg =3D <0x9710000 x0 0x10000>;
>=20
>=20
> Looks like a typo crept in here 'x0' which is what kernelci is
> complaining about [0].

Ugh... I had fixed this up in a local branch but then applied the
patches from the list instead... fixed now.

Thierry

--m5jca5lq2775jgcj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqj2LsACgkQ3SOs138+
s6HPORAAkG+TuoUnEnlBWaqoulNF0A8E/zyH2p6PyuTzoJ7Kiu01zEJ1mDdUoY9S
dYIk/qK0W6FLt/fH8Oh1DPx63ifnq6uFt920I2IWeTomWZOFZaHCMvje3o2yeZWn
9adP4SLIwVS7XtkmKeEC9Fko0mWujCMZLj1qV87AkGAB+qA2BXxKDfxJyr7j+xgc
r5jKFXWzLZJgSrtiGQZCp4eJhyOChSUlJSnq8R3YFwAlYXHWBg5SqSCohzDbUdpO
W9bVwu1pVQdo9SMm9HcoQq8JJDVWNMVjWBhbTSqZPoTLeobAhuPx3tf3vH2h4V9x
kuy62DaZZG3G/VbHO4+eG622YQPv3KaNZW18LHnPcFO6tju0RFsAIsph8bdQy0lU
rpHXp1AoffyNl07LItGW9b5SmJI4dt2n9xBQSgJhPdnHhoekR1Up+hkMJUTiEfNb
I6jLRh8Rnyhr5KFaELmWJwel1kLKy7ChP4Lghkri79vGy3TeR7gMjefQp39tWyco
Mq6joShAr1yi1MjmX+LYSRvPxki3HgoiIAG0sRPGobsUZ3jUGI2UobabqpZ/Vyfj
PUYN6k4z92FwejjjXj2xOJC40plLT1e4UfbGzDCQJn1p+aFbt968a2jNR/BuC9ZF
enjT9Yd/N3/nHC0UvvGuMBlmKLM6K/syDpBef/jSplORr4SJNv0=
=rA0U
-----END PGP SIGNATURE-----

--m5jca5lq2775jgcj--
