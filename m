From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch V3 03/18] phy: tegra: xusb: Add usb-role-switch support
Date: Wed, 29 Jan 2020 10:26:07 +0100
Message-ID: <20200129092607.GA2479935@ulmo>
References: <1577704195-2535-1-git-send-email-nkristam@nvidia.com>
 <1577704195-2535-4-git-send-email-nkristam@nvidia.com>
 <20200128173244.GA2293590@ulmo>
 <b6de0078-f1cd-31a1-70bd-dfc320eab70e@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b6de0078-f1cd-31a1-70bd-dfc320eab70e-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2020 at 02:45:38PM +0530, Nagarjuna Kristam wrote:
>=20
>=20
> On 28-01-2020 23:02, Thierry Reding wrote:
> > On Mon, Dec 30, 2019 at 04:39:40PM +0530, Nagarjuna Kristam wrote:
> > > If usb-role-switch property is present in USB 2 port, register
> > > usb-role-switch to receive usb role changes.
> > >=20
> > > Signed-off-by: Nagarjuna Kristam<nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > ---
> > > V3:
> > >   - Driver aborts if usb-role-switch is not added in dt forotg/periph=
eral
> > >     roles.
> > >   - Added role name strings instead of enum values in debug prints.
> > >   - Updated arguments and variable allignments as per Thierry inputs.
> > > ---
> > > V2:
> > >   - Removed dev_set_drvdata for port->dev.
> > >   - Added of_platform_depopulate during error handling and driver rem=
oval.
> > > ---
> > >   drivers/phy/tegra/Kconfig |  1 +
> > >   drivers/phy/tegra/xusb.c  | 57 ++++++++++++++++++++++++++++++++++++=
+++++++++++
> > >   drivers/phy/tegra/xusb.h  |  3 +++
> > >   3 files changed, 61 insertions(+)
> > >=20
> > > diff --git a/drivers/phy/tegra/Kconfig b/drivers/phy/tegra/Kconfig
> > > index f9817c3..df07c4d 100644
> > > --- a/drivers/phy/tegra/Kconfig
> > > +++ b/drivers/phy/tegra/Kconfig
> > > @@ -2,6 +2,7 @@
> > >   config PHY_TEGRA_XUSB
> > >   	tristate "NVIDIA Tegra XUSB pad controller driver"
> > >   	depends on ARCH_TEGRA
> > > +	select USB_CONN_GPIO
> > >   	help
> > >   	  Choose this option if you have an NVIDIA Tegra SoC.
> > > diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> > > index f98ec39..11ea9b5 100644
> > > --- a/drivers/phy/tegra/xusb.c
> > > +++ b/drivers/phy/tegra/xusb.c
> > > @@ -523,6 +523,7 @@ static int tegra_xusb_port_init(struct tegra_xusb=
_port *port,
> > >   	port->dev.type =3D &tegra_xusb_port_type;
> > >   	port->dev.of_node =3D of_node_get(np);
> > >   	port->dev.parent =3D padctl->dev;
> > > +	port->dev.driver =3D padctl->dev->driver;
> > This looks wrong. I don't think driver's are supposed to set this
> > because it basically means that the device is being attached to the
> > driver, but in this case it doesn't get probed by the driver and in
> > fact the ports don't match the pad controller, so they can't really
> > be driven by the same driver.
> >=20
> > Is there any particular reason why you need this?
> >=20
> > Thierry
>=20
> Yes, port->dev.driver->owner is accessed in USB role switch driver in API
> usb_role_switch_get. If driver param is not updated, it causes NULL point=
er
> exception. Based on your inputs, since this assignment is not supposed to
> used, I believe option available is to create a new device_driver structu=
re
> and assign the same here.
> Please share your thoughts.

Sounds to me more like what we want is to make the module_get() and
module_put() calls conditional to avoid the NULL pointer dereference.
Another common variant that I've seen in other subsystems is to make
drivers pass in an owner explicitly via some operations structure to
allow more fine-grained control over the reference count.

In this particular case one option to do this would be to add a struct
module *owner field to usb_role_switch_desc and that's copied to struct
usb_role_switch in usb_role_switch_register() so that that can be used
for reference counting (perhaps with the current code as fallback).

That would allow using simple devices (i.e. not bound to a driver) to
work with this framework as well.

Thierry

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4xT60ACgkQ3SOs138+
s6G/uA//YgHnzWFjeDa1ZwWsKGhC1WNt8IJjC2xeJ/pryhlhg2NeANB+/JosYFWz
RRLRUYZ13Z4uvB/j2I437JXluVs3QZ9GKtdjxbWDqpJYX4l0c4Nk3ZBnxLeoG1Zn
QFM6j+ZLfbYTeSacA0EX+sKC/qK5EJuFZ8pW+D8wf9EE2VO6O8qB6/k4/sKHUwyv
hUokfc6zwlVfrZ7YDKRtleaiPbABS7frYnel5Mio6tFpyEKSw94KyyD5wBFSF6K+
En806WquNFG8c9LgfFszwLBinbCOML93TbFiz4gLuWtwqzik5XtwBdkOQVAQoHK7
kPp6D91/1PuG9zIVe6WWePjiCWXdbka9ScfYKdYMFDkRnkETsThbKZfdmien3X3H
Zzn4iFU4PzoRpLP//ctdv4PtX8TbEbdD/fmkMI1LxyqflF3XTNujpqQ8XOM1+ifg
BwNrM+MvfHdo4iCgZVMKF38QRKzRdTaq8G9NlDBqy06pZwKsDBWuAIydybwvfw9b
PekrIuhSRHWaKvtznDKBKy/pHv0RFdjVx6DYb8SNGJ3U28kXeYyjqi0RHX7VzENF
FlIGWZLbFmWa6TNipcN5GvlKfi8oCHy+hcpVUBLf0OBCzvkOAIjano7Mf7xugcHt
ea/keKxOJjLCdgMD1kpOVhbbgrjtlLVoYA0JLzq3OqXGXUf1c3E=
=exCt
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
