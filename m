Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806624078D8;
	Tue, 13 Oct 2026 16:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907655; cv=none; b=nZklI2Yawsu7x5mUvProy18u69Yzdi478tLiyfsQOC1QFAB89aQuZ3hUTBkNKHtvqxdjxPqOtXi3saOe7f8ciXcfGmanUq1BaJISUkUF4oJy1IC5d1u1PajE5Qqw+NSAi9rXoB4VYQ2C7S8ssf/vtmJOr+QRnkTJ6lBDyYwcAxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907655; c=relaxed/simple;
	bh=w5qsLT2ZiI4pFx4PnanVxpCD7Y0mE81hb1KCIPPUMcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sFkvgT7dlkvSz5ZaP3/MweJDmQsISivYyofRpwbIzsI9uTBhEMxnPYPwYqR6ymTbFlJSBQtORVNAL79GRjhJxDnOt10Vc+21dgl99CG6spe52AahkeY7iTG5fXAD1pNNge1JzL/9SwvuIZfP0Aw+UNHXKMc3lTy1/skeVQrWK0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HRgx9u0c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HRgx9u0c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1ACD1F000FF;
	Tue, 13 Oct 2026 16:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907654;
	bh=GBVbDGl2c9If1Fq7/UIXtrAbvzfYNy0H304YHDTcBq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HRgx9u0cshb6sfdOnwhluWCVaCOQmW+se64tQDBAG+aKWA2BH782kofh0u7vBuzwE
	 P8I2zanCfV2BKANrITX7kaRew0p8zrOb53jxt4j6CQWFZWvIpt/IvZYciX053eBrdW
	 +2OohdEFlJICfMtsxoxlHW4chvM0jP3bq57fCXBIiiSkp2I3LAxVNbMV/BArCmDiRd
	 04d17cIARZrpnMOz1xeloRPSvlPJObLqCRyACDzCc4ZUtWvZAmfton/M553ozjrTKC
	 jTL8Zs4uo1nattIlyOswnYJlu9KVAoJMY/Rc+CbOyzkCoy378fK4/Inuhwd4jZphN/
	 0EfIlvWbruslQ==
Date: Tue, 13 Oct 2026 18:07:31 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	JC Kuo <jckuo@nvidia.com>, linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: tegra: Clean-up Makefile for Tegra186
Message-ID: <as5WkN6Wt08TeRax@orome>
References: <20261012-tegra-phy-v1-1-3241bf3c86e9@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zn46flkbhokfeb4k"
Content-Disposition: inline
In-Reply-To: <20261012-tegra-phy-v1-1-3241bf3c86e9@nvidia.com>


--zn46flkbhokfeb4k
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] phy: tegra: Clean-up Makefile for Tegra186
MIME-Version: 1.0

On Mon, Oct 12, 2026 at 12:16:31PM +0100, Jon Hunter wrote:
> The Makefile for the Tegra XUSB PHY driver has an entry for every Tegra
> SoC that compiles the xusb-tegra186.c file. Clean this up by adding a
> new Kconfig option called PHY_TEGRA186_XUSB that when defined compiles
> the xusb-tegra186.c file.
>=20
> Finally, update the xusb.[ch] files to use this new config option as
> well instead of using the individual SoC Kconfig options.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/phy/tegra/Kconfig  |  6 ++++++
>  drivers/phy/tegra/Makefile |  6 +-----
>  drivers/phy/tegra/xusb.c   | 10 +---------
>  drivers/phy/tegra/xusb.h   | 10 +---------
>  4 files changed, 9 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/phy/tegra/Kconfig b/drivers/phy/tegra/Kconfig
> index b5ed5bc0c8ef..bc14c1c443b1 100644
> --- a/drivers/phy/tegra/Kconfig
> +++ b/drivers/phy/tegra/Kconfig
> @@ -11,6 +11,12 @@ config PHY_TEGRA_XUSB
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called phy-tegra-xusb.
> =20
> +config PHY_TEGRA186_XUSB
> +	bool
> +	default y if ARCH_TEGRA_186_SOC || ARCH_TEGRA_194_SOC || \
> +		     ARCH_TEGRA_234_SOC || ARCH_TEGRA_238_SOC || \
> +		     ARCH_TEGRA_264_SOC
> +
>  config PHY_TEGRA194_P2U
>  	tristate "NVIDIA Tegra194 PIPE2UPHY PHY driver"
>  	depends on ARCH_TEGRA || COMPILE_TEST
> diff --git a/drivers/phy/tegra/Makefile b/drivers/phy/tegra/Makefile
> index 018a4cab2b40..7d9c05149d6b 100644
> --- a/drivers/phy/tegra/Makefile
> +++ b/drivers/phy/tegra/Makefile
> @@ -5,10 +5,6 @@ phy-tegra-xusb-y +=3D xusb.o
>  phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_124_SOC) +=3D xusb-tegra124.o
>  phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_132_SOC) +=3D xusb-tegra124.o
>  phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D xusb-tegra210.o
> -phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_186_SOC) +=3D xusb-tegra186.o
> -phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_194_SOC) +=3D xusb-tegra186.o
> -phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_234_SOC) +=3D xusb-tegra186.o
> -phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_238_SOC) +=3D xusb-tegra186.o
> -phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_264_SOC) +=3D xusb-tegra186.o
> +phy-tegra-xusb-$(CONFIG_PHY_TEGRA186_XUSB) +=3D xusb-tegra186.o

I suppose that's one way of doing it, but I don't know if I see the
advantage in it. You're effectively trading 5 lines of Makefile for
6 lines of Kconfig.

>  obj-$(CONFIG_PHY_TEGRA194_P2U) +=3D phy-tegra194-p2u.o
>  obj-$(CONFIG_PHY_TEGRA_MPHY) +=3D phy-tegra-mphy.o
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index 89ce9ac87300..79a3624faa10 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -60,31 +60,23 @@ static const struct of_device_id tegra_xusb_padctl_of=
_match[] =3D {
>  		.data =3D &tegra210_xusb_padctl_soc,
>  	},
>  #endif
> -#if defined(CONFIG_ARCH_TEGRA_186_SOC)
> +#if defined(CONFIG_PHY_TEGRA186_XUSB)
>  	{
>  		.compatible =3D "nvidia,tegra186-xusb-padctl",
>  		.data =3D &tegra186_xusb_padctl_soc,
>  	},
> -#endif
> -#if defined(CONFIG_ARCH_TEGRA_194_SOC)
>  	{
>  		.compatible =3D "nvidia,tegra194-xusb-padctl",
>  		.data =3D &tegra194_xusb_padctl_soc,
>  	},
> -#endif
> -#if defined(CONFIG_ARCH_TEGRA_234_SOC)
>  	{
>  		.compatible =3D "nvidia,tegra234-xusb-padctl",
>  		.data =3D &tegra234_xusb_padctl_soc,
>  	},
> -#endif
> -#if defined(CONFIG_ARCH_TEGRA_238_SOC)
>  	{
>  		.compatible =3D "nvidia,tegra238-xusb-padctl",
>  		.data =3D &tegra238_xusb_padctl_soc,
>  	},
> -#endif
> -#if defined(CONFIG_ARCH_TEGRA_264_SOC)
>  	{
>  		.compatible =3D "nvidia,tegra264-xusb-padctl",
>  		.data =3D &tegra264_xusb_padctl_soc,

And this means you now get data for all SoCs as soon as one of them is
enabled. Yes, I know that most of the time we want to build multi-SoC
kernels anyway, but it now is not just a clean up anymore.

Thierry

--zn46flkbhokfeb4k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrOV0MACgkQ3SOs138+
s6G1vhAAqI3RjJdCd6/T04a22m/UJkOGgpjh0keHOp6hK58A2F9HD7ottIV4qwT8
+cvdwiPlu7cU55SwOUC5nkXp35XrHXQlczG4Rh1PQqna0cvWkZfzN/nwlJ4aKVUL
c7bAEd25kRTFlA49kPQUZxIHB33Az0PWmAYesQcIHGFRNnCxuDgRQhUGJ/xSBfm7
QaBBlHO4aUMJGlJDRWHOQEW2g6N1hHOT1yiyxEmdc2HwXt8OP0sdkrUvlhVtXsL2
1FI5hsyks9McMO8Y/2YwHGXxEZqd8GHUoQ3HqqWKb86nAyGb9RFEIZ3q6sHjerhH
e0KOKAK/YAj96Ku8k+7T5+YvvIAmfTOazk/2+UWEUS/mKb5D8I0qTf1LgAfi+SDx
xml6l6NLc63SibsxMIVy/grOcNd/Qb/xaPMU9fEDvsh7Z6lTYFv6+jatz+aFbCcZ
frGCDrMBdIKadRI9VEGLYxHeoDtKENOOnc5ZkYV0Bpr4KgNt40BpcnEus//RkXYj
v6hGZHPMCSV1rowASe9WgPT6jpNH4KerRjAJxdpfzea1fYxYImE9wKZsiiW61EAQ
lgd5D9Ky+08w2SGCM1IkruSETylEM94ymern6gPNyOpkN64qPa1lAGnVXdR1r8jE
uvH4ag4Kc/TUICsOJkIDcw/f3/lmCuKXG4zaIAtsEUQh808B0rc=
=Bb1C
-----END PGP SIGNATURE-----

--zn46flkbhokfeb4k--
