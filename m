From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] soc/tegra: Implement Tegra186 PMC support
Date: Wed, 8 Mar 2017 13:52:14 +0100
Message-ID: <20170308125214.GE29118@ulmo.ba.sec>
References: <20170223171157.13860-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qOrJKOH36bD5yhNe"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170223171157.13860-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--qOrJKOH36bD5yhNe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2017 at 06:11:57PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The power management controller on Tegra186 has changed in backwards-
> incompatible ways with respect to earlier generations. This implements a
> new driver that supports inversion of the PMU interrupt as well as the
> "recovery", "bootloader" and "forced-recovery" reboot commands.
>=20
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v2:
> - add Kconfig symbol for old and Tegra186 drivers, build conditionally
>=20
>  .../bindings/arm/tegra/nvidia,tegra186-pmc.txt     |  34 ++++
>  drivers/soc/tegra/Kconfig                          |  13 ++
>  drivers/soc/tegra/Makefile                         |   3 +-
>  drivers/soc/tegra/pmc-tegra186.c                   | 185 +++++++++++++++=
++++++
>  4 files changed, 234 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,te=
gra186-pmc.txt
>  create mode 100644 drivers/soc/tegra/pmc-tegra186.c

Applied to for-4.12/soc.

Thierry

--qOrJKOH36bD5yhNe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAli//n4ACgkQ3SOs138+
s6EsLxAAvpcfiya0C2jYO4ZgRCLiHYVbEW9pCguGIMTrX9U/AvgAFaHZh5miA6pM
yOlMu0If7evMoWC5L0vjJt0S4b0QzuHGCAU1lxdErrTXxPOKbfN2Pj7YO9Bmk/b1
X+yBtyDLPeGPRJ3HJOdO4sakwKUfBe8pJHulpRcUY7LKadAa1J48h9vFbpLwYHC8
wCBcnaRNuA+profP8EDs1XfeLbrdW6wHHnJjHuYjX4Xq7mXdsl5rg22BhVBHIpVq
6FdRrY7oNdPiMgksD7vtOa95sIBLF9wfBGvHudgZ5yHpYsKa24MlKryOkMTtrXG5
R21S2jvg/K2Hb+gGJc/SsBEgZih2g0Rv5qIogbR0164+XjMhJ1TdIT48oganPEhg
afkkX5iEJi1OCaqxmsPZny9lfDvTID4PHEtz2byNzyZF+9efrr3/iMstcBOo6gpe
HiSfjwacNlyu6ssJ+J1N2X3nbgMe8jQ/iD80gRl4NTyJ8Ynpk/FBExpsEFM29Ki0
rL2YNKot9jbJ/gVMwiaQe+yvyxLMhNZyaWKoCQo2iWbZeswh2FDPvb6/cIFpPNqL
/VbYVecvkt6B4ytScfHotE8u3CK+syUwD7/TiNfuHRc51n3PsUvZ950z4Sua9roC
IXUwWulj1+dyJNGchyVPHZsP4DbQt41cReFFR+kvf1weldni6ts=
=vc5L
-----END PGP SIGNATURE-----

--qOrJKOH36bD5yhNe--
