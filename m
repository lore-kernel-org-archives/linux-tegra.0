From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 2/2] usb: host: ehci-tegra: Avoid getting the same
 reset twice
Date: Wed, 4 May 2016 22:16:44 +0200
Message-ID: <20160504201642.GA21480@mithrandir.ba.sec>
References: <1462372800-30900-1-git-send-email-thierry.reding@gmail.com>
 <1462372800-30900-2-git-send-email-thierry.reding@gmail.com>
 <1462382574.3536.64.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1462382574.3536.64.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
List-Id: linux-tegra@vger.kernel.org


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 04, 2016 at 07:22:54PM +0200, Philipp Zabel wrote:
> Hi Thierry,
>=20
> Am Mittwoch, den 04.05.2016, 16:40 +0200 schrieb Thierry Reding:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Starting with commit 0b52297f2288 ("reset: Add support for shared reset
> > controls") there is a reference count for reset control assertions. The
> > goal is to allow resets to be shared by multiple devices and an assert
> > will take effect only when all instances have asserted the reset.
> >=20
> > In order to preserve backwards-compatibility, all reset controls become
> > exclusive by default. This is to ensure that reset_control_assert() can
> > immediately assert in hardware.
> >=20
> > However, this new behaviour triggers the following warning in the EHCI
> > driver for Tegra:
> >=20
> > [    3.365019] ------------[ cut here ]------------
> > [    3.369639] WARNING: CPU: 0 PID: 1 at drivers/reset/core.c:187 __of_=
reset_control_get+0x16c/0x23c
> > [    3.382151] Modules linked in:
> > [    3.385214] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.6.0-rc6-next=
-20160503 #140
> > [    3.392769] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
> > [    3.399046] [<c010fa50>] (unwind_backtrace) from [<c010b120>] (show_=
stack+0x10/0x14)
> > [    3.406787] [<c010b120>] (show_stack) from [<c0347dcc>] (dump_stack+=
0x90/0xa4)
> > [    3.414007] [<c0347dcc>] (dump_stack) from [<c011f4fc>] (__warn+0xe8=
/0x100)
> > [    3.420964] [<c011f4fc>] (__warn) from [<c011f5c4>] (warn_slowpath_n=
ull+0x20/0x28)
> > [    3.428525] [<c011f5c4>] (warn_slowpath_null) from [<c03cc8cc>] (__o=
f_reset_control_get+0x16c/0x23c)
> > [    3.437648] [<c03cc8cc>] (__of_reset_control_get) from [<c0526858>] =
(tegra_ehci_probe+0x394/0x518)
> > [    3.446600] [<c0526858>] (tegra_ehci_probe) from [<c04516d8>] (platf=
orm_drv_probe+0x4c/0xb0)
> > [    3.455029] [<c04516d8>] (platform_drv_probe) from [<c044fe78>] (dri=
ver_probe_device+0x1ec/0x330)
> > [    3.463892] [<c044fe78>] (driver_probe_device) from [<c0450074>] (__=
driver_attach+0xb8/0xbc)
> > [    3.472320] [<c0450074>] (__driver_attach) from [<c044e1ec>] (bus_fo=
r_each_dev+0x68/0x9c)
> > [    3.480489] [<c044e1ec>] (bus_for_each_dev) from [<c044f338>] (bus_a=
dd_driver+0x1a0/0x218)
> > [    3.488743] [<c044f338>] (bus_add_driver) from [<c0450768>] (driver_=
register+0x78/0xf8)
> > [    3.496738] [<c0450768>] (driver_register) from [<c010178c>] (do_one=
_initcall+0x40/0x170)
> > [    3.504909] [<c010178c>] (do_one_initcall) from [<c0c00ddc>] (kernel=
_init_freeable+0x158/0x1f8)
> > [    3.513600] [<c0c00ddc>] (kernel_init_freeable) from [<c0810784>] (k=
ernel_init+0x8/0x114)
> > [    3.521770] [<c0810784>] (kernel_init) from [<c0107778>] (ret_from_f=
ork+0x14/0x3c)
> > [    3.529361] ---[ end trace 4bda87dbe4ecef8a ]---
> >=20
> > The reason is that Tegra SoCs have three EHCI controllers, each with a
> > separate reset line. However the first controller contains UTMI pads
> > configuration registers that are shared with its siblings and that are
> > reset as part of the first controller's reset. There is special code in
> > the driver to assert and deassert this shared reset at probe time, and
> > it does so irrespective of which controller is probed first to ensure
> > that these shared registers are reset before any of the controllers are
> > initialized. Unfortunately this means that if the first controller gets
> > probed first, it will request its own reset line and will subsequently
> > request the same reset line again (temporarily) to perform the reset.
> > This used to work fine before the above-mentioned commit, but now
> > triggers the new WARN.
> >=20
> > Work around this by making sure we reuse the controller's reset if the
> > controller happens to be the first controller.
> >=20
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v3:
> > - reword commit message to more accurately describe the hardware design
>=20
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Thanks.

> > Changes in v2:
> > - restore has_utmi_pad_registers condition (Alan Stern)
> >=20
> >  drivers/usb/host/ehci-tegra.c | 16 +++++++++++++---
> >  1 file changed, 13 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegr=
a.c
> > index c1c1024a054c..8396b622f238 100644
> > --- a/drivers/usb/host/ehci-tegra.c
> > +++ b/drivers/usb/host/ehci-tegra.c
> > @@ -81,15 +81,23 @@ static int tegra_reset_usb_controller(struct platfo=
rm_device *pdev)
> >  	struct usb_hcd *hcd =3D platform_get_drvdata(pdev);
> >  	struct tegra_ehci_hcd *tegra =3D
> >  		(struct tegra_ehci_hcd *)hcd_to_ehci(hcd)->priv;
> > +	bool has_utmi_pad_registers =3D false;
> > =20
> >  	phy_np =3D of_parse_phandle(pdev->dev.of_node, "nvidia,phy", 0);
> >  	if (!phy_np)
> >  		return -ENOENT;
> > =20
> > +	if (of_property_read_bool(phy_np, "nvidia,has-utmi-pad-registers"))
> > +		has_utmi_pad_registers =3D true;
> > +
> >  	if (!usb1_reset_attempted) {
> >  		struct reset_control *usb1_reset;
> > =20
> > -		usb1_reset =3D of_reset_control_get(phy_np, "utmi-pads");
> > +		if (!has_utmi_pad_registers)
> > +			usb1_reset =3D of_reset_control_get(phy_np, "utmi-pads");
> > +		else
> > +			usb1_reset =3D tegra->rst;
> > +
> >  		if (IS_ERR(usb1_reset)) {
> >  			dev_warn(&pdev->dev,
> >  				 "can't get utmi-pads reset from the PHY\n");
> > @@ -101,11 +109,13 @@ static int tegra_reset_usb_controller(struct plat=
form_device *pdev)
> >  			reset_control_deassert(usb1_reset);
> >  		}
> > =20
> > -		reset_control_put(usb1_reset);
> > +		if (!has_utmi_pad_registers)
> > +			reset_control_put(usb1_reset);
> > +
>=20
> While you touch this, could you move the reset_control_put inside the
> (!IS_ERR(usb1_reset)) section above, maybe in a separate patch?
>=20
> We might start to warn in reset_control_put() if it is called with an
> error value as parameter in the future.

Good point. I hadn't noticed that this could potentially be called with
a ERR_PTR()-encoded error code.

Fixed in v4.

Thanks,
Thierry

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXKlikAAoJEN0jrNd/PrOhneYP/jTNjIWvbE5iBcu6B9qngcr7
DRLDJMJjC4yCgRvCvkRXQm4K6bWwFXbtoBXgn5OQyLPUhD+0t+9EFOx8uGkfhz/U
fd+zyYSjrzOpH9j0zmw7D2bHIp4avaQqfV528wyIIxxVdcAqzyaJDUyE0xiqbaak
cnuizT5heGjGKNNkEJSnyNBNgy9bJRvUEYdYBzxIiHkT6gaG9tSgWgexBUT3JVgQ
c2R2k6/PvIS9974u8JqZnnVR3FpXQRqBH6VJdQJDzxgIprKr4Wfw6/hHxw5am6sX
VPj4Z/Ntsz8DmdOxcVApCJs18wfoewcWeuDLl6lzctNJ2mFCyaPcCPv0+ytrzQMy
ULuOzNEmElWq+M3BDM3y2qAokG9m2yKMLpBxj33wHecl0TBCLwEj35yASiXedcGd
z6l3JM1o9DvGpD34VF3+XP1DQT17FzSXWyS6jifbgECDJKWh7y7Fkcsyw7L8BVYE
/q30Nir1fz+RD90KprpkXv3fHSLug0Nz1unTUvNoLC/I87KYPmeP8ossum2RPX76
3hxL4YQaeY56egT/1O/nSltgwt3+Q/TCpH65EJzNVHBj70AZXFJw4OildLy5FZfq
v50Vyb6oXKILB0ZthJOXSzUkujEsPKreGuZIix00WBQ8DdXhx/FpxRNdwVjWkTGL
U2DBS3DGQe9wfgsDixjk
=sPT5
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
