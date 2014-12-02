From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpu: drm: tegra: Adjust dsi phy timing
Date: Tue, 2 Dec 2014 10:37:13 +0100
Message-ID: <20141202093712.GB6135@ulmo>
References: <1417481522-32110-1-git-send-email-davidu@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EuxKj2iCbKjpUGkD"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1417481522-32110-1-git-send-email-davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--EuxKj2iCbKjpUGkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Please use the scripts/get_maintainer.pl script to find the correct list
of recipients.

On Mon, Dec 01, 2014 at 04:52:02PM -0800, David Ung wrote:
> Fixing DSI phy setting of HS trail timings.

You're going to have to explain /why/ you're making this change and
describe what exactly this fixes. DSI works fine on any of the boards
that I have, so I'm surprised that this would need "fixing".

Also: "phy" -> "PHY".

>=20
> Signed-off-by: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/mipi-phy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/mipi-phy.c b/drivers/gpu/drm/tegra/mip=
i-phy.c
> index 486d19d..974bc68 100644
> --- a/drivers/gpu/drm/tegra/mipi-phy.c
> +++ b/drivers/gpu/drm/tegra/mipi-phy.c
> @@ -34,7 +34,7 @@ int mipi_dphy_timing_get_default(struct mipi_dphy_timin=
g *timing,
>  	timing->hszero =3D 145 + 5 * period;
>  	timing->hssettle =3D 85 + 6 * period;
>  	timing->hsskip =3D 40;
> -	timing->hstrail =3D max(8 * period, 60 + 4 * period);
> +	timing->hstrail =3D 3 * period * 8 + max(8 * period, 60 + 4 * period);

My recollection is that I took these timing values straight from the
D-PHY specification, so you're going to have to explain why this is
necessary and where you took this from.

Thierry

--EuxKj2iCbKjpUGkD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUfYhIAAoJEN0jrNd/PrOh2EkP/jqKcZqB6RxM6xFH2e5jVKyL
kn+Tvb2aj4qq4dmHVlcX6AJQ4MrATLm+npLYDpSBq8d6HVAxnWG1nE08iBAUwlK0
Uq0hGP9P/dINVF5C1P89lphHT6sHaaNYWs2RZcigLX6uQKMcFN61Q/Mk60AZ0Gq8
U7hbWlMp7iGZyc9es0WG+80jhMX9r68mOzgw23x4h8dM/CN7r6JqPRY5IoqFzjvs
D74jBwMouxuNLu9KE33eUVxthWr4IDp2n+R1ROW2S0NgAz6BI1u4CKcIS2dCSJgD
MOHqCadSgMjz0N0YhCpfUKM0gRoNag8C1ysGQORrANTekTie0Ro9OfR7KtKysr4B
qKULQDCrYg1zvrR1Y6ny8XDQwocbkmGuLAXD3Zh/QLz7Ip4Ky8rpEKIrm8xoByk2
JgvllF1FNUWNnnxlxYPSDXjWBlZfC9mppkMjVArnBi7hou7vvrc0SE2gbqHf9B+b
0XGDn8tpAq9l8DCaVAIIOE5YHUQgQZN6EFlgYGDVzVHPXeAVqKnyt5knx2NaTFN8
AEvwUGeFpdRu/zXXfkOgVgWFJAUt/LadUncliYFLWnyqR3LtIQP7yQeKi7eawBfi
8D1xTyL6ZCvgTrJqJvCwuQef+Q+tP/abnZXHTgjwLUUcvScYYIBfja9C29wpPAaD
Q0JxeY9N5V5VTapPN3re
=ZTB/
-----END PGP SIGNATURE-----

--EuxKj2iCbKjpUGkD--
