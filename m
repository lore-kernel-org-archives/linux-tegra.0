From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 2/2] usb: tegra: Move UTMI-pads reset from ehci-tegra
 to tegra-phy
Date: Mon, 11 Dec 2017 11:25:23 +0100
Message-ID: <20171211102523.GH10671@ulmo>
References: <ddf583790b551999ef063107be12a2d85e7b6a86.1512946782.git.digetx@gmail.com>
 <853ce44924e396b907332d4f3ad4ae70eae9bbcc.1512946782.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AzNpbZlgThVzWita"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <853ce44924e396b907332d4f3ad4ae70eae9bbcc.1512946782.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--AzNpbZlgThVzWita
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2017 at 02:07:38AM +0300, Dmitry Osipenko wrote:
> UTMI pads are shared by USB controllers and reset of UTMI pads is shared
> with the reset of USB1 controller. Currently reset of UTMI pads is done by
> the EHCI driver and ChipIdea UDC works because EHCI driver always happen
> to be probed first. Move reset controls from ehci-tegra to tegra-phy in
> order to resolve the problem.
>=20
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/usb/host/ehci-tegra.c     | 87 ++++++++++++++++++---------------=
------
>  drivers/usb/phy/phy-tegra-usb.c   | 46 +++++++++++++++++++++
>  include/linux/usb/tegra_usb_phy.h |  2 +
>  3 files changed, 87 insertions(+), 48 deletions(-)

I don't think we can do this. For one I don't think shared resets are
going to work here because you really won't ever be able to reset after
two devices have requested the same reset. Second, utmip_pad_close()
could be called at any point and it will have the side-effect of either
not doing a reset at all (because it is shared) or resetting the USBD
controller at the same time.

We've been over this code a great deal over the years. I'd love it to be
simpler, but every time we tried to simplify it, things broke.

Thierry

--AzNpbZlgThVzWita
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlouXRAACgkQ3SOs138+
s6GD9hAAgUya2bVor/dh9QcnoOapus20lPQZVX50ugDgmjze/eZ57Eg9yzLVnq2x
Ap40q3X3oplaqbHHnpI4INF9CBqvIr4kYIL5FHHxYxK+KalBgg6QQYprICW0gTgO
IL5romtLh5dff/VQgzqRHofkdQrD1Z8rRM5HS5q6X1xBz2kUxj5YiuQN1TUrDDzz
LHEgWg62Yo3ztYNrS0sU5JhD5Ztq20yfeoJAlv7aLyVfYDviGK6rJ73PvKTlDuqc
z5zmTYVruTqEMcs4Nw+HHubdzmtJyyxWEYwieLCCahqwY6so2pkqo+x0zclsWPf0
pQhlCDHL7eW0NV5fNK1SvsfLXUvYbIadcu41W9awY1V0/H3gyhdYXNSXZLWX5BB6
JwX+4AO6k4iihiwted3YvZU9kLLmw1P8pgLLtuiIJyHI/gr1Hv0oQyZ/69qTEKH/
2WfwHXadcoOwxuuuqar0E8kilbImd3bRjuSC01lCEHHFce0xSi+wSh5ik6vHAbsa
OwNRkhKQLVoVXpAFLpcPKCSaHFxcNBBBgTr9ujuEEVo09KeLV0u+xUDu+28rXmYw
FZ7fl2wYPI2ZH60EkhQpUiPmk/nCQOE2anUHOoF5JJ9i6CD/jXUPl61DLLNtZX0E
hxKJ3D1lMzpQSmshCaa0O4MSUNQ4szwLT/MeahWvlT+H41hI16E=
=Spc9
-----END PGP SIGNATURE-----

--AzNpbZlgThVzWita--
