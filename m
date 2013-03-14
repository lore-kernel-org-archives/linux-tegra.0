From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 1/1] memory: tegra30: Fix build error w/o PM
Date: Thu, 14 Mar 2013 10:40:18 +0100
Message-ID: <20130314094018.GA23538@avionic-0098.mockup.avionic-design.de>
References: <1363252334-4672-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1363252334-4672-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Axel Lin <axel.lin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 14, 2013 at 11:12:10AM +0200, Hiroshi Doyu wrote:
> Make this depend on CONFIG_PM.
>=20
> Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/memory/tegra30-mc.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/memory/tegra30-mc.c b/drivers/memory/tegra30-mc.c
> index 0b97598..f4ae074 100644
> --- a/drivers/memory/tegra30-mc.c
> +++ b/drivers/memory/tegra30-mc.c
> @@ -268,6 +268,7 @@ static const u32 tegra30_mc_ctx[] =3D {
>  	MC_INTMASK,
>  };
> =20
> +#ifdef CONFIG_PM
>  static int tegra30_mc_suspend(struct device *dev)
>  {
>  	int i;
> @@ -291,6 +292,7 @@ static int tegra30_mc_resume(struct device *dev)
>  	mc_readl(mc, MC_TIMING_CONTROL);
>  	return 0;
>  }
> +#endif
> =20
>  static UNIVERSAL_DEV_PM_OPS(tegra30_mc_pm,
>  			    tegra30_mc_suspend,

Reviewed-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRQZsCAAoJEN0jrNd/PrOhnmYQAJrN0S9XON566kglm1yuZrJO
HDniJfgM5mMZ7HzqeZtAM+bw+5ECKw5suzZ4zj0HUBuc4SXUtIzqWd6CASLXhzTo
G5OPJZ8+tXk1+ADlb9/MGK6K9TrWhX3Vu/CYwC2K+HIY48A79wGtg+KYV+ZMYe2c
ND4nZ5okJ+wv4buBJr6J8/89YJJAt8jaJQCoEVHjrRz3y12mkwwglb9bMdEisMk4
OgXIoYuswFtmYka6IL/zCTQaZnlu5taAXh+91pUggr94hlYRe8NC5zFtnGhdIoJB
glag/aSeIrwYOEOVLG2pdPi05VkRYmWKXtAeIm/2H62LYDeCk+9P0AigkKqfiORP
lM0lU2TOq0hQx3EJYGgOkoMP8AJzJBQLWWwoMR1L6D3Z5QOW7xKuF7mz+TXmydCL
OFEtMPGt+9m2megobO4N+xVA5p717OaCz9PljOePNtCQy4JIArcfeXCxypaAme+I
nkOlTWvJQ7dG1kcN9eDVaelS2yabmqDQRz77pw5WC0fHUy4nLH+TUOphwA4js5L2
nWLJf8T6WvVneaqSA5Wxkss7LZBddDjEbdZtYUPQutYhVYKxjkyT04B3RCOk0lCm
Xxdli64Fuf4F/JnQM1/Q69EbeIo6qRTO0FhoC9nrFMVhoyGcgWtxjKBcdACxVurK
u4KCVZx8qg+lKlbNHjnx
=p35M
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
