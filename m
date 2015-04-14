From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/9] ARM: tegra: collection of enhancements/fixes
Date: Tue, 14 Apr 2015 14:52:24 +0200
Message-ID: <20150414125222.GB13446@ulmo.nvidia.com>
References: <cover.1428700856.git.marcel.ziswiler@toradex.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FkmkrVfFsRoUs1wW"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cover.1428700856.git.marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt@kerne>
List-Id: linux-tegra@vger.kernel.org


--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2015 at 11:35:55PM +0200, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
>=20
> This series is a set of patches accumulated over Easter ultimately
> bringing HDA audio to Tegra30 devices.
>=20
> Marcel Ziswiler (9):
>   ARM: tegra: Cardhu device-tree comment spelling fix
>   ARM: tegra: fix hda2codec_2x clock name for Tegra30
>   Documentation: DT bindings: fix hda2codec_2x clock name for
>     tegra30-hda
>   ARM: tegra: add Tegra30 HDA support
>   ARM: tegra: fix hda2codec_2x clock name in Tegra124 device tree
>   ARM: tegra: enable watchdog in defconfig
>   ARM: tegra: enable HDA in defconfig
>   ARM: tegra: colibri t30: activate stmpe811 touch controller
>   ARM: tegra: apalis t30: fix pin muxing and add HDA in device tree
>=20
>  .../bindings/sound/nvidia,tegra30-hda.txt          |  8 ++--
>  arch/arm/boot/dts/tegra124.dtsi                    |  4 +-
>  arch/arm/boot/dts/tegra30-apalis-eval.dts          |  5 +++
>  arch/arm/boot/dts/tegra30-apalis.dtsi              | 46 ++++++++++++++++=
------
>  arch/arm/boot/dts/tegra30-cardhu.dtsi              |  2 +-
>  arch/arm/boot/dts/tegra30-colibri-eval-v3.dts      |  4 +-
>  arch/arm/boot/dts/tegra30-colibri.dtsi             | 44 ++++++++++++++++=
++++-
>  arch/arm/boot/dts/tegra30.dtsi                     | 15 +++++++
>  arch/arm/configs/tegra_defconfig                   | 10 +++++
>  drivers/clk/tegra/clk-tegra30.c                    |  2 +-
>  10 files changed, 117 insertions(+), 23 deletions(-)

This duplicates a lot of a series that I've been carrying locally for
quite some time but never got around to posting publicly. Sorry about
that. I'll rebase what I have on top of this and then take this for
v4.2.

Thanks,
Thierry

--FkmkrVfFsRoUs1wW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVLQ2GAAoJEN0jrNd/PrOhbEsQAJ8T/lN5ad5H5cEyVJXgY72F
y38zVsaF8KKQk5pLKn37JdGMHKD6PPRB46XVKKUjrkM2ptHoxOLD0noBvasH8HmS
p+U8Nxuqe50aHVOzmfjnPAnnSEOWfMf0GN2qlj5qFaAHsHl4AdGInSiLHf9nl3yh
Zn7x8U7aUN2erl28T7Em5nq6ZJ+p690V6tbnzsN2i0Iw9lwkDTO5XxBAbW/C41du
Wd1p42yb/hO2PTBNNEPdQYa8fOXKEOstyck+YsDaLLWvllQoHVkZd/caUc6Wzu7G
0xs/M71WfwMDY5cHILQ4T1CFNLWOAP6P37OpgEms06wS04AsJCCCuoP1f5aKZUmZ
rSNkZehBGbt8C9TCO2IGqGa41SWP01Jl/fG5vfYAlC6/sgj3Nu4ZsZGo1RZVy9aG
KySrFdH9mPo9kFDUwkCvCP61vGhslkacGm2Tk1G0QCXMNwRG5R9tu8m9x0dLiYY4
4p8zRq1vS6tY7GQ9UNkQw2JkcA5Nft9CyBUvMD+jNBwaP4B6rvcc1lTTgIti5RdT
OH33JuXGcmjm9sEs0sN851pco3g2LupRPZXcuz+3gRFDlIdnD3zNu21zomI6KVog
M1EDqaHoQ9F24o8Wnn3kSQqGBNGMP9yqpg7xEd0Jo8dmxbo5Hi97Voeoo0b3RTAE
z5v/RzJpBw/w4Q/gDvUF
=mRx7
-----END PGP SIGNATURE-----

--FkmkrVfFsRoUs1wW--
