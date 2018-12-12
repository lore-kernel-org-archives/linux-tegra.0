From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] clk: tegra: fix SMP build
Date: Wed, 12 Dec 2018 14:31:27 +0100
Message-ID: <20181212133127.GB28521@ulmo>
References: <20181211143528.2024488-1-arnd@arndb.de>
 <154454887151.17204.5632248748272979028@swboyd.mtv.corp.google.com>
 <20c5f3a9-fd82-5634-6a1e-6384c0facece@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dTy3Mrz/UPE2dbVg"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20c5f3a9-fd82-5634-6a1e-6384c0facece@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Aapo Vienamo <avienamo@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--dTy3Mrz/UPE2dbVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 12, 2018 at 11:47:32AM +0000, Jon Hunter wrote:
>=20
> On 11/12/2018 17:21, Stephen Boyd wrote:
> > Quoting Arnd Bergmann (2018-12-11 06:35:07)
> >> When CONFIG_SMP is disabled, the tegra clk driver now fails to build:
> >>
> >> drivers/clk/tegra/clk-tegra30.c: In function 'tegra30_cpu_rail_off_rea=
dy':
> >> drivers/clk/tegra/clk-tegra30.c:1151:19: error: implicit declaration o=
f function 'tegra_pmc_cpu_is_powered'; did you mean 'tegra_powergate_is_pow=
ered'? [-Werror=3Dimplicit-function-declaration]
> >>   cpu_pwr_status =3D tegra_pmc_cpu_is_powered(1) ||
> >>
> >> I don't know if tegra works without CONFIG_SMP, but we can get it to
> >> build by making the calls conditional, and removing the pointless
> >> ifdef around the declaration. The assumption now is that in a
> >> non-SMP system, the secondary CPUs are always disabled.
> >>
> >> Fixes: 61866523ed6e ("clk: tegra30: Use Tegra CPU powergate helper fun=
ction")
> >> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >> ---
> >> Not sure if this is the best solution. If you think it's not, please
> >> submit a different fix.
> >=20
> > Hmm.. Is there any reason why the implementation of
> > tegra_pmc_cpu_is_powered() is under an ifdef CONFIG_SMP? I'd rather not
> > have to think about SMP or not in this clk code and have the
> > tegra_pmc_cpu_is_powered() function do the UP vs SMP code optimization.
>=20
> Not that I know of. I just think that the function should/would not be
> used for non-SMP.
>=20
> I was actually thinking that we could just leave the clk code as it is
> and simply drop the CONFIG_SMP from pmc.h. That would be fine with me.

Yeah, I'd be fine keeping that code around whether or not we enable SMP.
Chances are people won't disable it anyway. If they do, then most likely
only for testing purposes, in which case I'm sure they won't mind the
extra couple of bytes.

I think if we remove CONFIG_SMP from pmc.h we also need to remove it
=66rom drivers/soc/tegra/pmc.c to make sure these functions are available,
otherwise we'll likely run into linker errors.

Jon, is that something I can interest you in? If not, I can easily do
that myself.

Thierry

--dTy3Mrz/UPE2dbVg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlwRDa8ACgkQ3SOs138+
s6ErqQ//QQ8TEeMrDY6UGU+RVWmBAT861+B/UFDH2amF7nWsdc2tNy6KRyt6E69I
tgyq0i3u9evpjM9AxIQPsFMONTaaGzoe3wPsr4AVI+em7q3Ibf6EjJoaJz2JoKbq
nY8cjagondItryNeUpPEZ+HHKa2dDvjoe1WQHf8CQwoC+rQ1Zj2VVezSSWm8006o
aYLTuRwGpJJBaEB5/zioDtRJ5dDDVmC8Sl3nPbMfwmaK8baXuPfbPQY07rLBGrgq
eoa98WEY1SeitDYkFG+RY3u411A3h71WwoFGrcLhoP7U+lJjd2PDqjYHgTU7fmgY
tHLjEJ6PdiVSjURbbqj5lfiOL20c6jtkwMWf3XNlFI2+xgC980hjcLomIeYqvCdq
7Kj/ZGQ5EfzM9saSaTBEnynRJexSXhfz2bOZHREyW83aQnh8X+70hzdOQl/XWc/6
qdNN5YUHvJO5vfJ7qMOwkx0uRYe3sSgtN8sU76nfs79rI1QhoytDjXfICNuxFQKH
y5tbuHYBB19ijFG3Rm8JtKt1yFkKE3vuakFaLNGvcf+Xv39Rehd1fQ+kEifldEYd
y/uolwemubklv4UVgeWq2VgDQdEavu2IA2yjVxGcGLkHA40R8WEmIfBBavFjWVNi
zxEEql43bUaH7CkGWHDnjkKIbr9lMku2+ExoaNinGeoWhZOomdM=
=3mGj
-----END PGP SIGNATURE-----

--dTy3Mrz/UPE2dbVg--
