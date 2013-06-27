From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] ASoC: tegra20-ac97: Convert to
 devm_ioremap_resource()
Date: Thu, 27 Jun 2013 12:22:12 +0200
Message-ID: <20130627102211.GC15081@mithrandir>
References: <1372245608-15596-1-git-send-email-broonie@kernel.org>
 <1372245608-15596-2-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oTHb8nViIGeoXxdp"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1372245608-15596-2-git-send-email-broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--oTHb8nViIGeoXxdp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2013 at 12:20:08PM +0100, Mark Brown wrote:
> From: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>=20
> Signed-off-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  sound/soc/tegra/tegra20_ac97.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
>=20
> diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac9=
7.c
> index d8c142d..9043626d 100644
> --- a/sound/soc/tegra/tegra20_ac97.c
> +++ b/sound/soc/tegra/tegra20_ac97.c
> @@ -341,18 +341,10 @@ static int tegra20_ac97_platform_probe(struct platf=
orm_device *pdev)
>  		goto err_clk_put;
>  	}
> =20
> -	memregion =3D devm_request_mem_region(&pdev->dev, mem->start,
> -					    resource_size(mem), DRV_NAME);
> -	if (!memregion) {
> -		dev_err(&pdev->dev, "Memory region already claimed\n");
> -		ret =3D -EBUSY;
> -		goto err_clk_put;
> -	}
> -
> -	regs =3D devm_ioremap(&pdev->dev, mem->start, resource_size(mem));
> -	if (!regs) {
> -		dev_err(&pdev->dev, "ioremap failed\n");
> -		ret =3D -ENOMEM;
> +	regs =3D devm_ioremap_resource(&pdev->dev, mem);
> +	if (IS_ERR(regs)) {
> +		ret =3D PTR_ERR(regs);
> +		dev_err(&pdev->dev, "ioremap failed: %d\n", ret);

Can you please remove this error message as well, please? A message to
the same effect is already output by devm_ioremap_resource(). Other than
that, looks good:

Reviewed-by: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

--oTHb8nViIGeoXxdp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRzBJTAAoJEN0jrNd/PrOhChwP/12A2zxPmMXpZO6xrNiFKvYX
t7dTRL8NRsNTAg0NwENnlnsqVnTNm+tYmilXQJnISa2Gp6dQD+vrtwNI47t67VDw
8JVGVQFzsWe9iQnLYT/uGxhRLqtyF8IqOLEJYxbC7MYKDqFyerUDVflHka/lueQE
CvzDpNMBLB1/4f3X+tWWfDWJXZQT2LtEIyY5xfMydIdMOCDwZzvBN8wqN7mPt8fK
tVc8ijJiO5UpMr1xweq4dgzrVwvgUlHZeCLa1mG4Aq1yW59gVdX961gSBsuHdyQl
/EqiBa6vYyEKanBl3uXXE7xX8AVuLXZKthlrYl3skLv1x0OlQbwZM1zHDJOOX9X7
Ggz/E4re6u86Gw7LaaF+ebRw1WyEr/9NJ6/V0WWq4wBkh2Qb7xwq8rdNdOQP0iir
0e8DAXEQGB0W5m/R0cDP7tWNmTlz35Wn8ZzhIW8LxPB59l/d2Oc6i4pIe+huewZo
v2V1RPbcF6QDcqP3Q/ggBR/mvAzADOjYx2YZUUgl23fhKxkwEwZeKJ1ylsX5okq0
BsSjKykJG1d2YDU/9D0Au7M4as8386KysW6KsizGe+6ITTwrUJpGzDQB2Tmi8apo
ta46Tqo4Esb4gegbVS9L66g/js8RxvogbYKlQ+Y+Gmz5JBHxVE8cpcREIE2h6ZNT
tk7BWa9a8QP6UrQYK5p9
=Xj2a
-----END PGP SIGNATURE-----

--oTHb8nViIGeoXxdp--
