From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH] dt: Tegra XUSB padctl: per-lane PHYs and USB lane map
Date: Wed, 21 Oct 2015 14:15:13 +0200
Message-ID: <20151021121513.GA24168@ulmo>
References: <1445297442-21439-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1445297442-21439-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2015 at 05:30:42PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Convert the binding to provide a PHY per lane, rather than a PHY per
> "pad" block in the hardware. This will allow the driver to easily know
> which lanes are used by clients, and thus only enable those lanes, and
> generally better aligns with the fact the hardware has configuration per
> lane rather than solely configuration per "pad" block.
>=20
> Add entries to pinctrl-tegra-xusb.h to enumerate all "pad" blocks on
> Tegra210, which will allow an XUSB DT node to reference the PHYs it needs.
>=20
> Add an nvidia,ss-port-map register to allow configuration of the
> XUSB_PADCTL_SS_PORT_MAP register.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Thierry, Jon, here's a start at where I think the XUSB padctl binding
> should go. What are your thoughts on this approach?
>=20
> Kishon, this implements a "PHY-per-lane" approach for Tegra's XUSB padctl
> module. Does the result look good to you? You may need to apply the patch
> for the binding doc to make sense since I guess you aren't familiar with
> the binding or HW.
>=20
>  .../pinctrl/nvidia,tegra124-xusb-padctl.txt        | 122 +++++++++++++++=
------
>  include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h   |  24 +++-
>  2 files changed, 108 insertions(+), 38 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xu=
sb-padctl.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-x=
usb-padctl.txt
> index 3952d893635c..9b39f3283636 100644
> --- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padc=
tl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padc=
tl.txt
> @@ -1,16 +1,31 @@
>  Device tree binding for NVIDIA Tegra XUSB pad controller
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> =20
> -The Tegra XUSB pad controller manages a set of lanes, each of which can =
be
> -assigned to one out of a set of different pads. Some of these pads have =
an
> -associated PHY that must be powered up before the pad can be used.
> -
> -This document defines the device-specific binding for the XUSB pad contr=
oller.
> +The Tegra XUSB pad controller manages a set of "pads". Each pad drives o=
utput
> +to (or receives input from) one or more SoC IO signals, or (pad) lanes. =
Note
> +that in many contexts, a "pad" is an individual pin/signal/ball on a chip
> +package. In the context of this documentation, a "pad" refers to a sub-b=
lock
> +of the XUSB padctl HW module, which in turn is attached to potentially m=
ore
> +than one pin/signal/ball on the chip. This unusual use of terminology is
> +consistent with Tegra hardware documentation.
> +
> +These pads must typically be powered up and configured before they can be
> +used. Individual lanes may also need various configuration applied to be
> +useful. This binding allows specification of the set of pads and lanes t=
o be
> +used in a particular system, and their associated configuration.
> +
> +Various IO controllers are attached to the pad controller internally to =
Tegra.
> +Examples are USB2, XUSB, SATA, and PCIe. The XUSB padctl contains muxes =
that
> +route the IO controllers' lanes to the lanes of the pads. This binding a=
llows
> +specification of the intended configuration of these muxes.
> =20
>  Refer to pinctrl-bindings.txt in this directory for generic information =
about
>  pin controller device tree bindings and ../phy/phy-bindings.txt for deta=
ils on
>  how to describe and reference PHYs in device trees.
> =20
> +Each PHY provided by this binding refers to a single (differential, and
> +typicallly bi-directional) lane of a pad.
> +
>  Required properties:
>  --------------------
>  - compatible: Valid options are:
> @@ -24,8 +39,19 @@ Required properties:
>    See ../reset/reset.txt for details.
>  - reset-names: Must include the following entries:
>    - padctl
> -- #phy-cells: Should be 1. The specifier is the index of the PHY to refe=
rence.
> -  See <dt-bindings/pinctrl/pinctrl-tegra-xusb.h> for the list of valid v=
alues.
> +- #phy-cells: Should be 2. The first cell indicates the pad that impleme=
nts
> +  the lane. See <dt-bindings/pinctrl/pinctrl-tegra-xusb.h> for the list =
of
> +  valid values. The second cell indicates the lane within the pad.
> +
> +Optional properties:
> +--------------------
> +- nvidia,ss-port-map: This value to program into the XUSB_PADCTL_SS_PORT=
_MAP
> +  register. If this value is missing, no programming of the register sho=
uld
> +  occur.
> +
> +FIXME: Probably need other global properties to initialize registers suc=
h as
> +XUSB_PADCTL_SNPS_OC_MAP_0, XUSB_PADCTL_USB2_OC_MAP_0,
> +XUSB_PADCTL_VBUS_OC_MAP_0...
> =20
>  Lane muxing:
>  ------------
> @@ -34,28 +60,34 @@ Child nodes contain the pinmux configurations followi=
ng the conventions from
>  the pinctrl-bindings.txt document. Typically a single, static configurat=
ion is
>  given and applied at boot time.
> =20
> -Each subnode describes groups of lanes along with parameters and pads th=
at
> -they should be assigned to. The name of these subnodes is not important.=
 All
> -subnodes should be parsed solely based on their content.
> +Each subnode describes arbitary sets of (pad) lanes along with muxing and
> +configuration parameters that should be applied to them. The name of the=
se
> +subnodes is not important. All subnodes should be parsed solely based on=
 their
> +content.
> =20
>  Each subnode only applies the parameters that are explicitly listed. In =
other
> -words, if a subnode that lists a function but no pin configuration param=
eters
> +words, a subnode that lists a function but no pin configuration paramete=
rs
>  implies no information about any pin configuration parameters. Similarly=
, a
> -subnode that describes only an IDDQ parameter implies no information abo=
ut
> -what function the pins are assigned to. For this reason even seemingly b=
oolean
> -values are actually tristates in this binding: unspecified, off or on.
> +subnode that describes only an configuration parameter implies no inform=
ation
> +about what function the pins are assigned to. For this reason even seemi=
ngly
> +boolean values are actually tristates in this binding: unspecified, off =
or on.
>  Unspecified is represented as an absent property, and off/on are represe=
nted
>  as integer values 0 and 1.
> =20
>  Required properties:
> -- nvidia,lanes: An array of strings. Each string is the name of a lane (=
pad).
> +- nvidia,lanes: An array of strings. Each string is the name of a (pad) =
lane.
>    Valid values for lanes are listed below.
> =20
>  Optional properties:
>  - nvidia,function: A string that is the name of the function (IO control=
ler)
>    that the pin or group should be assigned to. Valid values for function=
 names
>    are  listed below.
> -- nvidia,iddq: Enables IDDQ mode of the lane. (0: no, 1: yes)
> +- FIXME: Need to add e.g. nvidia,hsic-strobe-trim,
> +  nvidia,otg-hs-curr-level-offset, ...
> +
> +Deprecated properties:
> +- nvidia,iddq: (single-cell) Integer. Programming this value statically
> +  violates prescribed HW programming rules, hence this property is depre=
cated.
> =20
>  Note that not all of these properties are valid for all lanes. Lanes can=
 be
>  divided into three groups:
> @@ -66,7 +98,8 @@ divided into three groups:
> =20
>      Valid functions for this group are: "snps", "xusb", "uart", "rsvd".
> =20
> -    The nvidia,iddq property does not apply to this group.
> +    FIXME: I'm not sure if usb2-bias needs to be exposed as a PHY, or if=
 XUSB
> +    padctl can simply configure/enable it itself?
> =20
>    - ulpi-0, hsic-0, hsic-1:
> =20
> @@ -74,8 +107,6 @@ divided into three groups:
> =20
>      Valid functions for this group are: "snps", "xusb".
> =20
> -    The nvidia,iddq property does not apply to this group.
> -
>    - pcie-0, pcie-1, pcie-2, pcie-3, pcie-4, pcie-5, pcie-6, sata-0:
> =20
>      (pcie-5, pcie-6 are valid on Tegra210 only.)
> @@ -86,7 +117,6 @@ divided into three groups:
>      On Tegra210, valid functions for this group are "pcie-x1", "usb3",
>      "sata", "pcie-x4".
> =20
> -
>  Example:
>  =3D=3D=3D=3D=3D=3D=3D=3D
> =20
> @@ -99,45 +129,65 @@ SoC file extract:
>  		resets =3D <&tegra_car 142>;
>  		reset-names =3D "padctl";
> =20
> -		#phy-cells =3D <1>;
> +		#phy-cells =3D <2>;
>  	};
> =20
>  Board file extract:
>  -------------------
> =20
>  	pcie-controller@0,01003000 {
> -		...
> -
> -		phys =3D <&padctl 0>;
> -		phy-names =3D "pcie";
> +		status =3D "okay";
> +
> +		pci@1,0 {
> +			status =3D "okay";
> +			nvidia,num-lanes =3D <4>;
> +			phys =3D <&padctl TEGRA_XUSB_PADCTL_PCIE 1>,
> +			       <&padctl TEGRA_XUSB_PADCTL_PCIE 2>,
> +			       <&padctl TEGRA_XUSB_PADCTL_PCIE 3>,
> +			       <&padctl TEGRA_XUSB_PADCTL_PCIE 4>;
> +			/* These are the lane IDs within this PCIe port */
> +			phy-names =3D "0", "1", "2", "3";
> +		};
> =20
> -		...
> +		pci@2,0 {
> +			status =3D "okay";
> +			nvidia,num-lanes =3D <1>;
> +			phys =3D <&padctl TEGRA_XUSB_PADCTL_PCIE 0>;
> +			phy-names =3D "0";
> +		};
>  	};
> =20
> -	...
> +	padctl@0,7009f000 {
> +		status =3D "okay";
> =20
> -	padctl: padctl@0,7009f000 {
>  		pinctrl-0 =3D <&padctl_default>;
>  		pinctrl-names =3D "default";
> =20
>  		padctl_default: pinmux {
> +			xusb {
> +				nvidia,lanes =3D "otg-1", "otg-2";
> +				nvidia,function =3D "xusb";
> +			};
> +
>  			usb3 {
> -				nvidia,lanes =3D "pcie-0", "pcie-1";
> +				nvidia,lanes =3D "pcie-5", "pcie-6";
>  				nvidia,function =3D "usb3";
> -				nvidia,iddq =3D <0>;
>  			};
> =20
> -			pcie {
> -				nvidia,lanes =3D "pcie-2", "pcie-3",
> -					       "pcie-4";
> -				nvidia,function =3D "pcie";
> -				nvidia,iddq =3D <0>;
> +			pcie-x1 {
> +				nvidia,lanes =3D "pcie-0";
> +				nvidia,function =3D "pcie-x1";
> +			};
> +
> +			pcie-x4 {
> +				nvidia,lanes =3D "pcie-1", "pcie-2",
> +					       "pcie-3", "pcie-4";
> +				nvidia,function =3D "pcie-x4";
>  			};
> =20
>  			sata {
>  				nvidia,lanes =3D "sata-0";
>  				nvidia,function =3D "sata";
> -				nvidia,iddq =3D <0>;
>  			};
>  		};
>  	};

According to Kishon's latest recommendation, the padctl binding should
probably look more like this:

	padctl@0,7009f000 {
		...

		phys {
			pcie {
				/* 5 subnodes on Tegra124, 7 on Tegra210 */
				pcie-0 {
					...
				};

				...
			};

			sata {
				sata-0 {
					...
				};
			};

			utmi {
				/* 3 subnodes on Tegra124, 4 on Tegra210 */
				utmi-0 {
					...
				};

				...
			};

			hsic {
				/* 2 subnodes */
				hsic-0 {
					...
				};

				...
			};

			/* on Tegra124 only */
			ulpi {
				ulpi-0 {
					...
				};
			};
		};
	};

This is pretty much a direct transcription of the padctl block diagram
in the TRM (e.g. page 1312 in vB4 of the Tegra X1 TRM).

Once we have this, I'm beginning to think that we should just drop the
pinctrl component, because we now have subnodes for each lane that can
carry the configuration. As an aside, going with this more verbose DT
representation should also give us an easy way of providing backwards-
compatibility. The driver could look for the existence of the phys
sub-node and fallback to the old code in its absence.

The above is also nice because it gives us a complete picture of what
lanes are being used. For example, if some of the lanes are unused the
corresponding device tree nodes could be marked status =3D "disabled",
which would come in handy for the programming (e.g. IDDQ).

I think for XUSB we'll need some additional information, though. Your
proposal already adds the nvidia,ss-port-map property to add some of the
information (mapping of SS ports to USB2 ports), but I think that's a)
not very readable and b) doesn't give us enough flexibility to describe
additional meta-data. I'm aware of at least two other pieces of
information that we need: VBUS power supplies and port mode. Originally
I think the binding used indexed names (vbus0-supply, vbus1-supply, ...)
for the VBUS supplies but that's also suboptimally structured in my
opinion. I think we could combine both into something of this sort
(within the padctl node above):

		ports {
			usb3-0 {
				vbus-supply =3D <&vbus1_reg>;
				nvidia,port =3D <1>;
			};

			usb3-1 {
				vbus-supply =3D <&vbus2_reg>;
				nvidia,port =3D <2>;
			};

			...

			utmi-0 {
				vbus-supply =3D <&vbus0_reg>;
				mode =3D "otg";
			};

			utmi-1 {
				vbus-supply =3D <&vbus1_reg>;
				mode =3D "host";
			};

			utmi-2 {
				vbus-supply =3D <&vbus2_reg>;
				mode =3D "host";
			};
		};

Note how both usb3-* and utmi-* ports specify the same regulators for
the same physical port. It would probably be enough to simply have them
listed in one place, but I suspect boards could omit USB2 fallback mode
and wire up only the SS lanes, though I'm not sure if that's permitted.

Granted, the above is rather verbose, but I also think it's a very
readable and at the same time accurate representation of the hardware
and its capabilities.

> diff --git a/include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h b/include/d=
t-bindings/pinctrl/pinctrl-tegra-xusb.h
> index 914d56da9324..edc961202d1c 100644
> --- a/include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h
> +++ b/include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h
> @@ -1,7 +1,27 @@
>  #ifndef _DT_BINDINGS_PINCTRL_TEGRA_XUSB_H
>  #define _DT_BINDINGS_PINCTRL_TEGRA_XUSB_H 1
> =20
> -#define TEGRA_XUSB_PADCTL_PCIE 0
> -#define TEGRA_XUSB_PADCTL_SATA 1
> +/*
> + * These legacy specifiers represent a client that uses an unspecified s=
ubset
> + * of the lanes within a particular "pad". Drivers that handle these
> + * specifiers should enable all lanes of the pad.
> + */
> +#define TEGRA_XUSB_PADCTL_PCIE_LEGACY	0
> +#define TEGRA_XUSB_PADCTL_SATA_LEGACY	1

With the above binding changes I think we could leave this in place.
These indices would be purely for backwards-compatibility and newer
device trees would instead refer to the PHYs directly by the phandle
(with #phy-cells =3D <0>).

Thierry

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWJ4HLAAoJEN0jrNd/PrOhLCEQAIgjl+e4zdPiUj2Fh0n2Boxi
EXwu2JQBLX9zIz+LukioR5CZClk2Fnf/A3dt5eYbEY0+O8xIlf4+HkmcKxrdQ56z
8YM03+BxBvr0Hs8j7zgljuBOxtJQlcdF27MLT0G8XkT/s2jh47xjH85CFcPQ1AMV
th9uyWVq0uJAiw3xWK7bHjA9ZkD6yUpeURW+eJb/ROtPmDpEqx58M9Kvs81n/cqg
qIvBXV1aemnVD8pUgcUxbbm83OFzJdqR2SzkRGgePAU1WhuM5wOADEEXknQNmnDG
VxyXNMPXtJZvs91C3n70wdAc0NRYlXcBU4Z2kXWhQTLqPWr7JA2k0zzzdOG/XGOO
IMeAAv+3yswRORCDwM1i0vKjCTLaoVLa5PtWSF7V9XwEeBPnnCnBox489R4USK+P
qlTK7LFJJUOqB9ZdxwB0h6aZkcUFej7BLgqD+O4jhueFkyqT8/PR7Vg2nqxtoJZe
I06p/5DnrZu9x7ZtgGaVwNmaCa4H8BhX/DdxrHWs95FFsbXhMAbbwL+F6bZt3jCM
ZvRrouSl9Sui6KJT3nnc++CwPf9llN5/dwt/rqBlCr37niIBqUxMAwUDbBVuYBEb
0Xq7jsXQdelROB9PfSJ3XxlPDBHsi+QIT8iMIxH++MXY0JLqDQy0deJVFzw93uWL
uvGcXp8NdOv8E/jdB/zk
=U33W
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
