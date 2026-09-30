Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE663845DC;
	Wed, 30 Sep 2026 09:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760560; cv=none; b=qHvywGwkwUv0N7fPEFrNWdpXS8+Mei/iYmqFNVv3hZCSucgGZcLP3GMz1aw4pjUfPyP4asNxW+07P3XkyJImROQmcPkR4WZtDcydMgOAzsaM+0D+OwaZhG/PXwzD7SO39t3YslHwxbSyjc4cKrIRLe9ZzWOzSZPAyDZFnEUHOkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760560; c=relaxed/simple;
	bh=Fj2CGpbn18h2x9Ix9QU2iCE10XquvaqfV4WsW5n8CWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J74MkpOo2OEHMIeq+aJmfFgHyjf8K6w0pONTeTVIBUPY0Z2mYiKwo4/IfELNxx7FbLW8gSUi/y0x+KjGR+JVKRO9x2aXnLLjrB9HuLqQPMK4rh0fXg9QJHFSCCI8Ib2eTj+o/5Yn/Vj5Pqa/F57Z4sRCQAzQMhQOlJzoaQ2oNtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GpgMMVM9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GpgMMVM9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82CCC1F000FF;
	Wed, 30 Sep 2026 09:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790760559;
	bh=/I2j8EtervZUekqkoXeInY0fb0//oNYCQBLFthnmKww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GpgMMVM9zSyI7cseyP4ugRp0T06ijIk4rue1FO8ILmV97WBeoC6sOEJahhiN4PEH9
	 KWngsyLOunNALWj0Qqqr0xYCNpIA06Orymz3d1DdkVEXAovuvXy+X3sRuUZKq5W7E0
	 HR0pQVZeIVY7nscUBSHM9pUE0CMK8RLwjFf4iZ/MIU7HsYvET8DQzNbsFlIVktdcBZ
	 Ao/0qb7BKB9aHDoBp2j8a/f739LR1BxZCAMxO6yB//m4sVaBVLSxjY5O8TDvk7FBFS
	 HiKOtaVIdxul++gFC1tbEiuKBeLYZi+kJebEbAFksMZdapQU1cNZEU6elALisQBOn+
	 sylcFDHEX+XJQ==
Date: Wed, 30 Sep 2026 11:29:16 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Rosen Penev <rosenp@gmail.com>, linux-clk@vger.kernel.org, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be|_ptr)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH RESEND] clk: tegra: bmp: remove kcalloc
Message-ID: <arzWBhCQCCUBI95M@orome>
References: <20260929192437.27775-1-rosenp@gmail.com>
 <1jwls32msl.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wv6hlsxowlo3aj7c"
Content-Disposition: inline
In-Reply-To: <1jwls32msl.fsf@starbuckisacylon.baylibre.com>


--wv6hlsxowlo3aj7c
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RESEND] clk: tegra: bmp: remove kcalloc
MIME-Version: 1.0

On Wed, Sep 30, 2026 at 09:58:18AM +0200, Jerome Brunet wrote:
> On mar. 29 sept. 2026 at 12:24, Rosen Penev <rosenp@gmail.com> wrote:
>=20
> > Use a flexible array member to avoid allocating separately.
> >
> > Use __counted_by for extra runtime analysis.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/clk/tegra/clk-bpmp.c | 12 +++---------
> >  1 file changed, 3 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
> > index 067a8555c4e7..15b976162b59 100644
> > --- a/drivers/clk/tegra/clk-bpmp.c
> > +++ b/drivers/clk/tegra/clk-bpmp.c
> > @@ -32,7 +32,7 @@ struct tegra_bpmp_clk {
> >  	unsigned int id;
> > =20
> >  	unsigned int num_parents;
> > -	unsigned int *parents;
> > +	unsigned int parents[] __counted_by(num_parents);
> >  };
> > =20
> >  static inline struct tegra_bpmp_clk *to_tegra_bpmp_clk(struct clk_hw *=
hw)
> > @@ -518,20 +518,14 @@ tegra_bpmp_clk_register(struct tegra_bpmp *bpmp,
> >  	unsigned int i;
> >  	int err;
> > =20
> > -	clk =3D devm_kzalloc(bpmp->dev, sizeof(*clk), GFP_KERNEL);
> > +	clk =3D devm_kzalloc(bpmp->dev, struct_size(clk, parents, info->num_p=
arents), GFP_KERNEL);
> >  	if (!clk)
> >  		return ERR_PTR(-ENOMEM);
> > =20
> > +	clk->num_parents =3D info->num_parents;
> >  	clk->id =3D info->id;
> >  	clk->bpmp =3D bpmp;
> > =20
> > -	clk->parents =3D devm_kcalloc(bpmp->dev, info->num_parents,
> > -				    sizeof(*clk->parents), GFP_KERNEL);
> > -	if (!clk->parents)
> > -		return ERR_PTR(-ENOMEM);
> > -
> > -	clk->num_parents =3D info->num_parents;
> > -
>=20
> What is the benefit of doing this ? It looks like you are just trading
> one alloc for another here ?

I think the point is allocating the parents array as part of the main
allocation, so we end up with one allocation instead of two. This avoids
fragmentation and overhead and is possibly a little bit faster.

Seems fine to me.

Thierry

--wv6hlsxowlo3aj7c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmq81mwACgkQ3SOs138+
s6E3tQ//R14tkkjFYJZEQEQ5qTwdA1ZQSnxQ28D0oYUUvcyOkCUoUBq9KKQ0/P+9
0xqFSfaQC/porrzG78vdnj//AxyzEgt6CLXFPHm+m4uNWvH5yOPJ3aSavFY75zeb
iaX0kpvoaSxnMrmJAJJEixiOF1jBIaDUc5qSB4J1sO5m8E/QDeyPJRACF2Wvd2Mf
9Zfjdk62/UYkSSybAlwEQn6DUw/Ew3Bdeu5N33MrP9PuuU4feBKXjlVrqdbUHx87
TUshE5VIZMHfZrSq46Tx8oUBl/74UWqyTm01OBFbTKajWPtyWmBorZzU6bzhMbcG
FP/ZH9jIZQq9Hs/MiDFgj1/ThlAZy+E/FwcYaiUDvoiZdmBbPKp63Ul/DFr/2V+y
quHYHXkxLrhoFrOWuqXm0Wffn2SkXk2PfcvO5t9AoEvQzzIS86zsmzUw3DAyqQ31
3pu/ouKhxCav0mI+XNLiNQewlP1vXuoFHaTjIGtZms3kg5Ip06PjdipeXia7a124
eJoESshKBci4hsF55CKJiPtJ4TzT6TuRQoJr9hSfyHOf+18Ciq7JPz2Te8wN/2QE
rWWt00XUuDhrZTKYRVcfgGFEFY2j0KSGFj59uf0vEIZktBrplAAdLfx/9JPsusPW
pDwJkGs0/Sq5ajSQahBZHcFJEQmDA964dqs2Y11HclzKMrlp6fs=
=xOlJ
-----END PGP SIGNATURE-----

--wv6hlsxowlo3aj7c--
