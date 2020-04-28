From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 7/8] phy: tegra: xusb: Enable charger detect for
 Tegra186
Date: Tue, 28 Apr 2020 12:56:24 +0200
Message-ID: <20200428105624.GI3592148@ulmo>
References: <1586939108-10075-1-git-send-email-nkristam@nvidia.com>
 <1586939108-10075-8-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vs0rQTeTompTJjtd"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1586939108-10075-8-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--vs0rQTeTompTJjtd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 01:55:07PM +0530, Nagarjuna Kristam wrote:
> Tegra186 SoC supports charger detect, set corresponding soc flag.

"SoC flag"

>=20
> Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V2:
>  - Patch re-based.
> ---
>  drivers/phy/tegra/xusb-tegra186.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-t=
egra186.c
> index 03bdb5b..12ff492 100644
> --- a/drivers/phy/tegra/xusb-tegra186.c
> +++ b/drivers/phy/tegra/xusb-tegra186.c
> @@ -1041,6 +1041,7 @@ const struct tegra_xusb_padctl_soc tegra186_xusb_pa=
dctl_soc =3D {
>  	.ops =3D &tegra186_xusb_padctl_ops,
>  	.supply_names =3D tegra186_xusb_padctl_supply_names,
>  	.num_supplies =3D ARRAY_SIZE(tegra186_xusb_padctl_supply_names),
> +	.charger_detect =3D true,

And this may require an update for the change I suggested in patch 6/8,
but with that and the typo above addressed, this is:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--vs0rQTeTompTJjtd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6oC9gACgkQ3SOs138+
s6FaaBAAmP6cTMD/VpL2q1kX4bzPvzGA+/czi9xUXRWAjNA+OxVvRIdtGKsJOsxm
YMLW2EBA/g5dBCCvwiA4Ut1QVZBv58vA7hh06C/8lNpo9tJ0pfbmr/knGcD9KQxa
/JMbscYirr5oYEXUp/lJbFftjzFTg3JoJA7EqPtrv0LWmjuJ18eJwfZbsyjx3G+X
syGXPc8RJ4/s2Ir5cSZ82ymIb3JShhmNw48SozOdN00PPbBFl+oplCnQKXLxb9QU
3tSUVwTHalzZQ9mcEKblCWA4G/cRtNa/EK8PdOzW3keLtLM/7N5yZt3By3xQSKFt
mkKhSch9wCrG88Ks8OlXEsNjnu+DyJ0MdDynWKrlGaCjuL5hkIYOS05q/YF6S3U3
JmVEYg1r9hOlVNHe1/aVuvgnlT/Ned+zJQnQq6FbjgcYpJBd3V41O5EDnJEuwybY
QtITnAkeBBPgde0St+AXvreiz9AyzKLTJzGslvWOKR1uV/WroOJRoj3dCGFmhAXy
v13eNhu+2Kwn1Fa8Qqoc5RhYniTk+0jJqPaVXsJlk1IGeYVmt8IqE1boILE2mSd5
zCvTbn/lbu56qS7RSx9kneH0yPbQYh6CN1L6jpiHyQKPAW4hiRdeyFayyb9VjWsf
oOsz+qzEdNi2DUzdPNCMsrAf90QXFhXU+3DZvP8RjbGpKrHHWgA=
=scSv
-----END PGP SIGNATURE-----

--vs0rQTeTompTJjtd--
