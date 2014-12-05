From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] gpu: drm: tegra: Adjust dsi phy timing
Date: Fri, 5 Dec 2014 23:41:52 +0100
Message-ID: <20141205224151.GB21777@mithrandir>
References: <1417570823-19977-1-git-send-email-davidu@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1417570823-19977-1-git-send-email-davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: airlied-cv59FeDIM0c@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The subject prefix should be "drm/tegra: dsi:". Also make sure to use
the proper case. "dsi" should be "DSI" and "phy" should be "PHY". Also
the DSI PHY is typically referred to as D-PHY, so a better subject would
be:

	drm/tegra: dsi: Adjust D-PHY timing

One more comment below:

On Tue, Dec 02, 2014 at 05:40:23PM -0800, David Ung wrote:
> Fix DSI PHY HS Trail setting on Tegra.
> It is found that HS Trail is off -12% during compliance testing
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
>  	timing->init =3D 100000;
>  	timing->lpx =3D 60;
>  	timing->taget =3D 5 * timing->lpx;

Back when I wrote this code I envisioned that this could eventually be a
generic set of helpers that could be used across different DSI drivers.
As such, mipi_dphy_timing_get_default() obtains the default timings as
given by the D-PHY specification. Therefore you should be adjusting this
within the driver code rather than the default timings. And then make it
something like:

	/* comment explaining why this is needed */
	timing.hstrail +=3D 3 * period * 8;

That said, most of this code is in flux right now, so I probably have to
manually apply the patch. It would still be good to respin with these
comments addressed so that I can adopt the commit message and comment
explaining why this is necessary or what the consequences are.

Thierry

--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJUgjSvAAoJEN0jrNd/PrOhzUsQAIphkbJbKmSC0XykQhaEPEXt
5ETIvJuoWBHAOTggFY+llhkpwGCtsziY4jz9Qpqpi0dNtYo5OuZOzIXhilpxjIA1
rkxK5ilv3IAE2caCy9eq0vyldbRuTZku9xW95+Vpq2VdED+NCkTZRj6uYeDwB4We
O+nhkvvJ8FjddoTZv3kirQ5g7tRZOUM6GpZgj1dHYerM5nnHf10VDTLDXcWd4hYH
0zBH8PFG8IfcJFhHWDoPKwbC64GhYvDq4Ms4xFy63TZ/OYsN8ZJrULcDZ5R7ec2Y
/qV1LvR0CgmFc2gEratx84XmgwNLAOqaxFJBVUkec6iszrTACwkB89lAym4MJtDV
Fe6uAets805QgmdwMHcYQsoTU2+eSFx0B8RT9ZTO67ic9d4el1/d85bdiIq9f+c2
S44HzQ9+opY/rfDXs9V7vd/BJmv25MFK2CNv98kAkqXEfP0Rll+8cVzbHYIrCXqR
YW/cM4X1wUS+3CPD3b5womXNKHk8Pko+ohATRRW+iqKJwpD1JkK4KCT0uAbmhSq5
hYVZhEsKrGsivMxK1aKkTPMHnr2xZI2mfaY6Q8Lo85EPA8UlEZe6ddnlOVqbLkR+
J6ND2GXHeBK9EIkZqnqqQ3KIn7vnZy9yMQbYtf/bR1GwdClL1XYlOnsRGx7vKIeQ
EQkUhVcV3fZYPiXpeaCV
=3M7X
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--
