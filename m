From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 4/8] phy: tegra: xusb: Add USB2 pad power control
 support for Tegra210
Date: Tue, 28 Apr 2020 12:17:40 +0200
Message-ID: <20200428101740.GG3592148@ulmo>
References: <1586939108-10075-1-git-send-email-nkristam@nvidia.com>
 <1586939108-10075-5-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DWg365Y4B18r8evw"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1586939108-10075-5-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--DWg365Y4B18r8evw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 01:55:04PM +0530, Nagarjuna Kristam wrote:
> Add USB2 pad power on and off API's for TEgra210 and provide its control
> via soc ops. It can be used by operations like charger detect to power on
> and off USB2 pad if needed.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V2:
>  - Patch re-based.
> ---
>  drivers/phy/tegra/xusb-tegra210.c | 190 ++++++++++++++++++++++++++------=
------
>  1 file changed, 133 insertions(+), 57 deletions(-)

Ignore that previous comment, I was making wrong assumptions:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--DWg365Y4B18r8evw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6oAsQACgkQ3SOs138+
s6HgRRAAkKBpdIifr13ah+O4pd7JwhNKw9JYwDfzVCGukWCrfD8Y/gZovptA53ww
MtcogouhBKZgyH9D0qRFPhDJGOBSgSn+MwQRfIXzsYVXrllvCACvhD7iFs1ACJ+L
wFGllBYVRByCUnXrGB6fZAe2my9D2+gzOtDjDjC7fZZE20jYewyVwG1TL3F1fMCd
arkdvSki+qOmwEgjaYfOypgZmj9Lgn0ty9q/XCYg48oStgFOutFDEL/au6ncBfv6
L+/bOwwJ63o+Fa6P8p70Sx+dPjjWkHAgqrD09BAHCG9Xi9qosL/T7XHTw8odQoPA
FRFnHnh/TEexCInco3nBGE77opKnsl/Jrdnd7YgK2F+O31vcrQ4LKYPefTKwR7se
oxvHjodo6PIS2hKzn4pKqUX7D6KGVZXwXEGipvdWRTZcx7zewOMmcUF6dPbMuzvk
6J/YRh2zcbidu/FmExilZK7RSehzORSSTcvvlRHN4aoH07tWCMzFOYBCmbwDjEYj
syMOBDw83hPdwbYHAQae1sKiKGciRQmHyORwjwT2RR6fNq0Zr3ssq+q6ZVZybjGT
Bu+O/i670oGR9Nn7OKi/LKM+v4dJS17KrJNn66j/mqVTgRGO5blIFySlSqYPNN5t
hkA8fz67jresVycjbbWe0qUHiYp7N9hn4eEntxMih7YgSf1gvtI=
=76s1
-----END PGP SIGNATURE-----

--DWg365Y4B18r8evw--
