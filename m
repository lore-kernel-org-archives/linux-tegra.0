From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: USB-related build errors on Tegra in next-20130319
Date: Wed, 20 Mar 2013 19:30:06 +0200
Message-ID: <20130320173006.GN1567@arwen.pp.htv.fi>
References: <51489251.5040504@wwwdotorg.org>
 <20130320122031.GI29659@arwen.pp.htv.fi>
 <5149E62F.9090705@wwwdotorg.org>
 <20130320164553.GL1567@arwen.pp.htv.fi>
 <5149E925.7030302@wwwdotorg.org>
 <20130320171147.GM1567@arwen.pp.htv.fi>
 <5149F15A.1000806@wwwdotorg.org>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5FetH82qe0Z6y/zI"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5149F15A.1000806-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--5FetH82qe0Z6y/zI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2013 at 11:26:50AM -0600, Stephen Warren wrote:
> On 03/20/2013 11:11 AM, Felipe Balbi wrote:
> > Hi,
> >=20
> > On Wed, Mar 20, 2013 at 10:51:49AM -0600, Stephen Warren wrote:
> >> On 03/20/2013 10:45 AM, Felipe Balbi wrote:
> >>> Hi,
> >>>=20
> >>> On Wed, Mar 20, 2013 at 10:39:11AM -0600, Stephen Warren
> >>> wrote:
> >>>> On 03/20/2013 06:20 AM, Felipe Balbi wrote:
> >> ...
> >>>> The patch you gave fixes the Kconfig warnings, but not the
> >>>> build failure.
> >> ...
> >>>> For now, I think the correct solution is to have
> >>>> USB_EHCI_TEGRA select USB_PHY. I validated that solves the
> >>>> build problem, and has the bonus of not needing any changes
> >>>> to tegra_defconfig.
> >> ...
> >>> Alright, do you want to send that patch ? My bad that I missed=20
> >>> that build error...
> >>=20
> >> Sure. Do you want to roll it into your patch and repost it, or me
> >> to send a separate patch?
>=20
> Oops, sorry, I meant to write "Do you want *me* to" ...
>=20
> > updated patch below:
>=20
> Anyway, the updated patch you sent does solve the problem, so:
>=20
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> (both build and ran it on HW to make sure nothing was missing)
>=20
> Feel free to use yours or the separate one I sent; entirely your call.

I wonder if the third option isn't nicer ?

select USB_PHY if USB
select USB_ULPI
select USB_ULPI_VIEWPORT

then all changes are in tegra's Kconfig itself ?

--=20
balbi

--5FetH82qe0Z6y/zI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRSfIeAAoJEIaOsuA1yqREA40P/2t5lnYgQW6TRZbANWPuiR9V
sP4JHqr5Jjbs3FGdZf0EdPJFgsNFCwI6Pojc4Nhv/OYJAPL9Af2/xFCqYm395wxA
Uu0tK7Mj08cRcUwVJ8m2sgzaUVaNgI16GtYH7hSDr6wjDTwsCQPvqnxPhtkhU4hd
qJFoVnFeQyglC7Rj31XZJC3cqVPejhF7C+rkLryhjcRPF/vbeq1+YMZTtMe80g1N
xYhCph2VmmhxzzycVbgctX1SuacsX+ggDJF0ugwHg0QbTYc+0Lm0kUZ0/Kv/uQ5s
NQqZzid188TduAwkZVGMPk9nygeyqzCcCt9e2lcA2pxZitqZJtRBae3GLtYrOQxS
5QofGI+OcqrT9HQj0wjX1eipBmfI+mO90X5U4nW1833SKZHsBwjrKudd/iDU6Y2J
3TCVBK0695JpXU1lhtRK3DoCKmUykScOxkZyTBwv4d5aZorkzMGBZFfZ+pqD5jO8
yYn/V47lPygSprCj2312q7YTwM7w8H7E4IFUUo/sHwRvW43uHFmDBlSJrASKwhhO
FE2jWS6ublQRU8OmWHV6gBy3RQtX7iNV6ryyac7nzFeJ1KyrIoC9+vm31dMNsp8l
kymUDRDhraCHl1Lj7GNsjkyaWBFEBH8ignle1E7cw7Nm/XzqDrHiKwWVZShL/HSl
0Vd2nUSn5xDR9yrA2z7X
=wywJ
-----END PGP SIGNATURE-----

--5FetH82qe0Z6y/zI--
