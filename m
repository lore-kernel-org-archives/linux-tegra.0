From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 17/17] ASoC: Tegra+WM8903 machine: Add device tree binding
Date: Wed, 23 Nov 2011 08:15:28 +0100
Message-ID: <20111123071528.GA12558@avionic-0098.adnet.avionic-design.de>
References: <1322011285-4002-1-git-send-email-swarren@nvidia.com>
 <1322011285-4002-18-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1322011285-4002-18-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ian Lartey <ian-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Dimitris Papastamos <dp-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>=20
> This driver is parameterized in two ways:
>=20
> a) Platform data, which supplies a set of GPIOs used by the driver.
>    These GPIOs can now be parsed out of device tree.
>=20
> b) Machine-specific DAPM route arrays embedded into the ASoC machine
>    driver itself. The driver picks the appropriate array to use using
>    machine_is_*(). This array can now be parsed straight out of device
>    tree, allowing the machine driver to be completely machine agnostic.
>=20
> swarren applied the following modifications:
> * Moved all pdata and DT parsing into one place.
> * Added DAPM route parsing from DT.
> * Added tegra_pcm device registration.
> * Documented DT binding.
>=20
> Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../bindings/sound/tegra-audio-wm8903.txt          |   63 +++++++++
>  sound/soc/tegra/tegra_wm8903.c                     |  133 ++++++++++++++=
++----
>  2 files changed, 171 insertions(+), 25 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/tegra-audio-w=
m8903.txt
[...]
> diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm890=
3.c
[...]
> @@ -262,6 +266,83 @@ static int tegra_wm8903_init(struct snd_soc_pcm_runt=
ime *rtd)
>  		return ret;
>  	}
> =20
> +	pdata =3D &machine->pdata;
> +	np =3D card->dev->of_node;
> +
> +	if (card->dev->platform_data) {
> +		*pdata =3D *(struct tegra_wm8903_platform_data *)
> +						card->dev->platform_data;
[...]

Minor nit: perhaps this should use memcpy() instead?

Thierry

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk7MnZAACgkQZ+BJyKLjJp9dxgCdFtePtwAxEtmChH93TisJ0WSQ
E9AAn2rVxl3HtxQmL2r+fPm5h/MqGeuX
=Tvy/
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
