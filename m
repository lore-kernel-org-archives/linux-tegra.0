Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2245309DDF;
	Wed, 25 Mar 2026 13:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774443960; cv=none; b=cT4QcwLiZvnvnt94S96gL8Ucqlr5iVoqnjPF6NlUclHLtMQozmoEIk3GUKVK7YElWixOsDS7FLRZOhnm+PK+KBFE4gyJ19iErQpJW7r65dAPPjeEUembjEeMzw2k6oHlhRUBOg8Qdi633jLBdkQ4ibDtJ5DLh/dmEzJ20nAGbm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774443960; c=relaxed/simple;
	bh=rzV9KEWajsJ8B7/mrSMUykQ+PshUl0DaCZOiK0wU4K8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m5wi6fnOMzcd+h/o62xWl6whfnFNzl6FeroOcnG9FVHkdPh+8nrsYCMBYCX7kBeZ+9J5sLcf9XdtVek4BaU2zb6eg18uJVajCRvE6wpskcr7n9QiTuRbsxAwPiORRtQYVxyi7fG1qeVjDzGH3EIbarX6HCnKwy+I5k/pYbDDs8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BO63G6ox; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BO63G6ox"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E818FC4CEF7;
	Wed, 25 Mar 2026 13:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774443960;
	bh=rzV9KEWajsJ8B7/mrSMUykQ+PshUl0DaCZOiK0wU4K8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BO63G6oxa07lS0t1c1T081SSWJuyslzBluzpbDYnR47f2TygxiAvm8Z72IBgnZS4H
	 /aIFvi2DgMpVPHGkZXPH09X+w6wU/CY3jZL5q8jfwJzaIzat1Oqumvhnakp0evsxCI
	 no5P4mpmQjY78OFjnqJV+GDpi9Ezf5fVECsYl8SinoFCaNyCxfrTodb7DhGCQMCb5h
	 NTO60xNZpR/ja1g6LfhsJKGyLtXm4AHqPDa/LgeGntpzycapgO97gtKfgMEbLAG+uA
	 fqzUumjwan4EzloD1MOapENaYLDmCWwHcnIQLiUrw1MEux6L621cKASzZvRYujUJM0
	 M7teEAu3sTZnA==
Date: Wed, 25 Mar 2026 13:05:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Sheetal <sheetal@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mohan Kumar <mkumard@nvidia.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/14] ASoC: tegra: Add error logging in
 tegra210_admaif driver
Message-ID: <6fd4ecb9-73e8-4555-855b-28350aaae44f@sirena.org.uk>
References: <20260325101437.3059693-1-sheetal@nvidia.com>
 <20260325101437.3059693-4-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OnDLxHD9zFb8vgxW"
Content-Disposition: inline
In-Reply-To: <20260325101437.3059693-4-sheetal@nvidia.com>
X-Cookie: Those who can't write, write manuals.


--OnDLxHD9zFb8vgxW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 10:14:26AM +0000, Sheetal wrote:

> Log errors in the Tegra210 ADMAIF probe and runtime callback paths.

> @@ -966,10 +969,9 @@ static int tegra_admaif_probe(struct platform_device=
 *pdev)
>  	regcache_cache_only(admaif->regmap, true);
> =20
>  	err =3D tegra_isomgr_adma_register(&pdev->dev);
> -	if (err) {
> -		dev_err(&pdev->dev, "Failed to add interconnect path\n");
> -		return err;
> -	}
> +	if (err)
> +		return dev_err_probe(&pdev->dev, err,
> +				     "failed to add interconnect path\n");

tegra_isomgr_adma_register() already logs failures.

--OnDLxHD9zFb8vgxW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnD3bIACgkQJNaLcl1U
h9APrgf/cOOfXP2mYN7BJkyLLf8ai/LfkO2ETIXGmjRFH6nXunkGkWhguCyQTFYk
xmendkIzqJJib49j/Llu60ClScLk76K2xYx0sI58oWzRcrAJ9Ad1Ee+hZ3Iohy8n
EYhdZMg0RgqyU2KJcu4dfUB4v3Fp6at4HZ57iR2L6DaAThr/BVtkOemB99XWjk0e
bDusZhk1RpO3cM1mi2CBbxRAzf+Vu//iDG2zvSD1ONqz5dXAagDsR9zj8zRnzbI4
3yo2tfDy3ZPCtG+0m/LF08xhS5CmBpauIzpovC5sKR0Uojd/SdK+FzyU9aLAjHGV
Y5ImjA55BUJtOOHDqXhocOUhrjXtSQ==
=Obhc
-----END PGP SIGNATURE-----

--OnDLxHD9zFb8vgxW--
