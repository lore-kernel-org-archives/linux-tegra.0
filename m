From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 2/8] clk: tegra: Export functions for EMC clock scaling
Date: Tue, 10 Mar 2020 18:06:23 +0100
Message-ID: <20200310170623.GB3079591@ulmo>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-3-thierry.reding@gmail.com>
 <8e1f11e9-a95a-500f-ff44-6f44ad990863@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DBIVS5p969aUjpLe"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8e1f11e9-a95a-500f-ff44-6f44ad990863@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Joseph Lo <josephl@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--DBIVS5p969aUjpLe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 07:13:25PM +0300, Dmitry Osipenko wrote:
> 10.03.2020 18:19, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Joseph Lo <josephl@nvidia.com>
> >=20
> > Export functions to allow accessing the CAR register required by EMC
> > clock scaling. These functions will be used to access the CAR register
> > as part of the scaling sequence.
> >=20
> > Signed-off-by: Joseph Lo <josephl@nvidia.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v5:
> > - remove tegra210_clk_emc_update_setting() which is no longer needed
> >=20
> ...
> > +EXPORT_SYMBOL_GPL(tegra210_clk_emc_update_setting);
> ...
> > +extern void tegra210_clk_emc_dll_enable(bool flag);
> > +extern void tegra210_clk_emc_dll_update_setting(u32 emc_dll_src_value);
> > +extern void tegra210_clk_emc_update_setting(u32 emc_src_value);
>=20
> Why these exports are needed given that the EMC driver is built-in?

Let me try if I can make the driver tristate. Given that it's fairly
large it may be better to keep that as an option.

Thierry

--DBIVS5p969aUjpLe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5nyQ8ACgkQ3SOs138+
s6FOXhAAocJcbbDxFJK3TvLJTTuZlywjEwIb3UcWO1BERHW2K7hEx8rNt2UqhoGu
EoqVqjO7HnXaOT++1BbSFSRP3ye4ErmWyQcSRKSObSl20m+lGvWgvv1Chk8jCJha
uJ47NctrQMiBD0lb/Ip7vup/4Qqi6WjJpLNfvct92NFTGty6TuwFAV39r4L874wd
yEryO/AwteBrAClEMLH8SS+bZwHSWy5jCHuirgGxe0ck29Hx5kBUb4HAmiMQxJH3
v0dNrkzAXl+dd98s93uI7ocOWtiKjQWJiQJ8mSDVLnmClkiPjFnRDvgu3TkbAQEh
BLAgRFgmaCTmKvdD8LBlA88W0DVP3J5bx6iQKMOrYvJ95PmntiDtURq4rmXRXl/v
BX7KUlkV3eXTLkukY2r/z4uHOhOCdo1LD6/12jzezVLSA32Uw6QXeyuDa2Cg7Hc6
C99avAx0XUVVjGr++9yY1Rn3jpLEvBsAWk6tjNNXn2a/5+l5ygCjvDfZeOKl//j8
6Mcsw4ML1Lj/CV52+YM2rtAwXr3hRCpwGHPEN9K5i+mozudHb4TOV3Yt3KTEGUW/
3rdlIPacpzyQmM8+xUp2E4oF4PqGqgp2wllYb8NNC7MFXDzp1JwXUvCAVabOnaw3
xqcijH1JXc4rsCeUVNMD4rE/PQkrq0mFfPMd8Jv4I9RqY4FkZPI=
=x6Nz
-----END PGP SIGNATURE-----

--DBIVS5p969aUjpLe--
