From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch V2 01/18] dt-bindings: phy: tegra-xusb: Add
 usb-role-switch
Date: Mon, 13 Jan 2020 16:06:56 +0100
Message-ID: <20200113150656.GB2436168@ulmo>
References: <1576660591-10383-1-git-send-email-nkristam@nvidia.com>
 <1576660591-10383-2-git-send-email-nkristam@nvidia.com>
 <20191219130503.GG1440537@ulmo>
 <fe47fd52-efd0-4f84-d1e4-4bce5571e425@nvidia.com>
 <20200110111633.GA2233456@ulmo>
 <6eb31a50-472f-439c-3bc7-bcad1c0c9ff4@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6eb31a50-472f-439c-3bc7-bcad1c0c9ff4-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 10:07:08AM +0530, Nagarjuna Kristam wrote:
>=20
> On 10-01-2020 16:46, Thierry Reding wrote:
> > On Fri, Dec 20, 2019 at 04:08:30PM +0800, JC Kuo wrote:
> > > On 12/19/19 9:05 PM, Thierry Reding wrote:
> > > > On Wed, Dec 18, 2019 at 02:46:14PM +0530, Nagarjuna Kristam wrote:
> > > > > Add usb-role-switch property for Tegra210 and Tegra186 platforms.=
 This
> > > > > entry is used by XUSB pad controller driver to register for role =
changes
> > > > > for OTG/Peripheral capable USB 2 ports.
> > > > >=20
> > > > > Signed-off-by: Nagarjuna Kristam<nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > > > ---
> > > > > V2:
> > > > >   - Moved usb-role-switch to seperate Required section as suggest=
ed by Thierry.
> > > > >   - Added reference to usb/usb-conn-gpio.txt for connector subnod=
e.
> > > > > ---
> > > > >   .../devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt    =
     | 6 ++++++
> > > > >   1 file changed, 6 insertions(+)
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra12=
4-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-x=
usb-padctl.txt
> > > > > index 9fb682e..23bf354 100644
> > > > > --- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-=
padctl.txt
> > > > > +++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-=
padctl.txt
> > > > > @@ -174,6 +174,12 @@ Required properties:
> > > > >     - "device": for USB device mode
> > > > >     - "otg": for USB OTG mode
> > > > > +Required properties for OTG/Peripheral capable USB2 ports:
> > > > > +- usb-role-switch: Boolean property to indicate that the port su=
pport OTG or
> > > > "supports", and also, why if it supports OTG*or*  peripheral? Doesn=
't
> > > > OTG imply peripheral? OTG means it can be either peripheral or host,
> > > > right? So I think the end of that sentence can be just:
> > > >=20
> > > > 	"... the port supports OTG."
> > > An USB OTG port is capable of both USB host and peripheral operations=
=2E An USB
> > > peripheral port can only act as an USB peripheral.
> > >=20
> > > The micro USB ports found on Jetson TX1/TX2 platforms are micro-AB po=
rts which
> > > should implement both host and peripheral capabilities. We say such p=
orts
> > > support OTG. The micro USB port found on Jetson Nano is a micro-B por=
t which
> > > should implement peripheral capability only. We say such ports support
> > > peripheral, rather than OTG.
> > I the port supports only peripheral mode, why do we need to have a
> > usb-role-switch property? Shouldn't we in that case have a mode property
> > with value "device"?
> >=20
> > usb-mode-switch is only needed if mode =3D "otg", isn't it? In all other
> > cases the functionality is fixed (either host or peripheral) and the
> > mode cannot be switched.
> >=20
> > Thierry
>=20
> usb-role-switch is needed when mode =3D=3D "otg" or "peripheral".
>=20
> Device mode is detected via vbus GPIO irrespective of mode being peripher=
al
> only or OTG.
> Host mode is detected via id-gpio, in OTG case.
>=20
> When mode is peripheral, role changes happens between USB_ROLE_DEVICE and
> USB_ROLE_NONE, which are generally based on Vbus GPIO(hot plug) detection.
>=20
> When mode is otg, role changes happens between USB_ROLE_HOST,
> USB_ROLE_DEVICE and USB_ROLE_NONE, which are detected via id-gpio, vbus-g=
pio
> and no detection respectively.

Right, that makes perfect sense. Thanks for putting it so clearly. With
the "support" -> "supports" typo fixed, this patch:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4ch40ACgkQ3SOs138+
s6EXWxAAhA3qkr4dwr/BpJvUBpto03CcTHQ3yV4woWvaZxHs63oSXPuCwPH7i/xS
e65s0sn9EV9QKBqxv6SehSlutGOnY108jbFEee9rHs0kidOEqJ9KXHCpXcEb6aX7
LqRNHrJbZAqJaxE8ESl3L07qDGl8SaAtdfZEIB0taqON2jvg2nALXU3QeCMG9WRZ
0TXhUqQdBIGopsh5rAo68YnYR9M72x/IRoE1Qa4t0o/FlnkuL3yA/3YwLP5epT/4
tSThMSmuVCh9vF5TqbnRkXBzKCbAGBJt91odL1WkCJpVKM7VaNcRAJJY8p4/Qwlo
m52OPNzfNPTtPbs+DbO+1PvDSJ3KR5yZbt42eIUtBVOt+R1P+EbDvKAwz1pAxvyO
dT3++fDIuRnnNCKt4n76tpEg5j8jN0ll3MDlo21iSjTuIt3tgIXiRggsc9Oc5ZQ7
FFhfX6hRZ62KTw5ivbmstgQTxeFecvN7JE7e14SBgkg4i7UakcVcxUDJDuS6A+IL
psXp1i7TURnb61hlKmSry91JagO0edTxEoxKGgL5dgCe/SmyLFmI6W3T8PtaW+L9
td4eKAhi3AP3Y8tUVXJykCy06nD57vna1GJ/ku/PbYNiV5ge2amZMECdz0kKaGQP
PvTUxuCaCeFfvHRU4fGuTn/D7XfHD95gr9e8TQFddsQWwt8Xmzs=
=/QZt
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--
