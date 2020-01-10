From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 3/5] dt-bindings: phy: tegra: Add Tegra194 support
Date: Fri, 10 Jan 2020 12:26:50 +0100
Message-ID: <20200110112650.GB2233456@ulmo>
References: <20200103081814.9848-1-jckuo@nvidia.com>
 <20200103081814.9848-4-jckuo@nvidia.com>
 <20200103223940.GA9205@bogus>
 <baa9b5f4-74be-0ab4-0b24-bf926cf3207c@nvidia.com>
 <4c3f3776-65e2-aafd-7bb9-fa69df301cb6@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DBIVS5p969aUjpLe"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4c3f3776-65e2-aafd-7bb9-fa69df301cb6-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--DBIVS5p969aUjpLe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 09, 2020 at 09:31:27AM +0800, JC Kuo wrote:
> Hi Rob,
> For now we have two options.
> 1. reusing the existing "maximum-speed" which is documented in usb/generi=
c.txt
> Pro: no need to add new property
> Con: only "super-speed" and "super-speed-plus" are valid for Tegra XUSB P=
ADCTL,
> therefore extra code/document change is required.
>=20
> +	if (device_property_present(&port->dev, "maximum-speed")) {
> +		maximum_speed =3D  usb_get_maximum_speed(&port->dev);
> +		if (maximum_speed =3D=3D USB_SPEED_SUPER)
> +			usb3->disable_gen2 =3D true;
> +		else if (maximum_speed =3D=3D USB_SPEED_SUPER_PLUS)
> +			usb3->disable_gen2 =3D false;
> +		else
> +			return -EINVAL;
> +	}
>=20
> 2. introducing a new proprietary "nvidia,disable-gen2" property
> Pro: its logic perfectly matches the need, and code change is minimum
>=20
> +        usb3->disable_gen2 =3D of_property_read_bool(np, "nvidia,disable=
-gen2");
>=20
> Con: it's a new and proprietary property.
>=20
> Please let me know which one do you prefer or there is something else
> works better.

I think the first version is much clearer. maximum-speed =3D "super-speed"
is very clear and explicit. nvidia,disable-gen2 is less so. While it may
be true in this case what "disable-gen2" does, using the generic
bindings has the advantage that it'll be more familiar to people already
familiar with other USB device tree bindings.

Also, the nvidia,disable-gen2 property only perfectly matches the need
because it reflects the name of the variable. If you rewrote the code to
do something like this:

	if (port->maximum_speed <=3D USB_SPEED_SUPER) {
		/* disable gen2 */
		...
	}

Then all of a sudden the "maximum-speed" property is a perfect match. In
general, bindings should be natural to the domain of the bus or device
that they describe rather than a reflection of how the driver programs
the device's registers.

On a side-note: we should also update the usb/generic.txt binding to
describe the "super-speed-plus" value for the maximum-speed property.

Thierry

> Thanks,
> JC
>=20
>=20
> On 1/6/20 3:10 PM, JC Kuo wrote:
> > On 1/4/20 6:39 AM, Rob Herring wrote:
> >> On Fri, Jan 03, 2020 at 04:18:12PM +0800, JC Kuo wrote:
> >>> Extend the bindings to cover the set of features found in Tegra194.
> >>> Note that, technically, there are four more supplies connected to the
> >>> XUSB pad controller (DVDD_PEX, DVDD_PEX_PLL, HVDD_PEX and HVDD_PEX_PL=
L)
> >>> , but the power sequencing requirements of Tegra194 require these to =
be
> >>> under the control of the PMIC.
> >>>
> >>> Tegra194 XUSB PADCTL supports up to USB 3.1 Gen 2 speed, however, it
> >>> is possible for some platforms have long signal trace that could not
> >>> provide sufficient electrical environment for Gen 2 speed. This patch
> >>> adds a "maximum-speed" property to usb3 ports which can be used to
> >>> specify the maximum supported speed for any particular USB 3.1 port.
> >>> For a port that is not capable of SuperSpeedPlus, "maximum-speed"
> >>> property should carry "super-speed".
> >>>
> >>> Signed-off-by: JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>> ---
> >>> Changes in v5:
> >>> - re-use "maximum-speed" instead of adding "nvidia,disable-gen2"
> >>> Changes in v4: none
> >>> Changes in v3: none
> >>> Changes in v2:
> >>> - fix a typo
> >>>
> >>>  .../phy/nvidia,tegra124-xusb-padctl.txt        | 18 ++++++++++++++++=
++
> >>>  1 file changed, 18 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xu=
sb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-=
padctl.txt
> >>> index 9fb682e47c29..7d0089006e67 100644
> >>> --- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padc=
tl.txt
> >>> +++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padc=
tl.txt
> >>> @@ -37,6 +37,7 @@ Required properties:
> >>>    - Tegra132: "nvidia,tegra132-xusb-padctl", "nvidia,tegra124-xusb-p=
adctl"
> >>>    - Tegra210: "nvidia,tegra210-xusb-padctl"
> >>>    - Tegra186: "nvidia,tegra186-xusb-padctl"
> >>> +  - Tegra194: "nvidia,tegra194-xusb-padctl"
> >>>  - reg: Physical base address and length of the controller's register=
s.
> >>>  - resets: Must contain an entry for each entry in reset-names.
> >>>  - reset-names: Must include the following entries:
> >>> @@ -62,6 +63,10 @@ For Tegra186:
> >>>  - vclamp-usb-supply: Bias rail for USB pad. Must supply 1.8 V.
> >>>  - vddio-hsic-supply: HSIC PHY power supply. Must supply 1.2 V.
> >>> =20
> >>> +For Tegra194:
> >>> +- avdd-usb-supply: USB I/Os, VBUS, ID, REXT, D+/D- power supply. Mus=
t supply
> >>> +  3.3 V.
> >>> +- vclamp-usb-supply: Bias rail for USB pad. Must supply 1.8 V.
> >>> =20
> >>>  Pad nodes:
> >>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> @@ -154,6 +159,11 @@ For Tegra210, the list of valid PHY nodes is giv=
en below:
> >>>  - sata: sata-0
> >>>    - functions: "usb3-ss", "sata"
> >>> =20
> >>> +For Tegra194, the list of valid PHY nodes is given below:
> >>> +- usb2: usb2-0, usb2-1, usb2-2, usb2-3
> >>> +  - functions: "xusb"
> >>> +- usb3: usb3-0, usb3-1, usb3-2, usb3-3
> >>> +  - functions: "xusb"
> >>> =20
> >>>  Port nodes:
> >>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> @@ -221,6 +231,11 @@ Optional properties:
> >>>    is internal. In the absence of this property the port is considere=
d to be
> >>>    external.
> >>> =20
> >>> +- maximum-speed: Only for Tegra194. A string property that specifies=
 maximum
> >>> +  supported speed of a usb3 port. Valid values are:
> >>> +  - "super-speed-plus": default, the usb3 port supports USB 3.1 Gen =
2 speed.
> >>
> >> Not defined as a valid value in usb/generic.txt. '-gen2' instead of=20
> >> '-plus' would be clearer IMO. However, is there any need to define the=
=20
> >> maximum speed possible? The purpose of this property is to limit the=
=20
> >> speed below the max.
> >>
> > usb_get_maximum_speed(), which parses "maximum-speed" property, indeed =
handles
> > string "super-speed-plus". Should "super-speed-plus" be documented in
> > usb/generic.txt"?
> >=20
> > static const char *const speed_names[] =3D {
> > 	[USB_SPEED_UNKNOWN] =3D "UNKNOWN",
> > 	[USB_SPEED_LOW] =3D "low-speed",
> > 	[USB_SPEED_FULL] =3D "full-speed",
> > 	[USB_SPEED_HIGH] =3D "high-speed",
> > 	[USB_SPEED_WIRELESS] =3D "wireless",
> > 	[USB_SPEED_SUPER] =3D "super-speed",
> > 	[USB_SPEED_SUPER_PLUS] =3D "super-speed-plus",
> > };
> >=20
> > A proprietary "nvidia,disable-gen2" property was proposed in earlier re=
vision to
> > "limit the speed below the max". I like it because it fit our needs bet=
ter and
> > requires only one line of code change.
> >=20
> >    usb3->disable_gen2 =3D of_property_read_bool(np, "nvidia,disable-gen=
2");
> >=20
> > Should I fallback to that approach?
> >=20
> > Thanks,
> > JC
> >=20
> >>> +  - "super-speed": the usb3 port supports USB 3.1 Gen 1 speed only.
> >>> +
> >>>  For Tegra124 and Tegra132, the XUSB pad controller exposes the follo=
wing
> >>>  ports:
> >>>  - 3x USB2: usb2-0, usb2-1, usb2-2
> >>> @@ -233,6 +248,9 @@ For Tegra210, the XUSB pad controller exposes the=
 following ports:
> >>>  - 2x HSIC: hsic-0, hsic-1
> >>>  - 4x super-speed USB: usb3-0, usb3-1, usb3-2, usb3-3
> >>> =20
> >>> +For Tegra194, the XUSB pad controller exposes the following ports:
> >>> +- 4x USB2: usb2-0, usb2-1, usb2-2, usb2-3
> >>> +- 4x super-speed USB: usb3-0, usb3-1, usb3-2, usb3-3
> >>> =20
> >>>  Examples:
> >>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> --=20
> >>> 2.17.1
> >>>

--DBIVS5p969aUjpLe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4YX3cACgkQ3SOs138+
s6FCxg//arY/AcuyLR3BTqpXwVbyi6/GMzL/P1M6/9Lv1Em51mQ0la0M6rj+rCVo
88caAAiTbOx7MWCjtoQYO3DJUSNEloTzVd0RLLQfia6o6Im+LbKvaUoES+ivcGAk
/x/IydkBw4UXq4AOiuRemmp4Su1jDaE8mr/lBNXw2w/xQ2whAOEQSUY2I57N47ll
rFbG1Zl/biyexIO9WWdbdG7SbytehczuOMVZNkObM995/KxkCV/59vsbyeo6citr
0hNKR1kWC5MT5NGLO0xNmz/hMadz6tg2jH4HwEzKT9n24MUtNln99FoX0z0xe98q
SpVwOCGlpEc93bu6ynuW4ego4YzJbdWBwL9QIG8hp2gb6LuUNrlrI3ZAvw8/tfbG
anDexKUpl9tKUlf/yfQ0/yeDc2oogzasy7/J0aG1OYuyZ/ttMqUNoJY990QDU0iC
eORngBWk7LjdBJUcfNo9QfQ9EpXQct1qose8xoV6gYiTttSDTEAa813R+c2BlsXf
qe48w75g2uTNcQU4q9vtKNzI4b/AccJG7fGl5oG1ykNi1x4tPd6QWTHI7MVnIDCT
k3UJbFEwfMMqs6qz3msUMp7yn56ExwCT10WnRPiXW7TK2HKk+vIu94ZoX7QhI8pW
k8RuQ/u9oofeZqs+yueUlxnxX4BUEauewTefaVYod+i+pSalZDw=
=fxbc
-----END PGP SIGNATURE-----

--DBIVS5p969aUjpLe--
