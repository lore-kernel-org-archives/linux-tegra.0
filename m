From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] soc/tegra: pmc: Drop SMP dependency from CPU APIs
Date: Thu, 13 Dec 2018 17:07:46 +0100
Message-ID: <20181213160746.GA13531@ulmo>
References: <1544694374-21231-1-git-send-email-jonathanh@nvidia.com>
 <154469574166.19322.12426804406101736786@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <154469574166.19322.12426804406101736786@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 13, 2018 at 02:09:01AM -0800, Stephen Boyd wrote:
> Quoting Jon Hunter (2018-12-13 01:46:14)
> > When CONFIG_SMP is disabled, the tegra clk driver now fails to build:
> >=20
> > drivers/clk/tegra/clk-tegra30.c: In function =E2=80=98tegra30_cpu_rail_=
off_ready=E2=80=99:
> > drivers/clk/tegra/clk-tegra30.c:1151:2: error: implicit declaration of =
function =E2=80=98tegra_pmc_cpu_is_powered=E2=80=99 [-Werror=3Dimplicit-fun=
ction-declaration]
> >   cpu_pwr_status =3D tegra_pmc_cpu_is_powered(1) ||
> >     ^
> > Fix the above error by removing the CONFIG_SMP ifdef around the
> > declaration around the PMC CPU APIs because although these are not
> > needed for non-SMP configurations, there is no harm in including these
> > for non-SMP builds either.
> >=20
> > Fixes: 61866523ed6e ("clk: tegra30: Use Tegra CPU powergate helper func=
tion")
> > Reported-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>=20
> Can I pick this into clk tree? That would make the compilation bisection
> hole very small. I could even reorder the clk-tegra branch to have this
> before the user so the bisection hole doesn't exist.

Fine with me:

Acked-by: Thierry Reding <treding@nvidia.com>

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlwSg88ACgkQ3SOs138+
s6GDthAAvY+4cuzyu4JZ64bkge2/tvYK0NzW6w1ra0K+S4b1cYSW6+Sr1wdUYNEp
Rzucht/l+Ez8DEVVHtDo32ld0JbwydYsAyB87ZTHxhkItFVdiGMdX05IH32QvJlg
gH+xZ09xtFsZNAvXuxXkaDQO1k9la61kUCcx68UCphucIjkd3jZKEGmykfptlpws
Miti4+By4X6C8VEBuhwdg+TiI04NsHRCntRZi8ZSwam5b5vGOX0zaFM1UZK9YWYa
BPI4Dmhfk039UUod1t8uJZH/oobYBsnCR9vUgL/wotxohkAHBIBr+AeAC4CD3ptU
tBpT2EYxEKvZquNBc1zDoE0ocNeDgvNf3gX4Revw9MgE7nzroCqB1jshY0dl2pkN
MDyAkgVpc97VN8RY7irZ8jiDqfYTQsCzqlp1A64PnEY5aObQQzSnhly65k6Iwd7n
X2OPiVKhCKhcE3/dXS6N+VDrITF7CCz/LvR2GaG/dUjBM/p1JW5IzFbdui65AyQo
15qCADrluYnuj8jbZhxRaf78nC18btexROGSRvgRmwZzOsVZwHnFKPN0MSAynBcL
TIwQ8LcujpC4o923UJVXZlVgn6bPfbHDX7N6njXNtqZLWw+Y/bykbmlGxI9umovE
Qt3oOVmFqIqYJAPBVr6Gd5NYtvsjkf0l+cUomZSMuDXRxbfR7ts=
=VQSX
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
