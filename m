From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL] i2c: tegra: Changes for v5.8-rc1
Date: Tue, 19 May 2020 18:08:35 +0200
Message-ID: <20200519160835.GC2113674@ulmo>
References: <20200515143924.1579055-1-thierry.reding@gmail.com>
 <314a292e-bcd9-bb30-4067-71dc7cc399d6@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qjNfmADvan18RZcF"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <314a292e-bcd9-bb30-4067-71dc7cc399d6-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--qjNfmADvan18RZcF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2020 at 10:45:32AM +0300, Dmitry Osipenko wrote:
> 15.05.2020 17:39, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Hi,
> >=20
> > The following changes since commit 0e698dfa282211e414076f9dc7e83c1c2883=
14fd:
> >=20
> >   Linux 5.7-rc4 (2020-05-03 14:56:04 -0700)
> >=20
> > are available in the Git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/fo=
r-5.8-i2c
> >=20
> > for you to fetch changes up to c73178b93754edd8449dccd3faf05baafd4d3f0e:
> >=20
> >   i2c: tegra: Add support for the VI I2C on Tegra210 (2020-05-12 22:47:=
52 +0200)
> >=20
> > Thanks,
> > Thierry
> >=20
> > ----------------------------------------------------------------
> > i2c: tegra: Changes for v5.8-rc1
> >=20
> > This includes a few improvements to make the Tegra I2C controller behave
> > properly on suspend/resume, does a bit of cleanup and adds support for
> > the VI-variant of the I2C controller that is used primarily for video
> > capture purposes.
> >=20
> > ----------------------------------------------------------------
> > Dmitry Osipenko (2):
> >       i2c: tegra: Better handle case where CPU0 is busy for a long time
> >       i2c: tegra: Synchronize DMA before termination
> >=20
> > Thierry Reding (5):
> >       Revert "i2c: tegra: Fix suspending in active runtime PM state"
>=20
> >       i2c: tegra: Restore pinmux on system resume
>=20
> In general this series is good to me, although I have some concerns
> about this patch. Could you please answer the review comments?

Sorry, those had been burried under too much email. I've answered your
questions now.

Thierry

--qjNfmADvan18RZcF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7EBIIACgkQ3SOs138+
s6H9yA/+KiXPhxq4DKM2TKGlA1D80ApzNJeKnRVrHVqhxvjfR75Fu3uNEe3/5nSx
lxcBhgr/izItLIaqI4Sn+JqmXrWF3OhzPYR4CuCadTZyKqI8gdVe4j2cGtlooN0G
9l/9dWPDhHBmqyapu0TFVPrKHeRwt0ittIXE7FmjESu14Sk1fEbQCyf38GJpOaOJ
KujHRXgvKJvGH/Ta1AQYaVM5NS7YQoRvO9hH5IPYhTjaWgE+DWUzTHDKUkZH0kMq
qR3PDa4M+RkIRubEoXqJyTVx6hKP/uCl+3bzSZ1cT8Iph4uXmNP6x2swcfogEWJL
1wQ+A0JIaG3dHg/SoCbpbqCnss1jCFKaiTa74HWAuBH3RVS+upJsjLd4lzwNcYEr
Wb0nAtgnyKlqo+wM97f3lljRXHgu8c/0y1eX7UmL8utdVTiE5KnwDaG37ERDpsnS
7ep4J0eZDA+WDkQ5w6AzjZM5dw8fXKt8Czxy1AExggTG+Y9G1R8wY002EDqAnycW
tVEx/jgVvWZq1ESwGZMUHpVpE2U072p43qwlidnnlSW27QkCDeZ2Hx6JMFKZJ9bA
k9igkSiDc+jtiihGkAz9kQPKIfGbUvEp3ZhOGHqqN/1iRDiwr4lIfbHT4oYqwMkc
fcTBARUrorQrDGXGiKmOmSXmzb79zmcE9cESlYugNBzqYSSXYNU=
=F1qQ
-----END PGP SIGNATURE-----

--qjNfmADvan18RZcF--
