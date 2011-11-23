From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH 08/17] ASoC: Tegra I2S: Use devm_ APIs and
 module_platform_driver
Date: Wed, 23 Nov 2011 08:00:27 +0100
Message-ID: <20111123070027.GC5255@avionic-0098.adnet.avionic-design.de>
References: <1322011285-4002-1-git-send-email-swarren@nvidia.com>
	<1322011285-4002-9-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8250180263204166593=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1322011285-4002-9-git-send-email-swarren@nvidia.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Stephen Warren <swarren@nvidia.com>
Cc: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, alsa-devel@alsa-project.org, Mike Rapoport <mike@compulab.co.il>, devicetree-discuss@lists.ozlabs.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Ian Lartey <ian@opensource.wolfsonmicro.com>, Rob Herring <rob.herring@calxeda.com>, Marc Dietrich <marvin24@gmx.de>, Grant Likely <grant.likely@secretlab.ca>, linux-tegra@vger.kernel.org, John Bonesio <bones@secretlab.ca>, Leon Romanovsky <leon@leon.nu>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Liam Girdwood <lrg@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============8250180263204166593==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fig2xvG2VGoz8o/s"
Content-Disposition: inline


--Fig2xvG2VGoz8o/s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> module_platform_drive saves some boiler-plate code.
>=20
> The devm_ APIs remove the need to manually clean up allocations,
> thus removing some code.
>=20
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
>  sound/soc/tegra/tegra_i2s.c |   45 +++++++++----------------------------=
-----
>  1 files changed, 10 insertions(+), 35 deletions(-)
>=20
> diff --git a/sound/soc/tegra/tegra_i2s.c b/sound/soc/tegra/tegra_i2s.c
[...]
> @@ -422,43 +422,29 @@ static __devinit int tegra_i2s_platform_probe(struc=
t platform_device *pdev)
>  	if (ret) {
>  		dev_err(&pdev->dev, "Could not register DAI: %d\n", ret);
>  		ret =3D -ENOMEM;
> -		goto err_unmap;
> +		goto err_clk_put;
>  	}
> =20
>  	tegra_i2s_debug_add(i2s, pdev->id);
> =20
>  	return 0;
> =20
> -err_unmap:
> -	iounmap(i2s->regs);
> -err_release:
> -	release_mem_region(mem->start, resource_size(mem));
>  err_clk_put:
>  	clk_put(i2s->clk_i2s);
> -err_free:
> -	kfree(i2s);
> -exit:
> +err:
>  	return ret;
>  }
> =20
>  static int __devexit tegra_i2s_platform_remove(struct platform_device *p=
dev)
>  {
>  	struct tegra_i2s *i2s =3D dev_get_drvdata(&pdev->dev);
> -	struct resource *res;
> =20
>  	snd_soc_unregister_dai(&pdev->dev);
> =20
>  	tegra_i2s_debug_remove(i2s);
> =20
> -	iounmap(i2s->regs);
> -
> -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	release_mem_region(res->start, resource_size(res));
> -
>  	clk_put(i2s->clk_i2s);
> =20
> -	kfree(i2s);
> -
>  	return 0;
>  }
[...]

Is this perhaps missing a dev_set_drvdata(&pdev->dev, NULL) as well?

Thierry

--Fig2xvG2VGoz8o/s
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk7MmgsACgkQZ+BJyKLjJp+8YACfYfRZty8MP33bL+GtHBaebKEg
l0wAn2uzXkGXHruTyPdFfSBKVnU6Ts98
=4J/Z
-----END PGP SIGNATURE-----

--Fig2xvG2VGoz8o/s--

--===============8250180263204166593==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============8250180263204166593==--
