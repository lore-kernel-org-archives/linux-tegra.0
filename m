From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Usb: host - Fix possible NULL derefrence.
Date: Mon, 30 Jan 2017 08:03:23 +0100
Message-ID: <20170130070323.GD3585@ulmo.ba.sec>
References: <CGME20170130050640epcas2p1f856bc12df5d1ee6b9e0c66cf9dd6339@epcas2p1.samsung.com>
 <1485752789-30374-1-git-send-email-shailendra.v@samsung.com>
 <20170130064521.GC4324@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6Nae48J/T25AfBN4"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170130064521.GC4324-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Shailendra Verma <shailendra.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, p.shailesh-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ashish.kalra-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Shailendra Verma <shailendra.capricorn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--6Nae48J/T25AfBN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2017 at 07:45:21AM +0100, Greg Kroah-Hartman wrote:
> On Mon, Jan 30, 2017 at 10:36:29AM +0530, Shailendra Verma wrote:
> > of_device_get_match_data could return NULL, and so can cause
> > a NULL pointer dereference later.
> >=20
> > Signed-off-by: Shailendra Verma <shailendra.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > ---
> >  drivers/usb/host/xhci-tegra.c |    4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
> > diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegr=
a.c
> > index a59fafb..890c778 100644
> > --- a/drivers/usb/host/xhci-tegra.c
> > +++ b/drivers/usb/host/xhci-tegra.c
> > @@ -903,6 +903,10 @@ static int tegra_xusb_probe(struct platform_device=
 *pdev)
> >  		return -ENOMEM;
> > =20
> >  	tegra->soc =3D of_device_get_match_data(&pdev->dev);
> > +	if (!tegra->soc) {
>=20
> How would the driver be loaded and the probe function called if this
> returns NULL?
>=20
> Is this ever possible?

No, it isn't. I've been NAK'ing this kind of patch for a while now.
There are two variants of this patch going about:

  1) checking the return value of of_match_device()
  2) checking the return value of of_device_get_match_data()

The same may also apply to of_match_node(), but I haven't seen that used
very much lately.

For of_match_device() the problem could technically occur if used in non
OF setups, because the device could be instantiated by hand in board
setup code. Tegra has been OF-only for a couple of years now, so there
is no way this can happen today.

of_device_get_match_data() is somewhat more complicated because it could
still return NULL if the OF table entry had its .data field set to NULL.
However in all drivers that I know that would be considered a bug, so
might as well let things crash at this point to make it immediately
obvious.

I had once been tempted to write a checkpatch rule for this, but I'm not
sure it's as easy as just warning if there's a check, because there are
some legitimate cases, even if they're very rare.

Thierry

--6Nae48J/T25AfBN4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliO5ToACgkQ3SOs138+
s6Ftbg/7BEZk7BNf7S4Rz0/E/gAXhJVE1qXqVEm9lzsLtzoRES4Mg1X3iWp2zQiP
r8/X1dlpg9VUcWMqvXacghBZyUO3LfwsXvAqjXxGGn5yxLfC3CSzuLRmKolMins4
6o6Dvpg60oeGlm2SV5WouG+LCLeVyy2PWpPEzus/iQ1/MPbjSJMa32vNP7iH72aL
9TJoG4Jr+apbAyWHJyc01X9bb4jHd5Ryamj4dwN5Cn+lPFNkbJ3p+D0+o4OSlbpg
qrHioz55bG3vopBAHaohWHUlKOfhM9DzY12JhPKwKD1GioP/WkpC6/eRFQNonAG3
MOug1M1Jf6Oiq5EEB8QPkJ7t3iTIpwh2HpfW2kJ69j/GuGgrghls8+UGaEVNFD9M
8zo2yZ0gbVTDc7n5n0NuzaNLo70cZI8bVXX/XcZ3ScIAOr8J1xzWI/2XE9iKOuUz
rmjaYE1xgvhecOf0aVh8qN0lDzXekL0CVLpEFrbyhz6bUxZa/sog1+VGVtDrRPmv
6mv0Y0lFbEOFCdg0wjEWU/WgJHp298KhkM6lwjuX9O8Br/NONlyDXkuRMw2NKV6T
gljuRgb+tDRgbyXJwpPc3lNrhHDSefUvahkDQsw6Y/umDeRbfdPC88Y60V7RmOyw
oBYtVPUxCOJO/igfjgkO2KM4VvbsDNTcX6yKBSN5idWbjnYJkes=
=RqG0
-----END PGP SIGNATURE-----

--6Nae48J/T25AfBN4--
