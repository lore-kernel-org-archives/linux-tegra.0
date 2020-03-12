From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch V5 00/21] Tegra XUSB OTG support
Date: Thu, 12 Mar 2020 10:22:32 +0100
Message-ID: <20200312092232.GA1199023@ulmo>
References: <1581322307-11140-1-git-send-email-nkristam@nvidia.com>
 <20200217085130.GJ1339021@ulmo>
 <20200227173226.GA1114616@ulmo>
 <20200304070100.GA1271591@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200304070100.GA1271591-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 04, 2020 at 08:01:00AM +0100, Greg Kroah-Hartman wrote:
> On Thu, Feb 27, 2020 at 06:32:26PM +0100, Thierry Reding wrote:
> > On Mon, Feb 17, 2020 at 09:51:30AM +0100, Thierry Reding wrote:
> > > On Mon, Feb 10, 2020 at 01:41:26PM +0530, Nagarjuna Kristam wrote:
> > > > This patch series adds OTG support on XUSB hardware used in Tegra21=
0 and
> > > > Tegra186 SoCs.
> > > >=20
> > > > This patchset is composed with :
> > > >  - dt bindings of XUSB Pad Controller
> > > >  - dt bindings for XUSB device Driver
> > > >  - Tegra PHY driver for usb-role-switch and usb-phy
> > > >  - Tegra XUSB host mode driver to support OTG mode
> > > >  - Tegra XUSB device mode driver to use usb-phy and multi device mo=
de
> > > >  - dts for XUSB pad controller
> > > >  - dts for xudc for Jetson TX1 and TX2
> > > >  - dts for Jetson-TK1
> > > >  - dts for Jetson-Nano
> > > >=20
> > > > Tegra Pad controller driver register for role switch updates for
> > > > OTG/peripheral capable USB ports and adds usb-phy for that correspo=
nding
> > > > USB ports.
> > > >=20
> > > > Host and Device mode drivers gets usb-phy from USB2's phy and regis=
ters
> > > > notifier for role changes to perform corresponding role tasks.
> > > >=20
> > > > Order of merging Patches:
> > > > Please merge DT changes first followed Tegra PHY driver changes and=
 then
> > > > USB driver changes.
> > >=20
> > > Felipe, Greg, Kishon,
> > >=20
> > > Given the runtime dependencies between these various parts, I could p=
ick
> > > these up into the Tegra tree if you provide an Acked-by.
> >=20
> > Ping. Are you guys okay if I pick these up into the Tegra tree?
>=20
> That's up to Felipe, I have no opinion :)

Felipe, Kishon,

I've picked up the device tree changes into the Tegra tree. Let me know
if you also want me to pick up the USB and PHY driver changes.

Thierry

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5p/04ACgkQ3SOs138+
s6EaeRAAlYPSUblcoth+8aD57Q5QnSCc7cNHu/mUZZSec1OvLuHKqKs74gAcDa38
fbTqyMY/OlKiZ4RIixrST8bZ+VT+IDp/4GHFS3G0nC6wlK340+NpE2RxtPAeS+Oh
WuAg+p5PnLd7JwixjUuJPAVe+J/jt3l4BD5KN2cibwMdeV+jwlEZJ1OJrx+s0GW0
eAnAAQmb/yZlYneiR2y1NRSW2qbWfv6D81ZR5f7xAkuZHjF3+d/L0EZdsZHgH3gR
3KRfEY0On0s+oWrDR3d4y3h3cfJJIYegpqA6PaFcTjMdNEFcR+R/BGter/OQDbVE
HeaFN8FBIUl2r+hgf33t4sT2EvYx5DJtxoDv/u7kwpDxXA53BLHDnEfXyyOU8JeN
nuuipt+DOGyFfgmQNgx0aqaabl04wXEpUvBWxECp8IYB2gmiXL0PPzNC/qDIE8id
z5p0H6GxXHWTiwsU5JwfHG9zNwppRl9I+XqgHIaSS4jWcmyQC0QwJysPBudXwy2c
mqWjrd+/q3cqBByBVMslEssxvURdOmnDQ0NYXTPMnWWUWOpizZWxFHBEHh/DGQ3z
W6pxj8LePB/B7bu7c9BeoR3mhs65sJsalbge2xk1nrYL1q1hat+3udkCcu71JGG1
W+Sl2jl5CtuW9XE8PYYm0vEhV7FRJqbo6a5/Dea9L/aEISKpL4A=
=l/y7
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
