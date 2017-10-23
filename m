From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL] clk: tegra: Changes for v4.15-rc1
Date: Mon, 23 Oct 2017 09:39:20 +0200
Message-ID: <20171023073920.GA3802@ulmo>
References: <20171020121412.10527-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171020121412.10527-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2017 at 02:14:12PM +0200, Thierry Reding wrote:
> Hi Michael, Stephen,
>=20
> The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f6=
6e:
>=20
>   Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)
>=20
> are available in the git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-4.15-clk
>=20
> for you to fetch changes up to e4e2519df9928ae923205759176599969f344cd4:
>=20
>   clk: tegra: Use readl_relaxed_poll_timeout_atomic() in tegra210_clock_i=
nit() (2017-10-20 13:37:45 +0200)
>=20
> Note that this pulls in parts from two other tags that are going to go
> in via the ARM SoC tree. Those are needed to a couple of resolve build
> dependencies.
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------
> clk: tegra: Changes for v4.15-rc1
>=20
> This contains cleanups and minor fixes for the Tegra clock driver.
>=20
> ----------------------------------------------------------------
> Bhumika Goyal (1):
>       clk: tegra: Make tegra_clk_pll_params __ro_after_init
>=20
> Dmitry Osipenko (4):
>       clk: tegra: Add AHB DMA clock entry
>       clk: tegra: Correct parent of the APBDMA clock

Hi,

looks like I was a little too quick on the trigger on this one and
missed a regression that this introduces.

Can we hold off on this for a little? Jon should have a fix for this
within the day.

Thanks,
Thierry

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlntnKUACgkQ3SOs138+
s6H/xBAAoxmHEy24EyT3t1kfgq5g+awxB01g6IilUe/aIbtjTsqnEowtBLjylL8l
Sarid5hFqZJXCkuolJM8uZftC1q/O/5M+vXGNuyp1+LP1RZ+8/fD/EkQCr0SK/kK
sAofOyP8pMJbFjJJ6aQQhGRj9Vq+1ArIstcNOV+EW+aXGu6gQ/KmsWdWCBVk7H2M
uBgVGwIcNJ+bVe0TuVomAxgysVveTU0tUmabWV4f018Da5xZYAdA2YyzWp59J4J/
07agyXx1oEvGQpZWQ12kkQH8/7TJT/nhfyjPLFygV5k3DRU82pkDUL6JxI/Hiqj2
QQeKYmmDIJYJMO9OUK+EG8LjPhH1W3imBs4D5I3Gkf8I9XvRa/5EWdfiyHwZFck+
Id0XUs0FKP36b4Asuq4ywgZyixfsGPSOsLJuHLMUGdmjJvF4Ed2pRlV+X6jt7FqK
TjakVTKhKAk9XlXM7uh4vHCwafKe3paZ3vfxahStDk2B8Mp0HwLMqwiikYpNk627
Lyw4EWdmrr08XxkFXGV82i7oaKShDgmnRTS8WSPn2nqhUSZcxk7qJEqXAEI0xFLg
MYbNFcBDI2NpImBjNEVX+6RY043RAZ1B7dpKBN8DrTSM2pyRN8JWCBylSoZ3MsD6
K9WCJJom0NnR+jpng29KagfKvu3jM3WPQnHZ+fYRxL/GwpoWogc=
=hTNM
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
