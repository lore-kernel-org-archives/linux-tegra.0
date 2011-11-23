From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH 07/17] ASoC: Tegra DAS: Use devm_ APIs and
 module_platform_driver
Date: Wed, 23 Nov 2011 21:40:30 +0100
Message-ID: <20111123204030.GA7485@avionic-0098.adnet.avionic-design.de>
References: <1322011285-4002-1-git-send-email-swarren@nvidia.com>
 <1322011285-4002-8-git-send-email-swarren@nvidia.com>
 <20111123065808.GB5255@avionic-0098.adnet.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF174F08C6F3@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF174F08C6F3-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "Mark Brown (broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org)" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Dimitris Papastamos <dp-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Ian Lartey <ian-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> Thierry Reding wrote at Tuesday, November 22, 2011 11:58 PM:
> > * Stephen Warren wrote:
> > > module_platform_drive saves some boiler-plate code.
> > >
> > > The devm_ APIs remove the need to manually clean up allocations,
> > > thus removing some code.
> ...
> > >  static int __devexit tegra_das_remove(struct platform_device *pdev)
> > >  {
> > > -	struct resource *res;
> > > -
> > >  	if (!das)
> > >  		return -ENODEV;
> > >
> > > -	platform_set_drvdata(pdev, NULL);
> > > -
> > [...]
> >=20
> > Setting the driver data to NULL may still be a good idea.
>=20
> When Mark Brown reviewed the TrimSlice machine driver, he mentioned that
> clearing the drvdata was pointless; nothing should be using it when the
> device is not created.
>=20
> As background, soon after that, I modified the tegra_wm8903.c machine
> driver along the same lines, but evidently didn't update tegra_das.c
> in a similar way, but would have if I'd been paying attention...

Thinking about this some more I have to agree. The only one using the driver
data would be the driver, which in turn shouldn't be doing anything with it
after remove is called.

I was just commenting on it because I've seen it done in a lot of drivers a=
nd
thought it was common (best) practice.

Thierry

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk7NWj4ACgkQZ+BJyKLjJp/krwCeIvMbwc0xPk1pHTxAmR+3YObk
EjcAn1/tf5dvtj4QkHWmsVF7brdA+sEO
=kfAb
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
