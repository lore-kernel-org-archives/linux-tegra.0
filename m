From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] soc/tegra: fuse: fix build break due to missing
 linux/module.h include
Date: Thu, 4 Jun 2015 10:14:33 +0200
Message-ID: <20150604081432.GG29060@ulmo.nvidia.com>
References: <alpine.DEB.2.02.1506040728080.12316@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1506040728080.12316-rwI8Ez+7Ko+d5PgPZx9QOdBPR1lH4CV8@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 04, 2015 at 07:28:48AM +0000, Paul Walmsley wrote:
>=20
> tegra_defconfig builds are broken on next-20150603:
>=20
> ----
> drivers/soc/tegra/fuse/fuse-tegra.c:171:1: warning: data definition has n=
o type or storage class [enabled by default]
> drivers/soc/tegra/fuse/fuse-tegra.c:171:1: error: type defaults to 'int' =
in declaration of 'module_init' [-Werror=3Dimplicit-int]
> drivers/soc/tegra/fuse/fuse-tegra.c:171:1: warning: parameter names (with=
out types) in function declaration [enabled by default]
> drivers/soc/tegra/fuse/fuse-tegra.c:171:1: warning: data definition has n=
o type or storage class [enabled by default]
> drivers/soc/tegra/fuse/fuse-tegra.c:171:1: error: type defaults to 'int' =
in declaration of 'module_exit' [-Werror=3Dimplicit-int]
> drivers/soc/tegra/fuse/fuse-tegra.c:171:1: warning: parameter names (with=
out types) in function declaration [enabled by default]
> drivers/soc/tegra/fuse/fuse-tegra.c:171:1: warning: 'tegra_fuse_driver_in=
it' defined but not used [-Wunused-function]
> ----
>=20
> This is due to the intersection of commit
> 436b6428b9cc97f61721f335eb9d8010751a337e ("soc/tegra: fuse: Unify
> Tegra20 and Tegra30 drivers") and commit
> 5ebbb3badaa8ffc50558af88cdea27497953356a ("module: relocate
> module_init from init.h to module.h") in the linux-next tree.
>=20
> Fix by replacing the linux/kernel.h include in
> drivers/soc/tegra/fuse/fuse-tegra.c with a linux/module.h include.
>=20
> Signed-off-by: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
> Cc: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
> ---
>  drivers/soc/tegra/fuse/fuse-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I've squashed this into the offending commit, thanks.

Thierry

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVcAjlAAoJEN0jrNd/PrOhNWQP/0imK4s5WEA4CJbjio+4X/Cl
/nFWHC7D8IZemzJvlnVsoteRio6eOFihbOqcu0yX191u3i3kpo4eEZUV1aSix2P9
qu/pNQGOBGPMrr65DYxHHisQQUCeOU1QXribzB7uqgIK6r3rVcpDvMEjq7JrGRQy
ZaOA3oDjWjsGjo5parSprFx80lntD4OH8u9gDHbiCJNjlf+bbswMeTgaGnkpcGuq
a+MonOgQjHi85d/Yj9Edwt4uhFZhodaYr5K5KzUUnaH/QtGgqOLtJ3ai+bKCpVKI
qqhk1YnrjrHmkQM/3Zf34bsYt4xu7OuGgBxR8rADTjSpUrNdKzyebh+OL7WK8+BM
jtQadywO9UlUwFC6Su8OOhuGDssvXYoBKf/6I5K7b/lgEKMEdxxRo16dxprz2fzD
mCJE7ugTRbF7mnOp4A4NkKTSfe5fCEEQvC9i0gw3tjleyUDQQzMpxRrSbhAbLdxs
v5vRkh/7ccVHfD5FlqLf9A/aPKxKNwH7CNqEnMH7U4s7xvzXXR+eR3zq0E8WVKMo
8DX8Pw8wuZhV41TjNYnhThH5jcux+zWoDPUcDivx1mRh7Ki4VLsJGFmxrgFrpA3Y
YdsjgPRXPRltrx8Tofi0xM8P5MQ1ybDbso1hiprYpDbrd6co7JHB31/gIw7Zz6Ma
/8aRVmfQ3CA0akaQyFJU
=AvkW
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
