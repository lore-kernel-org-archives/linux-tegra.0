From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 14/16] PM / devfreq: tegra: Enable COMPILE_TEST for
 the driver
Date: Tue, 4 Jun 2019 16:18:24 +0200
Message-ID: <20190604141824.GC397@ulmo>
References: <20190501233815.32643-1-digetx@gmail.com>
 <20190501233815.32643-15-digetx@gmail.com>
 <20190604112026.GN16519@ulmo>
 <ed2c502f-8f49-d89b-32c6-4b5415e1fa47@gmail.com>
 <20190604141031.GB397@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="m51xatjYGsM+13rf"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190604141031.GB397@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--m51xatjYGsM+13rf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 04:10:31PM +0200, Thierry Reding wrote:
> On Tue, Jun 04, 2019 at 04:53:17PM +0300, Dmitry Osipenko wrote:
> > 04.06.2019 14:20, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > On Thu, May 02, 2019 at 02:38:13AM +0300, Dmitry Osipenko wrote:
> > >> The driver's compilation doesn't have any specific dependencies, hen=
ce
> > >> the COMPILE_TEST option can be supported in Kconfig.
> > >>
> > >> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> > >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > >> ---
> > >>  drivers/devfreq/Kconfig | 2 +-
> > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
> > >> index 56db9dc05edb..a6bba6e1e7d9 100644
> > >> --- a/drivers/devfreq/Kconfig
> > >> +++ b/drivers/devfreq/Kconfig
> > >> @@ -93,7 +93,7 @@ config ARM_EXYNOS_BUS_DEVFREQ
> > >> =20
> > >>  config ARM_TEGRA_DEVFREQ
> > >>  	tristate "NVIDIA Tegra30/114/124/210 DEVFREQ Driver"
> > >> -	depends on ARCH_TEGRA
> > >> +	depends on ARCH_TEGRA || COMPILE_TEST
> > >>  	select PM_OPP
> > >>  	help
> > >>  	  This adds the DEVFREQ driver for the Tegra family of SoCs.
> > >=20
> > > You need to be careful with these. You're using I/O register accessor=
s,
> > > which are not supported on the UM architecture, for example.
> > >=20
> > > This may end up getting flagged during build testing.
> >=20
> > We have similar cases in other drivers and it doesn't cause any known
> > problems because (I think) build-bots are aware of this detail. Hence
>=20
> I don't understand how the build-bots would be aware of this detail.
> Unless you explicitly state what the dependencies are, how would the
> build-bots know? Perhaps there's some logic built-in somewhere that I
> don't know about?

So looks like COMPILE_TEST has a !UML dependency, so this might just
work.

Acked-by: Thierry Reding <treding@nvidia.com>

--m51xatjYGsM+13rf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz2fbAACgkQ3SOs138+
s6EVPQ//RJTh/O16G49hE/V1NKwMIvrjN0VRbtevQgW8YFY2rMhB4qNY26FNmeMs
SDIjDd/BzLZcAoNp6+sHi6REcEzsxu3bVPflg1wVLsxq7s3hUN5QhJgj+1WEfFSi
b2mnDba5eSQF+GMK02OzCBUYkeevFuRiG7T3r4gee3eklEVthAgdaKC/B4pPC6R5
SvPx6HY1NAPO4K/6I6dVD6V0M9y8+6wl5DnlmmpbILv8IvKuCFvDYrherRRfTi/1
GhmI/3HxABYmUJ2/0hqG29jYZzVkhQKhQBsWgGw99ChoBZBecNcrGgEqUkOrC3Yv
1KuPMsgo95Q53jf5wv4coYcurNigJbzbYaaQ0hisaccJ8+kWJvTPyN0cpDiLywo3
rGfdJ+WvIMHInOlc/QhqsPaXg/2KiJ01sbZqqChY7XFwJ34fJPXBVilOoIOHXuIT
KgLorQAXRfd1bf1Ldxwjo4aBs5X1Tl82c+XXcDgpMXF1x3A5UYDBbAFkryOx5eJs
3bLHldict3egH0v1/e9JWYViw6zA+HXWj1q7KRsilPA05gJsXfjYdvvv5JTljjKN
DLr95nZekLcTRCpGFLM9S/K269RYgWib92WdSBqItLQtWShLaT5lU4SS31PqpVs3
uLdwMmxwP04/ftK49Dr+3TCKJ/35XeEVE1SM2nviTu5Dk0ZRDpA=
=kAOC
-----END PGP SIGNATURE-----

--m51xatjYGsM+13rf--
