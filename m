From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH V5 09/12] usb: xhci: Add NVIDIA Tegra xHCI
 host-controller driver
Date: Mon, 17 Nov 2014 18:33:05 -0600
Message-ID: <20141118003305.GB11280@saruman>
References: <1416264102-1323-1-git-send-email-abrestic@chromium.org>
 <1416264102-1323-10-git-send-email-abrestic@chromium.org>
 <20141117231240.GB9716@saruman>
 <CAL1qeaG1=g39gsRHPrmCTBFbn3XQmW_2N7rm7uWa=-xOzDiDHQ@mail.gmail.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FkmkrVfFsRoUs1wW"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL1qeaG1=g39gsRHPrmCTBFbn3XQmW_2N7rm7uWa=-xOzDiDHQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-ker>
List-Id: linux-tegra@vger.kernel.org

--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 17, 2014 at 03:51:29PM -0800, Andrew Bresticker wrote:
> >> +static const struct {
> >> +     const char *name;
> >> +     unsigned int num;
> >> +} tegra_xhci_phy_types[] =3D {
> >> +     {
> >> +             .name =3D "usb3",
> >> +             .num =3D TEGRA_XUSB_USB3_PHYS,
> >> +     }, {
> >> +             .name =3D "utmi",
> >> +             .num =3D TEGRA_XUSB_UTMI_PHYS,
> >> +     }, {
> >> +             .name =3D "hsic",
> >> +             .num =3D TEGRA_XUSB_HSIC_PHYS,
> >> +     },
> >
> > these should be using the generic PHY subsystem (drivers/phy).
>=20
> This driver does use the generic PHY subsystem, see patch 7 in this serie=
s :).

true, I got misled by the fact that you added your phy provider to your
pinctrl. Odd.

> >> +static int tegra_xhci_load_firmware(struct tegra_xhci_hcd *tegra)
> >> +{
> >> +     struct device *dev =3D tegra->dev;
> >> +     struct tegra_xhci_fw_cfgtbl *cfg_tbl;
> >> +     struct tm fw_tm;
> >> +     u32 val, code_tag_blocks, code_size_blocks;
> >> +     u64 fw_base;
> >> +     time_t fw_time;
> >> +     unsigned long timeout;
> >> +
> >> +     if (csb_readl(tegra, XUSB_CSB_MP_ILOAD_BASE_LO) !=3D 0) {
> >> +             dev_info(dev, "Firmware already loaded, Falcon state 0x%=
x\n",
> >> +                      csb_readl(tegra, XUSB_FALC_CPUCTL));
> >> +             return 0;
> >> +     }
> >
> > won't this prevent rmmod && insmod from succeeding ? Maybe not, as you
> > return 0 anyway, but if the firmware side craps out, it might be useful
> > to reload the firmware and reset that block. I wonder if this prevents
> > that.
>=20
> rmmod && insmod does work with the above since, as you mentioned, we
> return successfully if the controller is already running.  Attempting
> to re-load the firmware if the controller is already running won't
> work - it requires a full power-gate/ungate sequence of the
> controller.  Unfortunately, that sequence is rather complicated and I
> haven't had a chance to implement it yet.  it will hopefully be coming
> later, though.

Alright, could you add a comment on the source code stating that ?
Perhaps a REVISIT note or FIXME ?

cheers

--=20
balbi

--FkmkrVfFsRoUs1wW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUapPBAAoJEIaOsuA1yqREycsP/jumgu3nWi8y6s41zVrOCUIi
Jx1odGzzxRoTszdOckXWoycGoOnZKJBNFqXrcbQJj+xZU73mZrn3lAGfestpdSrG
hkG8UrtxJ8WJ/JqgfV715gY/YpICd4XFSJzQDDb5C0k/QhAkZNaw3+yvgfaBbXmr
bCE9Pc9+keavZ7XrkYrHs6S2RTN2hBpH9+JfO+G7kC8q7x2b1XYzfocT4AIBNAZp
Ak58XBxU2kWgyPAZ4Qmswu6c4llK+P1du1z5UCg0RQdsGMTbM4zaysOUD/HENI/W
oBkVLP9Fn5qjIhsQMWFm8342gYuq824GwYHmC3T4C4MSs4mf9t9JWPgK5iqEYNXo
cHXRbFS+Y4W3pghaKphimlZ43vYS6OEkGJQNLxYsfkBURgHlcSRYfFDuLxqiNulg
qeUT8DV0nN1TxOPYEMnXaLAtLruaK6UfNOvN2J/qbHpbQqJbfRbrLxufI4V2z4wP
OO/cpe4xTgucbtsHRYxysjSAwnuIgpUyEhASxo6qV+OEoy9qkFqtHoF5jD0lV+Us
zejKfghXdMze2BA37gaZjf/Va8CV0A0QoRf3XVs+NEmDF7MpquQrKsqPbnQVxfkK
J8cRkXjwymkaN8Mugk5/xAJXFQjMMet4SZfDKNB2DR2uC4Eq0FBL+W1yyFEhin6a
6UhzmgfG7KwbfuQCw2mH
=KMdC
-----END PGP SIGNATURE-----

--FkmkrVfFsRoUs1wW--
