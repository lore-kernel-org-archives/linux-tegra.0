From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH 07/17] ASoC: Tegra DAS: Use devm_ APIs and
 module_platform_driver
Date: Wed, 23 Nov 2011 07:58:08 +0100
Message-ID: <20111123065808.GB5255@avionic-0098.adnet.avionic-design.de>
References: <1322011285-4002-1-git-send-email-swarren@nvidia.com>
	<1322011285-4002-8-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6605898982696531818=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1322011285-4002-8-git-send-email-swarren@nvidia.com>
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


--===============6605898982696531818==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
Content-Disposition: inline


--NDin8bjvE/0mNLFQ
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
>  sound/soc/tegra/tegra_das.c |   45 +++++++++----------------------------=
-----
>  1 files changed, 10 insertions(+), 35 deletions(-)
>=20
> diff --git a/sound/soc/tegra/tegra_das.c b/sound/soc/tegra/tegra_das.c
[...]
> @@ -208,32 +208,18 @@ static int __devinit tegra_das_probe(struct platfor=
m_device *pdev)
> =20
>  	return 0;
> =20
> -err_release:
> -	release_mem_region(res->start, resource_size(res));
> -err_free:
> -	kfree(das);
> +err:
>  	das =3D NULL;
> -exit:
>  	return ret;
>  }
> =20
>  static int __devexit tegra_das_remove(struct platform_device *pdev)
>  {
> -	struct resource *res;
> -
>  	if (!das)
>  		return -ENODEV;
> =20
> -	platform_set_drvdata(pdev, NULL);
> -
[...]

Setting the driver data to NULL may still be a good idea.

Thierry

--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk7MmYAACgkQZ+BJyKLjJp+lzwCeJ0lRsbhIll0W3N0LcNKzd7+7
aU8AoJKpCetUwA1nE3YBtmlwjJdwuVvS
=yZYj
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--

--===============6605898982696531818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============6605898982696531818==--
