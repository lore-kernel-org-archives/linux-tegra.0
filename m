From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1] clk: tegra20/30: Optimize PLLX configuration restoring
Date: Tue, 29 Oct 2019 14:17:14 +0100
Message-ID: <20191029131714.GD508460@ulmo>
References: <20190922215203.32103-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="C1iGAkRnbeBonpVg"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190922215203.32103-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--C1iGAkRnbeBonpVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2019 at 12:52:03AM +0300, Dmitry Osipenko wrote:
> There is no need to re-configure PLLX if its configuration in unchanged
> on return from suspend / cpuidle, this saves 300us if PLLX is already
> enabled (common case for cpuidle).
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clk/tegra/clk-tegra20.c | 25 ++++++++++++++++---------
>  drivers/clk/tegra/clk-tegra30.c | 25 ++++++++++++++++---------
>  2 files changed, 32 insertions(+), 18 deletions(-)

Applied to for-5.5/clk, thanks.

Thierry

--C1iGAkRnbeBonpVg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl24O9kACgkQ3SOs138+
s6GMDw/9GSfkmhdfZL9cfuprPRnzlzsiv7vNiAunAYdVGTo+4P1Z2dPgJLS0dvpp
ZIHYnGem1kSVNGMMG460niQbkyXSB4+xLrCVdIjyVHX13uEMOWItkB1bLKBR/8qQ
vTCCMfmJaOeir4eVpNTh3+5H2CKN8lkv4IT+YqCEsAhDZjVSLLcHf4a663WZkrHP
MFpYJCyp5/lSE1XiQfPb3FVPuLl/cU2vFquqO1zarkE4g5PnzQEmZpSUfCHM92+c
3RakZe+tsuAVOusNC38q4Hec4MTOgSu9aK+u9yjfuHokyDlo1UKoouruRZ6PvMm1
IfR/6zIJWUhDv9bQfID70rJuhHzI9VntNl8stLbcb//aPJk7xeySDKEeZkGw1MQQ
I6cxgareAOir2XcSqXxuDTRx2bsBgRj7FYODXvUaQjEL5mZ8p7hOLvmrn31ZM/Q0
sx1hZ/0lJTZd4qg+nUffxojUETrVTCOSc2K2r7dl8J1o2XJ2kxswePLBSHTimFq2
4uQEtYycToltWXl8c/Xjls87NDsypY7NAmY3Zc/8AKcUhNqfpTxiVqJ0V72y4Ic4
+i3bxOLUE6Tp9FBHbFLs4hEGJIw+gfc/JrthBFMsd2/vJzjcApOQLPIPaAiqf4a2
LSYvYetgeLoIU5SufwYnLKAOSVgj/O+AqEhdC/+rW6SS+RZhK7Y=
=wjdE
-----END PGP SIGNATURE-----

--C1iGAkRnbeBonpVg--
