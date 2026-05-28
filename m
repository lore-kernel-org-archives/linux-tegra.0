Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314B833987F;
	Thu, 28 May 2026 20:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780000553; cv=none; b=YraGRd/mgref2EuoEjV34Y9DQcmhEECJavKw6taXQJ+TH4BsjZeEXduw18tku44izfMgTF1/4RAKT0pqf9XkIB9KjkJc5zMPJl7/C0Gv8OUnfWhsnpCyjsr8iKdhWMpzhhY++PSgKVTWWrFiMds9tCDNsd/hOVA58J83oQGptNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780000553; c=relaxed/simple;
	bh=nu4gY42f9WvL23xt+G1j+UScq+b6uIYtpmR4Gn/43js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdMXRXw9MKqcXy1byWhweWDPCP/FUTK6DCldCHpzvPU6MQA5qevqcOFiP5MO/kFQwZyonOccAG2JUPrzYeHpVoA1S3jibSvaSbmR5SY0bq24iJ5tmv1W6cLTrlq1z3sLukprf3JhqD9l0mg5M/+nSOlCeCu1aFpVhAHzuDDVj1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hsC7Z19q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hsC7Z19q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F61D1F000E9;
	Thu, 28 May 2026 20:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780000551;
	bh=mQaGf16bgYRKo91sugyq1/OoaNKI7prP7jm6z0VAgNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hsC7Z19qiON/JbuKIcHEjn834FNrOSf26L6zxjqAC8JE/wblXvfckPMXH87iIr4Eo
	 dqA9He8DoOCt2Dvusa6XBh2JEHNmcSRTapjtVkPargc6URHg+iLf+njll+HHXdCTYR
	 z0uQ/sHjUyHhtt3hDc/W2miBrwWg77O70p35sBDbxzvVxq6M18KTG438Mu9/Mgb+x4
	 HomxiFEWXKdPTkqeGWOS9MecpOEuttL1VBmTbVBI1QN9fThtrBapUw7vB9hSG24XcJ
	 JyZyq1z7SNZ8squsHUwvikG5riiD1U+r4X46VlOKVtlwBpDE+OWZdKNyjXjZLeZqyS
	 tkSfn7q7+5+tA==
Date: Thu, 28 May 2026 22:35:49 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: tegra: ADX: use of_device_get_match_data
Message-ID: <ahimtheMu3fjdTf6@orome>
References: <20260522015856.741656-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3wq26z4hjl5q27jf"
Content-Disposition: inline
In-Reply-To: <20260522015856.741656-1-rosenp@gmail.com>


--3wq26z4hjl5q27jf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ASoC: tegra: ADX: use of_device_get_match_data
MIME-Version: 1.0

On Thu, May 21, 2026 at 06:58:56PM -0700, Rosen Penev wrote:
> Remove open coding of the function to simplify the code.
>=20
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  sound/soc/tegra/tegra210_adx.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_ad=
x.c
> index 12371f895234..a2c28369fbc8 100644
> --- a/sound/soc/tegra/tegra210_adx.c
> +++ b/sound/soc/tegra/tegra210_adx.c
> @@ -677,17 +677,16 @@ static int tegra210_adx_platform_probe(struct platf=
orm_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	struct tegra210_adx *adx;
> -	const struct of_device_id *match;
> -	struct tegra210_adx_soc_data *soc_data;
> +	const struct tegra210_adx_soc_data *soc_data;
>  	void __iomem *regs;
>  	int err, i;
> =20
> +	soc_data =3D of_device_get_match_data(dev);
> +
>  	adx =3D devm_kzalloc(dev, sizeof(*adx), GFP_KERNEL);
>  	if (!adx)
>  		return -ENOMEM;
> =20
> -	match =3D of_match_device(tegra210_adx_of_match, dev);
> -	soc_data =3D (struct tegra210_adx_soc_data *)match->data;
>  	adx->soc_data =3D soc_data;

Why not just:

	adx->soc_data =3D of_device_get_match_data(dev);

? That saves you a few temporary variables and since you're not moving
around the assignment needlessly, you get a much simpler diff, too.

Thierry

--3wq26z4hjl5q27jf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoYpyUACgkQ3SOs138+
s6FKfg/9E1TF89kvtA13sxmUrAdneHQRJJbxBN/PgVa5uxRP+h5EJvVUQFL0LqE9
cN11dmZIOIPAibD9WiFc4PLIYWl0QpRX1rv8Il3GHw2UCbkYmilcZJbYnziiZlu2
TFMsD0CDxgdoXHI9dgal6DBe7SBJpP9uF7E8Jeq5QbHQD0Z0hEwdB6Wsj0NdINof
dfQP4NtXtm1ABvNSDVaTDNo2Axd1q175mNhSHmC0dvCndb+bZmYakA4wItkuhEqV
YfU60Ch368aVdhCvqhvP1pqQMnXXYRmuKWWdBXE7gPokRTUWxbmUv2pN0q+3UGCT
Jc4BMwKYEeGcx6GSMlh9Il7P4oDaacYba9ZoDn/XsTD33gC4ybP2AIzDswE+Cx6/
o0UiUt86siH+O9MT6SGYk08Gq+cRNiQlcg8CxdW86bUBGm8CysyW2WLSfM+fDRX2
HLC0UVCxxuCxq0CxP9NAfc33Ha7uZzYNrGUYWJ8mhM2yYy5t8wFKZi+ONcNVPuGW
01jVv5Lbkdtjp6JtLovpMUXz1O8ngXgVFBYsKtQOtPIXR9iDEfxuSaB0xVtKsqfu
ZY81lxEv62nqKvpm/gOjnX/hM0NfU2sM9FHIPU6FihGmnF/w4DroJLCtVBJgHN8m
NhDj+25G93N9XEFsW3WKzn8FGrBz0OZGED6eT4ip3jxKlCVR9Ow=
=vWrp
-----END PGP SIGNATURE-----

--3wq26z4hjl5q27jf--
