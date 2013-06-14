From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 REPOST 0/7] USB: tegra: support building as a module
Date: Fri, 14 Jun 2013 19:00:34 +0200
Message-ID: <20130614170033.GA854@mithrandir>
References: <1371144253-21295-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1371144253-21295-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2013 at 11:24:06AM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> I'm reposting this because I originally thought Felipe would apply it
> to his PHY tree, since it's based on other work there. Now that tree has
> been merged into Greg's main USB tree, I believe this series can be
> applied there instead. Hence, resending so it shows up in Greg's inbox.
>=20
>=20
> ehci-tegra is currently built into the main ehci-hcd driver, rather than
> being a separate module. This causes issues with multi-platform ARM
> kernels. This series separates ehci-tegra into its own module to avoid
> those problems.
>=20
> Manjunath Goudar originally wrote most of this series. I've since cleaned
> it up, rebased it on Venu's recent changes to the Tegra USB driver, and
> tested it.
>=20
> Manjunath Goudar (3):
>   usb: phy: export ulpi_viewport_access_ops
>   USB: EHCI: export ehci_handshake for ehci-hcd sub-drivers
>   USB: EHCI: make ehci-tegra a separate driver
>=20
> Stephen Warren (4):
>   usb: phy: add MODULE_LICENSE to phy-tegra-usb.c
>   USB: EHCI: tegra: remove all power management
>   USB: EHCI: tegra: fix circular module dependencies
>   USB: EHCI: tegra: make use of ehci->priv
>=20
>  drivers/usb/host/Kconfig            |   2 +-
>  drivers/usb/host/Makefile           |   1 +
>  drivers/usb/host/ehci-hcd.c         |  22 +-
>  drivers/usb/host/ehci-hub.c         |   4 +-
>  drivers/usb/host/ehci-tegra.c       | 474 ++++++++----------------------=
------
>  drivers/usb/host/ehci.h             |   2 +
>  drivers/usb/phy/phy-tegra-usb.c     |  43 +++-
>  drivers/usb/phy/phy-ulpi-viewport.c |   2 +
>  include/linux/usb/tegra_usb_phy.h   |   4 -
>  9 files changed, 165 insertions(+), 389 deletions(-)

The series:

Tested-by: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRu0wxAAoJEN0jrNd/PrOh8qYQAK004+JaLhGf/cGalj3KaN/S
1omz1OMguJHLumBxpXrByFDTTP4V9Iy6n2kf3y3dYQsj3EiDTwJy25oboSr9PhVm
OR5fTLrDAiw5OpVu5LViXTXdkcz/PeSCSzBgxcFx0g3cNu7L4wcXZog9zYtCKQn+
/mtg0vMnC3KmhFzIKC/GSyiGuPNXpF8Pf30/AVOcc1Cfy9Ls5Ad3e+WD1ku2GuZE
BXmr8SunOCqpOePphHwnvd7epuC/+/O2k9fnSkfo4ylTXtUpvTwC/Ne6Tj+fh2Jk
rt/lEVtXiMM6Oraf1dnSCac0zqPnQ1t0CkenR+GhitLbxgKWa4vZ1/72buvEwvCz
cQtj/4HGil+FBkt4gcwblUysXzIjEOb4QqOkPjM6rNJa2CAVTtVWe9e36BK70H2k
wz9ZoyMEKtPkTT5eCd/LBh3O6F9zBl6r4qr4jj18tDTWnZXBgpefGGfKVTKD0Wr6
0/InNnhubQbnTqc4/GdhLOSJLe+uBoYD3LAE5mDDqCevP8BvtqhLQSIdg8pDeOPL
M/pD7F6ngW4TvnKM8v4Voyh3VJeDTPFDRWe2Jv5q331DXdXJ3XGktTAjbM0CQMKb
KeECUwhwYcaz/6y1+sOm0QEgOKYyDFar92ei9LOZ0R3ofs+DgMvZL5RD+oGCDGvy
GyqfsR8dG0DoMz9eFIec
=mUEk
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
