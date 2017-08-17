From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm: drm: tegra: Set MODULE_FIRMWARE for the VIC
Date: Thu, 17 Aug 2017 17:23:20 +0200
Message-ID: <20170817152320.GB30664@ulmo>
References: <20170711083904.6969-1-kwizart@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bCsyhTFzCvuiizWE"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170711083904.6969-1-kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 11, 2017 at 10:39:04AM +0200, Nicolas Chauvet wrote:
> The defines are set anyway to prevent an empty string.
> The test for the soc is same as nouveau for the tegra gpu firmware
> (see drivers/gpu/drm/nouveau/nouveau_platform.c)
>=20
> Fixes: 0ae797a8ba05 ("drm/tegra: Add VIC support")
>=20
> v2:
>  - Place the defines above each chip's vic_config struct
>  - MODULE_FIRMWARE() at the end of the file
>=20
> Signed-off-by: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/vic.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)

Applied, thanks!

Thierry

--bCsyhTFzCvuiizWE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlmVtOgACgkQ3SOs138+
s6FQhA/7BqSa+z0GyP93vfOzwmid7qSy4TMV+Jub+Z3wU+1k+9NcayCDRMDYzS2g
0VlIRUL6Irf63v0Xjh7wZPyuHdzgie/CZ4pC5PNpdz/bpmNjiKWGNXifwXSGDZHl
7WdNRzXtwiHmnErjjrPTkEQ3YzgkO3ZRhkva88bgB02yx05YrowVkrJobVcHGaS5
WEbB4iGIhbfH3lBfLvaIOX+r70Tb4gAtkvRuEQR0l8LuHRoQX2WXrPHtv/Uei7gB
h2c9Ifj8ZttFTGLDtgviUyOIenS4/ANFH/+xUBAO1gOisomk8wauhkk/juVZIb9T
quEzdVnTeFeHNl4qAcnoyZSJR7reFPdCsWz8shAuOW64PV2nPCmVVrZMYMdeRPp7
wfzWdEQ5O+r6ciM3Quj06AmeuzPOCOkgD0RxRR2t2Kv+wYDNarmaFQN+/8QkmKwk
geUcirkfo+aT41WHqXXdqHKQnBBm6PAUsIpoQHAsIZyxforBhPDzSZFrrJ52eCTW
6zNlbDX6/xLO4eI1Fyw4tZem76xmBNG1YZhTNjw4yhwQ0gAaP28Tme2xFiA5EfoN
IjjrMHGtgU766gff956RxEnw7ytYESnCMYivtJxLCSBFOdRxzX+V+/L79RrTeXCz
OmYd7fdc+fnqyhMisZcDdHyghjwnd1lW89eQVZLpWUkLW1bpEbw=
=/kRL
-----END PGP SIGNATURE-----

--bCsyhTFzCvuiizWE--
