From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 13/17] ASoC: Tegra TrimSlice machine: Use devm_ APIs and
 module_platform_driver
Date: Wed, 23 Nov 2011 08:06:27 +0100
Message-ID: <20111123070627.GF5255@avionic-0098.adnet.avionic-design.de>
References: <1322011285-4002-1-git-send-email-swarren@nvidia.com>
 <1322011285-4002-14-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XIiC+We3v3zHqZ6Z"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1322011285-4002-14-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ian Lartey <ian-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Dimitris Papastamos <dp-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--XIiC+We3v3zHqZ6Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> module_platform_drive saves some boiler-plate code.

Some here.

>=20
> The devm_ APIs remove the need to manually clean up allocations,
> thus removing some code.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  sound/soc/tegra/trimslice.c |   26 +++++++-------------------
>  1 files changed, 7 insertions(+), 19 deletions(-)
>=20
> diff --git a/sound/soc/tegra/trimslice.c b/sound/soc/tegra/trimslice.c
> index 2699a6f..d564b40 100644
> --- a/sound/soc/tegra/trimslice.c
> +++ b/sound/soc/tegra/trimslice.c
> @@ -170,15 +170,17 @@ static __devinit int tegra_snd_trimslice_probe(stru=
ct platform_device *pdev)
>  	struct tegra_trimslice *trimslice;
>  	int ret;
> =20
> -	trimslice =3D kzalloc(sizeof(struct tegra_trimslice), GFP_KERNEL);
> +	trimslice =3D devm_kzalloc(&pdev->dev, sizeof(struct tegra_trimslice),
> +				 GFP_KERNEL);
>  	if (!trimslice) {
>  		dev_err(&pdev->dev, "Can't allocate tegra_trimslice\n");
> -		return -ENOMEM;
> +		ret =3D -ENOMEM;
> +		goto err;
>  	}
> =20
>  	ret =3D tegra_asoc_utils_init(&trimslice->util_data, &pdev->dev);
>  	if (ret)
> -		goto err_free_trimslice;
> +		goto err;
> =20
>  	card->dev =3D &pdev->dev;
>  	platform_set_drvdata(pdev, card);
> @@ -195,8 +197,7 @@ static __devinit int tegra_snd_trimslice_probe(struct=
 platform_device *pdev)
> =20
>  err_fini_utils:
>  	tegra_asoc_utils_fini(&trimslice->util_data);
> -err_free_trimslice:
> -	kfree(trimslice);
> +err:
>  	return ret;
>  }
> =20
> @@ -209,8 +210,6 @@ static int __devexit tegra_snd_trimslice_remove(struc=
t platform_device *pdev)
> =20
>  	tegra_asoc_utils_fini(&trimslice->util_data);
> =20
> -	kfree(trimslice);
> -
>  	return 0;
>  }
> =20
> @@ -222,18 +221,7 @@ static struct platform_driver tegra_snd_trimslice_dr=
iver =3D {
>  	.probe =3D tegra_snd_trimslice_probe,
>  	.remove =3D __devexit_p(tegra_snd_trimslice_remove),
>  };
> -
> -static int __init snd_tegra_trimslice_init(void)
> -{
> -	return platform_driver_register(&tegra_snd_trimslice_driver);
> -}
> -module_init(snd_tegra_trimslice_init);
> -
> -static void __exit snd_tegra_trimslice_exit(void)
> -{
> -	platform_driver_unregister(&tegra_snd_trimslice_driver);
> -}
> -module_exit(snd_tegra_trimslice_exit);
> +module_platform_driver(tegra_snd_trimslice_driver);
> =20
>  MODULE_AUTHOR("Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>");
>  MODULE_DESCRIPTION("Trimslice machine ASoC driver");
> --=20
> 1.7.0.4
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20

--XIiC+We3v3zHqZ6Z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk7Mm3MACgkQZ+BJyKLjJp8zxwCfeCYwW6kUGSH6wl2F1UXho8hh
bIkAnj3Ac17xJZtG3XY5LsR2qBkLUvIN
=rRI3
-----END PGP SIGNATURE-----

--XIiC+We3v3zHqZ6Z--
