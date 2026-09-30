Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3F03446AD;
	Wed, 30 Sep 2026 09:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760794; cv=none; b=nsEnUWDsfrkZ+/t2vNJmC8KcjRfIhyVaCfAzu6SozqPStbgWTlD33b92XYZGeL9V2nTofBmh0x8fh0Q0/szaUJQc5UzDx5Bb+87tTPlNfSRCnrZXHM33CwbwecKZZvSqwKR/l0pvMKitoEJc5mexs13CCPZzAMutGIh+r7OK/eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760794; c=relaxed/simple;
	bh=++83VYyqbhmU8CYzq5kEgMtBOUrzZfAC2enX+xTQJrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tI1Cs/CIQpJ3SyM7GEfITcMTb+6+91Wo9+ETg0Uy8kCU6yCZ+q8ohtDUiitlBcNVD+J84bcyuDf90ymDcHgiaZN/6rUrPPhh26LRzA1RyW5fPr7JB2O+X7U3qnTlvE4wgZDRrl0ESDtaIR/5T60t+D/2AXJh+1Pl1t8zYMHfASA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6csdVT8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6csdVT8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C3A1F000FF;
	Wed, 30 Sep 2026 09:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790760792;
	bh=TyAOLiYclFRaSf3Cgki6Y44w3Ju4NfOLQ3rWHygTULc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a6csdVT8IiEoquw638gCqhyJOw/yUksQTWSAYtyQTRNqjQgQ1syl/FpKY6lGKtj5C
	 Qrz3OWsPWe8etDy3E+rrJcWacWIfnw+jC+l7Swr0ozlJwbEfLVN0evKFVlX4fHkBS7
	 SSx0oj6tE86Hbn7U1GYSc2M/XWfri2XL8cDmQrXV/YNSI5PuXd69l68XinfAahsYnB
	 0fxeVv02AwvaCW3UU6YA9DKsfypBftM6+GlDv1Yq91x4fyK2rCyQUZLKvi32+Km+zm
	 rptO0PFtsPrzr6+ceg6cZDwMbzI2FFRfOE232KnRz/ijrT63Eci2AQUl9pFWvPrt7Q
	 cH0ucMrSCsFiA==
Date: Wed, 30 Sep 2026 11:33:09 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be|_ptr)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH RESEND] clk: tegra: bmp: remove kcalloc
Message-ID: <arzWdLVv5K9lJLz1@orome>
References: <20260929192437.27775-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7rdyansqwnzburdj"
Content-Disposition: inline
In-Reply-To: <20260929192437.27775-1-rosenp@gmail.com>


--7rdyansqwnzburdj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RESEND] clk: tegra: bmp: remove kcalloc
MIME-Version: 1.0

On Tue, Sep 29, 2026 at 12:24:37PM -0700, Rosen Penev wrote:
> Use a flexible array member to avoid allocating separately.
>=20
> Use __counted_by for extra runtime analysis.
>=20
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/clk/tegra/clk-bpmp.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
> index 067a8555c4e7..15b976162b59 100644
> --- a/drivers/clk/tegra/clk-bpmp.c
> +++ b/drivers/clk/tegra/clk-bpmp.c
> @@ -32,7 +32,7 @@ struct tegra_bpmp_clk {
>  	unsigned int id;
> =20
>  	unsigned int num_parents;
> -	unsigned int *parents;
> +	unsigned int parents[] __counted_by(num_parents);
>  };
> =20
>  static inline struct tegra_bpmp_clk *to_tegra_bpmp_clk(struct clk_hw *hw)
> @@ -518,20 +518,14 @@ tegra_bpmp_clk_register(struct tegra_bpmp *bpmp,
>  	unsigned int i;
>  	int err;
> =20
> -	clk =3D devm_kzalloc(bpmp->dev, sizeof(*clk), GFP_KERNEL);
> +	clk =3D devm_kzalloc(bpmp->dev, struct_size(clk, parents, info->num_par=
ents), GFP_KERNEL);

k{m,z}alloc_flex() exists for this, but there's no devm variant of
those, so I guess someone should add one. In the meantime, this is as
good as it's going to get for now:

Reviewed-by: Thierry Reding <treding@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>

--7rdyansqwnzburdj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmq811UACgkQ3SOs138+
s6E0Uw//QePGlyMrfxBV8t7Uki1EJdxsgDqOaIqAXnGcZKZgeQUue0JO8s1suVhI
N0jF02KMZhKzFerXy+Bh4F32wRKb+7KnNsvL4XQHOwRmi39mTd9a7GLdVgLx7hz6
MH6400teYt7vpemk23QOdQ1FmqvdI3wb5wLwtMg53l2RV2O9wQB8ilVVH3g0tK8y
/9fTvncQ1cgjdaGb1ZXFrQIX1dv2KmUjngtd1cQfm8RKEhLSIqWP7KZyb2LOHrwl
liKroCRNZ3G9a5OUENvIycd977F8rgOoMzqYAwFJ4VnYyU2SL2Jx6VNl2f4V/pwj
T7jrGGt6CbxcN3Qih5PAXQxeg6WKWOY1sKYwFfe6NSwtu0SSuX6Zh0RKnwpMPKEv
+EwoKoXpnvmk8nyb5opifEiMluSpEl/8YcdYhUXE/gkrEKo1eJxFZRZgTAzung3a
QKlCz8O6hZGXu2GskLmpnJFHQIhIlUrtjIn1RkVtdq6U7qqTw0p+Z1HX1Y6RF4qe
0g903LHAVZDpfBKKJfdnt3rw3qFVLYUYyqw6o2dQuszTDgaLxsifi/wr87LEBmx4
X2yZiteLUoPFn7TX1Wno0CrQbeP02FCMnUjv9VKo4DdgitdfVM5LenZ6ZJzCakfZ
H/wgi4MaYcOCKEec+6nUMJ4hlSeuqzLww2am7kAkRbXKE9gtnMk=
=omwH
-----END PGP SIGNATURE-----

--7rdyansqwnzburdj--
