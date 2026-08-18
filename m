Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0D9451071;
	Tue, 18 Aug 2026 11:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787051103; cv=none; b=OYG4BL/ckgGE59nNRlEmWWEzXdg5xdQefTtOritRGirlcaJyGexq1Y6FstYM2iOszojKwWfyyXxbrpc/0TLTNyI6mCZWBUkBw1dm2JfTxnWt9/FLstoRLTDjQipFj7ZVe1wYrJjTfE+6zRX0E7P7luu3ERk9X4782Oh+ivmF6yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787051103; c=relaxed/simple;
	bh=pARVkTyh7ve822c2/feb5MO/RMBFhnJekTNWRZDuM6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JeJ7At1KBSGUTRc2w04e/R3SMGXOU1RfJYc0C9VELnGgblt+hcwPJiMESO+XHbVZLgm4dUSp54NEkdBqX6dk8j7MNp9OGZqe8OlFL37/uxtYM5/jOZsBVEH5kUsU4l9f3MJ+O5ROWxQFOINBngIji/KjvnmBD+QGjIcZjFI/3vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XCpFhUGY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCpFhUGY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227431F000E9;
	Tue, 18 Aug 2026 11:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787051101;
	bh=3rblyBJ5A6FAan1g3OTvn6LNl4ZMyzCjnjvlZSePT4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XCpFhUGYoAXdRorTh9f0LgqwzRtIBwTbhQ4seEldY4FfQDCGOuBPJj4Iu8O02G4Er
	 hfBdu+ZzUO2PuTxEuPTWFIvlPjCwQsFD1FNJWzN2OZAoHmFKs/I5ZYywhrGt/wHXbD
	 lXfWHMCHL9nHkgZbz7f3BdYLb+qyBtQmyVf1KgUbFrQOdGQu02E/Kr9uAfQ2BT/Scd
	 gJY/At/HxZbbN9ubDFpnr5nFe/MHzy5B1xJxvGq8pDhCjgsXa4bCPRY+brKfeNUFMt
	 XTse6Bb4EjqTK59SsgFz8DXLVk8xjy7TcQPM1XHnElQ1OtVJSc7p7ypVwCVCndfJ5T
	 a3zr+9Ypu0mTQ==
Date: Tue, 18 Aug 2026 13:04:59 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: tegra: ADX: convert map to flexible array
Message-ID: <aoQ7SynywUKcIAaS@orome>
References: <20260814205018.39015-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dknf7gob7xggqd3f"
Content-Disposition: inline
In-Reply-To: <20260814205018.39015-1-rosenp@gmail.com>


--dknf7gob7xggqd3f
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ASoC: tegra: ADX: convert map to flexible array
MIME-Version: 1.0

On Fri, Aug 14, 2026 at 01:50:18PM -0700, Rosen Penev wrote:
> Replace the pointer-based map allocation with a flexible array
> member and use struct_size() for allocation. This simplifies
> the code and avoid an extra allocation.
>=20
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  sound/soc/tegra/tegra210_adx.c | 12 ++++--------
>  sound/soc/tegra/tegra210_adx.h |  2 +-
>  2 files changed, 5 insertions(+), 9 deletions(-)
>=20
> diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_ad=
x.c
> index 9175598b52a7..d607ba4233b6 100644
> --- a/sound/soc/tegra/tegra210_adx.c
> +++ b/sound/soc/tegra/tegra210_adx.c
> @@ -677,11 +677,13 @@ static int tegra210_adx_platform_probe(struct platf=
orm_device *pdev)
>  	void __iomem *regs;
>  	int err, i;
> =20
> -	adx =3D devm_kzalloc(dev, sizeof(*adx), GFP_KERNEL);
> +	soc_data =3D of_device_get_match_data(dev);
> +	adx =3D devm_kzalloc(dev,
> +			   struct_size(adx, map, soc_data->ram_depth * TEGRA_ADX_SLOTS_PER_WO=
RD),
> +			   GFP_KERNEL);

This is slightly hideous. Maybe add a temporary "count" variable for
readability?

Either way, though, this looks correct:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--dknf7gob7xggqd3f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqEPFcACgkQ3SOs138+
s6GwRw//bNdJ87iaPR43h9MA+iQvmN7luZ83EGxmzJSJkQMEn7RexGv3L4pkTTPQ
jTsYbbaVoL+1x1o2O7iYFEjrxEyiVIHqKNMvdhFjfegZx79d4vzOJKsDPHZ/7on1
5lDJHZaxjHcVAtSZmOSm4sdcuucdR4DKTq3R5Evm49YvOS87U1F0Q2PeSVDqje4R
h4qHeZKRuVUiZhJq5z9KrsxYVgCAiFkz+N3OpS9HSdeH4LIGjElRC0WonqQJaiQ1
gpGbYjFqSrWTSh4rlm7S9U124DvgIlD6nVZcOcpghCQ6ROtgXVn7KhhJaGJmbc6b
O3uEQEbCC6w0KV+579blonaHEwUcV+69JyCWu2QpLBGH0771MFljfm4UKKYoqmfA
MoUBGSbloVmIjAsJEZwbJ+QQ7D4X8mOEXqkXIe1g9NLqEy+1FO9fDF3z0DxyyilT
WC/7Iv6X0a5MRMhfeDWOMebNFUU7tYXKXlObAzu7Fdu56X7hfXGvqeAO8IjyPAfw
WLSYQv2wR74KDZVrbWwDGZWZ+wPMUMTzcCw/A7hqEF7OdUOCsacYgdDEtZUAFX2q
bbykFyi5sb1WyUAElnqPip0cijOnGPYKKwFCFuzNnerlNaQ3Y5paRlpp+7qCcZ46
hJ/W+vJCN09IJzL8XBfzRSqceo/RkkJvlVjLXIZJhs49qMXhc9A=
=AlDQ
-----END PGP SIGNATURE-----

--dknf7gob7xggqd3f--
