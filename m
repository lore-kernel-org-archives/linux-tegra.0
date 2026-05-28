Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A29C25F7B9;
	Thu, 28 May 2026 20:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780000262; cv=none; b=jAFaZQq2Jk5jtzhGJ4kQhk3ahCfrnuRCc9MoQrbHGpp+BQlDlOCqgPIEsmIwt5YM+xQ32vACeaDcPD5qmvKY2XeRS6iTqK4z9ZGHht9KsqbJYH7QSwb9RTe9cY5aEAjeIT5m09eTF6+QH2Sr6i2DSJIsS7orEop0BGjHyprg02M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780000262; c=relaxed/simple;
	bh=baN/gQ5kMhaYCEMxt16MhmYMhRbXpcqfmDoNz60jdTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+MqXDWrmuX6RvdF7U0mbDE2OtAEVLcRiCm9jV0fEEkIz+dSyak1OJv0bzOC3AcCKIeHDu3HFg/xptTZddTDSkd1LgfH7cmGYJnZqdMm1gOspPEbRhJ3oHRDELwc0u78+4kYoGn/08vicVCkjXzQJg5xErVm9y9gyJt2v/zIZno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oOhSznbW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oOhSznbW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF781F00A3A;
	Thu, 28 May 2026 20:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780000260;
	bh=OhLC/Jazla24oSnIpoVcFuWnwqT2KC47D4jCqw8JiZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oOhSznbWInNSbtmZho+mBl+LqpwKTS9dX16PBoKxQwLYczD9qyvDEhUB7uEaXxr3R
	 X1uvjmlmD8RkZIO+wUlbPBZRcII33TZC29xm1g0CWSscho7nHJRacOFoBsD54O9IOW
	 +eAjTz7sCURc1mmR4YZlWcW/FkB/1JHngGZZQY1On/G8XtCWa0RLjV/RB/RR877OLl
	 c+ldaK3R4InqwtJBT5xoSM0wsY7FJG92QyzUhz9HCdr59CT5EHL4V2kSz8aUhUelmT
	 Gjb2YPhjNDprUAI1z4JfIswGBPKLBUMMMyte1RBiTYDhyE53VJ1wBJJv3E+cfoahBe
	 JiGFTP6bjGP0A==
Date: Thu, 28 May 2026 22:30:57 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: tegra: tegra124-emc: fix krealloc() memory leak
Message-ID: <ahilgKKwkttOd9H6@orome>
References: <20260526061321.6123-1-grandmaster@al2klimov.de>
 <20260526061321.6123-2-grandmaster@al2klimov.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pcpj6xwgqxj7hhkp"
Content-Disposition: inline
In-Reply-To: <20260526061321.6123-2-grandmaster@al2klimov.de>


--pcpj6xwgqxj7hhkp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: tegra: tegra124-emc: fix krealloc() memory leak
MIME-Version: 1.0

On Tue, May 26, 2026 at 08:13:13AM +0200, Alexander A. Klimov wrote:
> Don't just overwrite the original pointer passed to krealloc()
> with its return value without checking latter:
>=20
>     MEM =3D krealloc(MEM, SZ, GFP);
>=20
> If krealloc() returns NULL, that erases the pointer
> to the still allocated memory, hence leaks this memory.
> Instead, use a temporary variable, check it's not NULL
> and only then assign it to the original pointer:
>=20
>     TMP =3D krealloc(MEM, SZ, GFP);
>     if (!TMP) return;
>     MEM =3D TMP;
>=20
> Fixes: 888ca40e2843 ("clk: tegra: emc: Support multiple RAM codes")
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  drivers/clk/tegra/clk-tegra124-emc.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/clk/tegra/clk-tegra124-emc.c b/drivers/clk/tegra/clk=
-tegra124-emc.c
> index f3b2c96fdcfc..8053fbbb06c8 100644
> --- a/drivers/clk/tegra/clk-tegra124-emc.c
> +++ b/drivers/clk/tegra/clk-tegra124-emc.c
> @@ -446,14 +446,13 @@ static int load_timings_from_dt(struct tegra_clk_em=
c *tegra,
>  	struct emc_timing *timings_ptr;
>  	int child_count =3D of_get_child_count(node);
>  	int i =3D 0, err;
> -	size_t size;
> +	size_t size =3D (tegra->num_timings + child_count) * sizeof(struct emc_=
timing);
> +	void *mem =3D krealloc(tegra->timings, size, GFP_KERNEL);
> =20
> -	size =3D (tegra->num_timings + child_count) * sizeof(struct emc_timing);

This looks really wild now. I think it'd be better to follow the
original style:

	size_t size;
	void *mem;

	size =3D ...;

	mem =3D krealloc(...);
	if (!mem)
		...

With that:

Acked-by: Thierry Reding <treding@nvidia.com>

--pcpj6xwgqxj7hhkp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoYpgEACgkQ3SOs138+
s6FCqBAAt+lZiTklIONKtyT3uf0zMVLqFBKgdmw3nN82gJEjEQ40UiQ7xxLzbtr4
klkQz4YbtuJ0koVQa5EM0wkN43dlwx+pk7RJekZUEhOHuuotBSe+q7e2Q9pFIGLh
n2B3peybeuKAXfOMKKlZ9xwnw4EEAT3x6x+j1sYvBQsqNAyaUVgVC/xuoh7qkOju
eqPwOL38wBkZsh0ORXxQ0BhG3BwKgUBlL+jva9bzKlcPgvKQe2VdG77yIKvs2G9j
+gslm8vrQJc+ptoVWZVJ57VZeGxWWm0yEYpCkfrpmlwOSnuMxuFokiobql360DwD
DehTlxbql0NApXWStHvsFyWVg65WVOGpnqX89fzNmDDM/6eUP7Jf9mGmPMl3Dkeb
wFFwalzcdlvneD8ZUuwd+fRIkY1Z0TItUoyCf44xlAZQdpkiNomCtxZFQYArsUoq
1pcYgzhRfTQlz4iDfKPWHaZWHyBNX9hmarIedtQlUvT+S7xE8dcieNZT1d8p24oF
fwanXPD4SNC4L/oLfBPGJRYjA0MTHet+hfanL83iGlCi4RwhIPbQR+5BxGj5CmNa
KBqS/BrDWOK8i6mntYoUKZ2v8/37hFbebKAStWBtLGpiBW8gpb/XVn2MW7ShKEOv
yxS9Oybjr5u0NyAd+Q0reUtG99yTq8noxoqo27sLwWEbCz/5DyM=
=UhiE
-----END PGP SIGNATURE-----

--pcpj6xwgqxj7hhkp--
