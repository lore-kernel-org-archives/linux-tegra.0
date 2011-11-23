From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 12/17] ASoC: Tegra+WM8903 machine: Use devm_ APIs and
 module_platform_driver
Date: Wed, 23 Nov 2011 08:05:59 +0100
Message-ID: <20111123070559.GE5255@avionic-0098.adnet.avionic-design.de>
References: <1322011285-4002-1-git-send-email-swarren@nvidia.com>
 <1322011285-4002-13-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Uwl7UQhJk99r8jnw"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1322011285-4002-13-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ian Lartey <ian-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Dimitris Papastamos <dp-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Uwl7UQhJk99r8jnw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> module_platform_drive saves some boiler-plate code.

module_platform_driver

Thierry

>=20
> The devm_ APIs remove the need to manually clean up allocations,
> thus removing some code.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  sound/soc/tegra/tegra_wm8903.c |   26 +++++++-------------------
>  1 files changed, 7 insertions(+), 19 deletions(-)
>=20
> diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm890=
3.c
> index 9b0ee15..33feee8 100644
> --- a/sound/soc/tegra/tegra_wm8903.c
> +++ b/sound/soc/tegra/tegra_wm8903.c
> @@ -390,17 +390,19 @@ static __devinit int tegra_wm8903_driver_probe(stru=
ct platform_device *pdev)
>  		return -EINVAL;
>  	}
> =20
> -	machine =3D kzalloc(sizeof(struct tegra_wm8903), GFP_KERNEL);
> +	machine =3D devm_kzalloc(&pdev->dev, sizeof(struct tegra_wm8903),
> +			       GFP_KERNEL);
>  	if (!machine) {
>  		dev_err(&pdev->dev, "Can't allocate tegra_wm8903 struct\n");
> -		return -ENOMEM;
> +		ret =3D -ENOMEM;
> +		goto err;
>  	}
> =20
>  	machine->pdata =3D pdata;
> =20
>  	ret =3D tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
>  	if (ret)
> -		goto err_free_machine;
> +		goto err;
> =20
>  	card->dev =3D &pdev->dev;
>  	platform_set_drvdata(pdev, card);
> @@ -431,8 +433,7 @@ static __devinit int tegra_wm8903_driver_probe(struct=
 platform_device *pdev)
> =20
>  err_fini_utils:
>  	tegra_asoc_utils_fini(&machine->util_data);
> -err_free_machine:
> -	kfree(machine);
> +err:
>  	return ret;
>  }
> =20
> @@ -460,8 +461,6 @@ static int __devexit tegra_wm8903_driver_remove(struc=
t platform_device *pdev)
> =20
>  	tegra_asoc_utils_fini(&machine->util_data);
> =20
> -	kfree(machine);
> -
>  	return 0;
>  }
> =20
> @@ -474,18 +473,7 @@ static struct platform_driver tegra_wm8903_driver =
=3D {
>  	.probe =3D tegra_wm8903_driver_probe,
>  	.remove =3D __devexit_p(tegra_wm8903_driver_remove),
>  };
> -
> -static int __init tegra_wm8903_modinit(void)
> -{
> -	return platform_driver_register(&tegra_wm8903_driver);
> -}
> -module_init(tegra_wm8903_modinit);
> -
> -static void __exit tegra_wm8903_modexit(void)
> -{
> -	platform_driver_unregister(&tegra_wm8903_driver);
> -}
> -module_exit(tegra_wm8903_modexit);
> +module_platform_driver(tegra_wm8903_driver);
> =20
>  MODULE_AUTHOR("Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
>  MODULE_DESCRIPTION("Tegra+WM8903 machine ASoC driver");
> --=20
> 1.7.0.4
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20

--Uwl7UQhJk99r8jnw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk7Mm1cACgkQZ+BJyKLjJp/B0QCcDDXOvln4miwWsapju3xPhBgl
l+QAoIEgzR2N/axRDt3t5emMo+nsIeyC
=eJYB
-----END PGP SIGNATURE-----

--Uwl7UQhJk99r8jnw--
