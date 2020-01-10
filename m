From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch V2 01/18] dt-bindings: phy: tegra-xusb: Add
 usb-role-switch
Date: Fri, 10 Jan 2020 12:16:33 +0100
Message-ID: <20200110111633.GA2233456@ulmo>
References: <1576660591-10383-1-git-send-email-nkristam@nvidia.com>
 <1576660591-10383-2-git-send-email-nkristam@nvidia.com>
 <20191219130503.GG1440537@ulmo>
 <fe47fd52-efd0-4f84-d1e4-4bce5571e425@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fe47fd52-efd0-4f84-d1e4-4bce5571e425-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2019 at 04:08:30PM +0800, JC Kuo wrote:
>=20
> On 12/19/19 9:05 PM, Thierry Reding wrote:
> > On Wed, Dec 18, 2019 at 02:46:14PM +0530, Nagarjuna Kristam wrote:
> >> Add usb-role-switch property for Tegra210 and Tegra186 platforms. This
> >> entry is used by XUSB pad controller driver to register for role chang=
es
> >> for OTG/Peripheral capable USB 2 ports.
> >>
> >> Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> ---
> >> V2:
> >>  - Moved usb-role-switch to seperate Required section as suggested by =
Thierry.
> >>  - Added reference to usb/usb-conn-gpio.txt for connector subnode.
> >> ---
> >>  .../devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt         |=
 6 ++++++
> >>  1 file changed, 6 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xus=
b-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-p=
adctl.txt
> >> index 9fb682e..23bf354 100644
> >> --- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padct=
l.txt
> >> +++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padct=
l.txt
> >> @@ -174,6 +174,12 @@ Required properties:
> >>    - "device": for USB device mode
> >>    - "otg": for USB OTG mode
> >> =20
> >> +Required properties for OTG/Peripheral capable USB2 ports:
> >> +- usb-role-switch: Boolean property to indicate that the port support=
 OTG or
> >=20
> > "supports", and also, why if it supports OTG *or* peripheral? Doesn't
> > OTG imply peripheral? OTG means it can be either peripheral or host,
> > right? So I think the end of that sentence can be just:
> >=20
> > 	"... the port supports OTG."
> An USB OTG port is capable of both USB host and peripheral operations. An=
 USB
> peripheral port can only act as an USB peripheral.
>=20
> The micro USB ports found on Jetson TX1/TX2 platforms are micro-AB ports =
which
> should implement both host and peripheral capabilities. We say such ports
> support OTG. The micro USB port found on Jetson Nano is a micro-B port wh=
ich
> should implement peripheral capability only. We say such ports support
> peripheral, rather than OTG.

I the port supports only peripheral mode, why do we need to have a
usb-role-switch property? Shouldn't we in that case have a mode property
with value "device"?

usb-mode-switch is only needed if mode =3D "otg", isn't it? In all other
cases the functionality is fixed (either host or peripheral) and the
mode cannot be switched.

Thierry

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4YXREACgkQ3SOs138+
s6GSDA//Yw+iQiAYCgTYvc8Y87l6JkMSfV5RQCKnFtHwPuevL/EIVxztqcP6eia0
ejTKfTSjVgF03rW7wGevtgY/g/xrn2K0IcaIYOwFqNZiOKY7lCcGjvuqOKbg+jsz
TKJJR+Y3NTyGHYHmsv9vGjqpLgIzIWNaRc6Ena5HoZZ0o0CW8TmLTynK2a6mG/OO
k7WT6fbFB6eGykl/KlnCghg5p/tgLwRFNhPI9I6eOO6w2BNvKhOqPc1isblZdQ1v
Ct4XyitxtqdCSvHtO8X3B7aNDtgn/n9ch2Gu5Ws1Y3ZK94iNFK8x29RV9Z+DoHbb
253u4npM88dzRNj2UOT9Q3RVh0E1a58RwNq3PIA9VPbzPyRo0X7eOqA5SiGGKspo
zXCiEGwBonv0dK9iBNUsceDuf5eQHHBDpujLGAyvSMFKQOTVw35i2T+29Nul6XFT
rJ35Dnp1wCzRA3FYGfYZMfDHTQJzFFhy4pPvOCU5wqv+Oi1BThLjrWcVHoQWvUCr
0lH/1ceX0A+c0bRMmRVZxZCCEk0xz5oafmFcp89oGwX1rQxtfh4uxeU6VrihTl3O
Yvyk9Rx5HxcZ0zyytaE5NdVlKOdQKuRS7w+ayeX6iVKN3453YLO+oWVZ0DQc/IKJ
eiN/eOfcl2ZckowJ5ITjilaL35vwRe95RYVtTS1YRgqfe1Gz+4Y=
=8Zk5
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--
