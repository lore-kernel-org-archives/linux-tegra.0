From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 2/3] clk: tegra: ignore unused vfir clock shared with
 uartb
Date: Wed, 28 Nov 2018 10:24:04 +0100
Message-ID: <20181128092404.GF17419@ulmo>
References: <20181101015230.27310-1-marcel@ziswiler.com>
 <20181101015230.27310-3-marcel@ziswiler.com>
 <20181101084152.GS7636@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="924gEkU1VlJlwnwX"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181101084152.GS7636@tbergstrom-lnx.Nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Marcel Ziswiler <marcel@ziswiler.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Stephen Boyd <sboyd@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--924gEkU1VlJlwnwX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 01, 2018 at 10:41:52AM +0200, Peter De Schrijver wrote:
> On Thu, Nov 01, 2018 at 02:52:29AM +0100, Marcel Ziswiler wrote:
> > From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> >=20
> > As UARTB and VFIR share their clock enable bit it is rather unwise for
> > the kernel to turn off the VFIR one should that be unused (and
> > potentially vice versa but so far there anyway is no VFIR driver).
> >=20
> > Without this patch trying to use UARTB with the regular 8250 driver
> > will freeze as soon as ttyS1 is accessed after boot. Luckily, using the
> > high-speed Tegra serial driver won't exhibit the issue as clocks are
> > dynamically enabled/disabled on every access.
> >=20
> > This has been reproduced both on Apalis T30 as well as Apalis TK1 but
> > may be an issue on all Tegra UARTB's which share the clock enable with
> > VFIR.
> >=20
>=20
> Ah.. the correct fix for this is to initialize the enable_refcnt based on=
 the
> hw state. This is done in 9619dba8325fce098bbc9ee2911d1b0150fec0c9 for
> periph gate clocks, but obviously also applies to normal periph clocks.

Hi Marcel,

were you going to send a new version with the alternative fix as
suggested by Peter?

Thierry

--924gEkU1VlJlwnwX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlv+XrMACgkQ3SOs138+
s6GXtg/+IuuqToPbfBDICYwJJQ8uXHPGJXDS+Z7bthtYwuqo5M2r3s5Bvnxek+Sn
hGHjVuPBc5vcM/JoD2UrSO086bREgody0yDunjDQdQDCkw1sJ/JM3YUz7amHabkg
mWrEKDaf7k9Xs4KKBHyq67mpgn/WA2+Zyjtp7LX6sYGFaKTe2Qa8NHUtVdh0YKTL
Mie6WfoFjpSkx/YghDIV8WorY8SLa9mN698H2f75HTAWRF2UaVj+VtbGrYWlUWzy
NP14u8Gp4yYqQ/Xv3Lq0rtEDUA8u7QedSh8ICYAPyEUljbi1tVuyeHSjktLHFUrF
bCeqyLgePdq5icyF2ipPmW4kx6Nsy6iMwlbQeDWwg8Dw4WNo6qZPhWwsG/LVCQiq
L30BlkmKG75J4urufG8uRvIKzRNhd9t4ABWVOrbM+XyPB8gE/I3u3WrSvygIyGXl
PL+QWQzUMJMW+PLnGa7ZVEZJn6CwB/fHpxq/HHiNZhPK+v1K1ww54cwRue2+RjXm
A8A4bwXD5A+qU0EWUZZo0mk7TsUgAaeLY5sFI0fEKMNXtL6m2ceOGhipQjA8cVOr
2V2bFCetZJGtPezJVUuhzGEZRd+R46FvhNDkGPA2xQ80Fbenja2DBZs+e78XTrXu
bLnF79vVm+dzUoeV1D/XLaBBzkHJ1mKW/ZFBtQiCJm7G/AT3Zo0=
=cuvx
-----END PGP SIGNATURE-----

--924gEkU1VlJlwnwX--
