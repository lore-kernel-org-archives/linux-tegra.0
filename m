From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 7/9] ARM: tegra: Enable DSI support on Dalmore
Date: Tue, 8 Oct 2013 13:22:11 +0200
Message-ID: <20131008112211.GH19633@ulmo.nvidia.com>
References: <1381146528-18069-1-git-send-email-treding@nvidia.com>
 <1381146528-18069-8-git-send-email-treding@nvidia.com>
 <525326E0.7080703@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RwGu8mu1E+uYXPWP"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <525326E0.7080703-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--RwGu8mu1E+uYXPWP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2013 at 03:25:52PM -0600, Stephen Warren wrote:
> On 10/07/2013 05:48 AM, Thierry Reding wrote:
> > Dalmore has a 10.1" WUXGA panel connected to one of the DSI outputs of
> > the Tegra114.
>=20
> > diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts=
/tegra114-dalmore.dts
>=20
> > -		lcd_bl_en_reg: regulator@2 {
> > +		usb1_vbus_reg: regulator@2 {
> >  			compatible =3D "regulator-fixed";
> >  			reg =3D <2>;
> > -			regulator-name =3D "lcd_bl_en";
> > -			regulator-min-microvolt =3D <5000000>;
> > -			regulator-max-microvolt =3D <5000000>;
> > -			enable-active-high;
> > -			gpio =3D <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
> > -		};
> > -
> > -		usb1_vbus_reg: regulator@3 {
> > -			compatible =3D "regulator-fixed";
> > -			reg =3D <3>;
> >  			regulator-name =3D "usb1_vbus";
> >  			regulator-min-microvolt =3D <5000000>;
> >  			regulator-max-microvolt =3D <5000000>;
>=20
> Rather than renumbering all the regulators, can you just delete the one
> regulator and leave a gap in the numbering? That'd make the diff a lot
> smaller and clearer. There's no need for the reg values to be contiguous
> here, so I don't think the renumbering is useful in-and-of-itself.

Okay, I've reverted the renumbering changes.

Thierry

--RwGu8mu1E+uYXPWP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSU+rjAAoJEN0jrNd/PrOh+OYQAJBwEa1sFtYOFnLhytN2yQV4
9+fUtWHCZqAyDShC2xpmpI8kld1LmeSOOBBVS0BQlnrWTxdfrKuc3mhmVaYfXBek
KjGf2CLrL9XR/BVqGG03VOfQ+vKc89ZzkFm0Zoy4sk8ELJua94+CYWxPpa+DaJVt
Dt/Jb9oaym06YTz3Rp/T+pkr6A9xmuAmnEtmWydiXyzuZK185SNxDWKjcJ/X9Bui
a3JSYslLFiw+lBiIxqliwha1yAsEFxU7fnm3O18ucCzDmI16SW33J0nEHZ7shPkN
LkVkr4IvdnoCon9eysd7nU6aqbgaBZKjZCBZnaBEWDJP7q1KhWT4w9VgPJDCn6FH
iUdsk5oVW9Ko+8EiCAbTiOoVv+KqnonfJ9UNmMOghN0p0utDi4HY2CA8G2vDkrCH
oTK/JIPYlqZqUGvUCuHyqpL2KujdZdhPwwUuKZh3kRF7w5vrxZN/GUtBGl5dJhvk
w8XmJrdccF3d+rCdIG3OMEH0kdF6WbTmoR+lVj9QZn26BfL7A94vkFfPyX7If3Di
yUNDyfpZOEFZzohLMeVwFoUdYthNBHhP1Qt0UELPuqgp7lvSkN9rNTOE0LBV+UJQ
IVnvQRzcDdtJ/1K5xeqjsa+nBvhZ4ljk6FZgaHTiOLhGZqedlO7d9Nwr7O3R34Bf
I9LJWKEE4K9tDNJrznLR
=V7wx
-----END PGP SIGNATURE-----

--RwGu8mu1E+uYXPWP--
