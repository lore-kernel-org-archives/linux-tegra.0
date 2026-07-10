Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274A83CC314
	for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 09:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783676350; cv=none; b=WWGN4Dpff0+NpBwRnqLssGdifC7+oxOrFaLxvkG1fxJxix3sKa5LDhq9jn9HneMOGokuNWYc1Z7orxWbwbmII8oe+QrZK4NTEZhqsUHiWEiApsecM+lN6JCZrbJUPdNYdFMR+PIo9MtkqnU0gpjUz1eQIQT5GN0vWn7YcRzqMCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783676350; c=relaxed/simple;
	bh=ycdXo9mdkIBTIsewD8pBHZS6z5KefyMktdQNn7PSBVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LiY3DTqxRzXGl1yaWNOWR38C6wVDaiqhdTdE2QPXCNrc5XSmHi9waoTcnCfkDbSrBNs2o5BtxSXyQG9krEQPNUCcNO5GxOdCu1VdscUkfPj0Sq84C6/OPewjlRmUxbOpFZdrhBRiTihlTc9fVqBmH9K3t24VK+/uSWIQVTva79U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=meW4ej4c; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="meW4ej4c"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c15c257a488so121324466b.3
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 02:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783676345; x=1784281145; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hKXuuv8uNGGlcVzg8Bu9K86eQyabRedyUX7hjQTnl2k=;
        b=meW4ej4cWBiO5xhdwavq4NaXZoxxhv4PvR2iTpfHkvIWZwvcs9aY9Kwtk5S6wdhh57
         gfZjCfXR7dPLvUXpHOceOXxfddzwnEBLYAjIC9Ux2DQ8fB+Ys8c7EGmMaSrLVCsDYyHa
         /Rx4pH8lhiBvktBTsveLROV80PoTPZRjSgO1Bdq8f7luB9wCfK4w6ev8LBV+U6iFIPgG
         o2KS6SimbeH9LGhxb89Fr7TixSrwG8VRkvt8YtWWQZwMhPdEROVkncGUk0vA3KvylpHC
         sWcWNszs2RuNr0Yc272yyq4eMgvZ0MUjFmib2nTM/pFaBRzdqlIW2TrML+lnP2RufP+Q
         uVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783676345; x=1784281145;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKXuuv8uNGGlcVzg8Bu9K86eQyabRedyUX7hjQTnl2k=;
        b=hmd2lCNvLZGuBnqWZSXh+8Nv4RNZXxqdVBCBLyHh+J4ibsetobqiTHMUHObdISkxEP
         eIebabIJUYp+4Ckc9CaJDKmOc1GvxsQgFIHhM1hmig281WKkd97J2QaA0v4eyJoAUaaX
         RxjhI0zmERhe7XvUZNpVmYNT8C8GEqeT81qK8FMcO0OczGQUZmZwozAKnq8JVL+DxlPp
         pZyQ3CCoWI5PDKo+f8gZ9RzMxVsIOi5zMGngQTPqEChHc2tMdpE7BhjUHcU+k8AwdZ+v
         AcXRZAtTn+iRAchjda8k+J5qrhlikb27zV5pS3Wgo0H/wM6qsvUJOxqLEqLhCtI0ByD2
         AiPQ==
X-Forwarded-Encrypted: i=1; AHgh+RpuC8Bo9PYBvXZs4012DGjs510cDybaMqMgJXAVbpWUwiFkOih14J7bbxqRQWsFpVeRvbtc857gz/1Vyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrjo1fko5nTf+PNA6c97o7OqvIETmj7Xi/C8XlJ+h4U3WabfdH
	ntuD2kOiZ2XD/WmZQ6GYRKAg9BhWhiAHstChGitjiliL27pKcSn6YDiT
X-Gm-Gg: AfdE7cnl1C96/2SRtdpunaon0M+tPQICgfmaqddiTnqF76QuwYs8QxNJkQAY/XAZoT9
	tnEoPor0Rn/GxYiMWnICtAujBvSDpVTOLrYdDUUiS7gqznmFEHCRpQCGeo/Xaxx6m0t9Ys3BPCc
	36Vegsd2YMxwNdQwJH4Hp7g9rFkY+PXKkfRRIbzY0006eAKbllaVTi9AJJYa8gpTNFpcM7nZHr7
	93OTjwDmodrNfSld2QMcHoFtbcDMUD5k/hPip7B/V01hBuV7aB71f03Fdjq1ktKhgbz6BMyHgvW
	IBgn9JeUi2e8c7FXuWirOtnGBewpOSlyHq1Xd5EjCe7kAJo990AXIRK1DwjWxMX66mp8Oha5QYA
	LXvTPiwff5469aLCBljFs7LeAnaiBzwWv70Kbi4vI8cOtm9uyfHdo4fXS4GQbcbM/n3AH1Fwn0i
	3xMLMGxG43cnzzwo3eI4UNpFnzy2leb1tRaB8EWeKm0IrsJAzH3c6gbhVNOfocQmlWWfdGyRCxw
	fY=
X-Received: by 2002:a17:907:c22:b0:c15:fc5b:6884 with SMTP id a640c23a62f3a-c15fc5b6a25mr141443566b.13.1783676345217;
        Fri, 10 Jul 2026 02:39:05 -0700 (PDT)
Received: from orome (p200300e41f023e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f02:3e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15e41121d2sm226243166b.47.2026.07.10.02.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:39:03 -0700 (PDT)
Date: Fri, 10 Jul 2026 11:39:01 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aniruddha Rao <anrao@nvidia.com>
Cc: thierry.reding@kernel.org, jonathanh@nvidia.com, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] firmware: tegra: bpmp: Move channel, resource init
 to helper
Message-ID: <alC8tkLOAjilBsq-@orome>
References: <20260615083731.888055-1-anrao@nvidia.com>
 <20260615083731.888055-3-anrao@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4ak7w2zsfavhgfxm"
Content-Disposition: inline
In-Reply-To: <20260615083731.888055-3-anrao@nvidia.com>


--4ak7w2zsfavhgfxm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/6] firmware: tegra: bpmp: Move channel, resource init
 to helper
MIME-Version: 1.0

On Mon, Jun 15, 2026 at 08:37:27AM +0000, Aniruddha Rao wrote:
> Refactor the BPMP driver by moving channel initialization and Device Tree
> resource parsing into separate helper functions.
>=20
> This prepares the driver for ACPI support, where these helpers will be
> skipped because channel initialization is handled by ACPI AML methods on
> ACPI-based systems.
>=20
> Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
> ---
>  drivers/firmware/tegra/bpmp.c | 94 +++++++++++++++++++++--------------
>  1 file changed, 57 insertions(+), 37 deletions(-)
>=20
> diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
> index 753472b53bd8..16ca0d104c1d 100644
> --- a/drivers/firmware/tegra/bpmp.c
> +++ b/drivers/firmware/tegra/bpmp.c
> @@ -733,19 +733,9 @@ void tegra_bpmp_handle_rx(struct tegra_bpmp *bpmp)
>  	spin_unlock(&bpmp->lock);
>  }
> =20
> -static int tegra_bpmp_probe(struct platform_device *pdev)
> +static int tegra_bpmp_init_channels(struct tegra_bpmp *bpmp)
>  {
> -	struct tegra_bpmp *bpmp;
> -	char tag[TAG_SZ];
>  	size_t size;
> -	int err;
> -
> -	bpmp =3D devm_kzalloc(&pdev->dev, sizeof(*bpmp), GFP_KERNEL);
> -	if (!bpmp)
> -		return -ENOMEM;
> -
> -	bpmp->soc =3D of_device_get_match_data(&pdev->dev);
> -	bpmp->dev =3D &pdev->dev;
> =20
>  	INIT_LIST_HEAD(&bpmp->mrqs);
>  	spin_lock_init(&bpmp->lock);
> @@ -755,37 +745,85 @@ static int tegra_bpmp_probe(struct platform_device =
*pdev)
> =20
>  	size =3D BITS_TO_LONGS(bpmp->threaded.count) * sizeof(long);
> =20
> -	bpmp->threaded.allocated =3D devm_kzalloc(&pdev->dev, size, GFP_KERNEL);
> +	bpmp->threaded.allocated =3D devm_kzalloc(bpmp->dev, size, GFP_KERNEL);
>  	if (!bpmp->threaded.allocated)
>  		return -ENOMEM;
> =20
> -	bpmp->threaded.busy =3D devm_kzalloc(&pdev->dev, size, GFP_KERNEL);
> +	bpmp->threaded.busy =3D devm_kzalloc(bpmp->dev, size, GFP_KERNEL);
>  	if (!bpmp->threaded.busy)
>  		return -ENOMEM;
> =20
>  	spin_lock_init(&bpmp->atomic_tx_lock);
> -	bpmp->tx_channel =3D devm_kzalloc(&pdev->dev, sizeof(*bpmp->tx_channel),
> +	bpmp->tx_channel =3D devm_kzalloc(bpmp->dev, sizeof(*bpmp->tx_channel),
>  					GFP_KERNEL);
>  	if (!bpmp->tx_channel)
>  		return -ENOMEM;
> =20
> -	bpmp->rx_channel =3D devm_kzalloc(&pdev->dev, sizeof(*bpmp->rx_channel),
> +	bpmp->rx_channel =3D devm_kzalloc(bpmp->dev, sizeof(*bpmp->rx_channel),
>  	                                GFP_KERNEL);
>  	if (!bpmp->rx_channel)
>  		return -ENOMEM;
> =20
> -	bpmp->threaded_channels =3D devm_kcalloc(&pdev->dev, bpmp->threaded.cou=
nt,
> +	bpmp->threaded_channels =3D devm_kcalloc(bpmp->dev, bpmp->threaded.coun=
t,
>  					       sizeof(*bpmp->threaded_channels),
>  					       GFP_KERNEL);
>  	if (!bpmp->threaded_channels)
>  		return -ENOMEM;
> =20
> -	platform_set_drvdata(pdev, bpmp);
> +	return 0;
> +}
> +
> +static int tegra_bpmp_init_resources(struct tegra_bpmp *bpmp)
> +{
> +	int err;
> +
> +	err =3D of_platform_default_populate(bpmp->dev->of_node, NULL, bpmp->de=
v);
> +	if (err < 0)
> +		return err;

This doesn't really belong in tegra_bpmp_init_resources(). Instead I
think we should keep this separate and wrap the calls to the OF-specific
functions in an OF conditional.

Come to think of it, looking at subsequent patches the OF conditional
seems to have been the prime motivator for moving this into a separate
function. And if we're moving of_platform_default_populate() out of this
there's very little reason left to do so. I think we should just keep
these calls in tegra_bpmp_probe() and wrap them in the conditional
instead. Should make the patch a bit easier to understand, too.

Thierry

> +
> +	if (of_property_present(bpmp->dev->of_node, "#clock-cells")) {
> +		err =3D tegra_bpmp_init_clocks(bpmp);
> +		if (err < 0)
> +			return err;
> +	}
> +
> +	if (of_property_present(bpmp->dev->of_node, "#reset-cells")) {
> +		err =3D tegra_bpmp_init_resets(bpmp);
> +		if (err < 0)
> +			return err;
> +	}
> +
> +	if (of_property_present(bpmp->dev->of_node, "#power-domain-cells"))
> +		err =3D tegra_bpmp_init_powergates(bpmp);
> +
> +	return err;
> +}
> +
> +static int tegra_bpmp_probe(struct platform_device *pdev)
> +{
> +	struct tegra_bpmp *bpmp;
> +	char tag[TAG_SZ];
> +	int err;
> =20
> -	err =3D bpmp->soc->ops->init(bpmp);
> +	bpmp =3D devm_kzalloc(&pdev->dev, sizeof(*bpmp), GFP_KERNEL);
> +	if (!bpmp)
> +		return -ENOMEM;
> +
> +	bpmp->soc =3D device_get_match_data(&pdev->dev);
> +	bpmp->dev =3D &pdev->dev;
> +
> +	err =3D tegra_bpmp_init_channels(bpmp);
>  	if (err < 0)
>  		return err;
> =20
> +	platform_set_drvdata(pdev, bpmp);
> +
> +	if (bpmp->soc->ops->init) {

Maybe add in a check for bpmp->soc->ops in here, so that we don't have
to assign an empty ops structure for ACPI if it isn't needed.

> +		err =3D bpmp->soc->ops->init(bpmp);
> +		if (err < 0)
> +			return err;
> +	}
> +
>  	err =3D tegra_bpmp_request_mrq(bpmp, MRQ_PING,
>  				     tegra_bpmp_mrq_handle_ping, bpmp);
>  	if (err < 0)
> @@ -805,28 +843,10 @@ static int tegra_bpmp_probe(struct platform_device =
*pdev)
> =20
>  	dev_info(&pdev->dev, "firmware: %.*s\n", (int)sizeof(tag), tag);
> =20
> -	err =3D of_platform_default_populate(pdev->dev.of_node, NULL, &pdev->de=
v);
> +	err =3D tegra_bpmp_init_resources(bpmp);
>  	if (err < 0)
>  		goto free_mrq;
> =20
> -	if (of_property_present(pdev->dev.of_node, "#clock-cells")) {
> -		err =3D tegra_bpmp_init_clocks(bpmp);
> -		if (err < 0)
> -			goto free_mrq;
> -	}
> -
> -	if (of_property_present(pdev->dev.of_node, "#reset-cells")) {
> -		err =3D tegra_bpmp_init_resets(bpmp);
> -		if (err < 0)
> -			goto free_mrq;
> -	}
> -
> -	if (of_property_present(pdev->dev.of_node, "#power-domain-cells")) {
> -		err =3D tegra_bpmp_init_powergates(bpmp);
> -		if (err < 0)
> -			goto free_mrq;
> -	}
> -
>  	err =3D tegra_bpmp_init_debugfs(bpmp);
>  	if (err < 0)
>  		dev_err(&pdev->dev, "debugfs initialization failed: %d\n", err);
> --=20
> 2.43.0
>=20

--4ak7w2zsfavhgfxm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpQvbUACgkQ3SOs138+
s6HjOBAAgQ7GAwZJRexIjiSkgEhv8UuZnGwJQkPS/zYf1rk87AGrCeXfLohfLxaR
ZO9fXXS/y6ZhU6zCGsbZywkcraSN3LSb0lUErOUwYlB/nXokFiR2wR04zrZiogX8
Z8kudLr7c/LpxcUsOtTStt2kidFBulpeP88+wPq0vufdQ/5WLhxGoLfLquZw4eAH
t9My5PUi8YbGW1o1PrWTlkmKaPnFEkM0nhsGfgZZFQQPFlNXo5qU5pKd3gMsDyJb
kgoVyjVNP+5vWDnmmDjjg/X44wi/iJWiEAIwO3QJNLWxwTkKTL8u/tSZbkmiB4ee
zrjtMXCs4h9Xl6psN3DJPedDNvTYmdIN0PnauKDTtfsCoRc+VZfevHZ9yR+3wiPX
XDGVoL+BhkG4zmSt7e9760LCy2jwydDWishylCocqff5bwhd97nEvPtx4pFwJEb3
k152tgMsFozD6Oc8JPDV0b/ewfOiN0PVqGEV5o3iMYvlj/RiZfvU4amvUsLcNY+L
Z0EzBp/PHXhAF2tLmU5bBVOm5c8/iyAIyLy8xxZgiTpC+dHtMn5fl0MY1Prnabi8
eyQnZlQ4U7ZjxLmSH9a20yGotisSDDYOHmDdfYTwGOtwYj/e8QRLsmj5lZhvD44S
SO7LXz5wMKZg1HG4j1g8Dmy5heDYDshMkpA8RNdHcg8NS0/OS/g=
=M5eg
-----END PGP SIGNATURE-----

--4ak7w2zsfavhgfxm--
