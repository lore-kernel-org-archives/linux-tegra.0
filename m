From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 4/6] dt-bindings: phy: tegra: Add Tegra194 support
Date: Wed, 2 Oct 2019 11:44:38 +0200
Message-ID: <20191002094438.GD3716706@ulmo>
References: <20191002080051.11142-1-jckuo@nvidia.com>
 <20191002080051.11142-5-jckuo@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yudcn1FV7Hsu/q59"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191002080051.11142-5-jckuo@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: JC Kuo <jckuo@nvidia.com>
Cc: gregkh@linuxfoundation.org, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--yudcn1FV7Hsu/q59
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 02, 2019 at 04:00:49PM +0800, JC Kuo wrote:
> Extend the bindings to cover the set of features found in Tegra194.
> Note that, technically, there are four more supplies connected to the
> XUSB pad controller (DVDD_PEX, DVDD_PEX_PLL, HVDD_PEX and HVDD_PEX_PLL)
> , but the power sequencing requirements of Tegra194 require these to be
> under the control of the PMIC.
>=20
> Tegra194 XUSB PADCTL supports up to USB 3.1 Gen 2 speed, however, it is
> possible for some platforms have long signal trace that could not
> provide sufficient electrical environment for Gen 2 speed. To deal with
> this, a new device node property "nvidia,disable-gen2" was added to
> Tegra194 that be used to specifically disable Gen 2 speed for a
> particular USB 3.0 port so that the port can be limited to Gen 1 speed
> and avoid the instability.
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
>  .../bindings/phy/nvidia,tegra124-xusb-padctl.txt | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-p=
adctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padc=
tl.txt
> index 9fb682e47c29..3bef37e7c365 100644
> --- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.t=
xt
> +++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.t=
xt
> @@ -37,6 +37,7 @@ Required properties:
>    - Tegra132: "nvidia,tegra132-xusb-padctl", "nvidia,tegra124-xusb-padct=
l"
>    - Tegra210: "nvidia,tegra210-xusb-padctl"
>    - Tegra186: "nvidia,tegra186-xusb-padctl"
> +  - Tegra194: "nvidia,tegra194-xusb-padctl"
>  - reg: Physical base address and length of the controller's registers.
>  - resets: Must contain an entry for each entry in reset-names.
>  - reset-names: Must include the following entries:
> @@ -62,6 +63,10 @@ For Tegra186:
>  - vclamp-usb-supply: Bias rail for USB pad. Must supply 1.8 V.
>  - vddio-hsic-supply: HSIC PHY power supply. Must supply 1.2 V.
> =20
> +For Tegra194:
> +- avdd-usb-supply: USB I/Os, VBUS, ID, REXT, D+/D- power supply. Must su=
pply
> +  3.3 V.
> +- vclamp-usb-supply: Bias rail for USB pad. Must supply 1.8 V.
> =20
>  Pad nodes:
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> @@ -154,6 +159,11 @@ For Tegra210, the list of valid PHY nodes is given b=
elow:
>  - sata: sata-0
>    - functions: "usb3-ss", "sata"
> =20
> +For Tegra194, the list of valid PHY nodes is given below:
> +- usb2: usb2-0, usb2-1, usb2-2, usb2-3
> +  - functions: "xusb"
> +- usb3: usb3-0, usb3-1, usb3-2, usb3-3
> +  - functions: "xusb"
> =20
>  Port nodes:
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> @@ -221,6 +231,9 @@ Optional properties:
>    is internal. In the absence of this property the port is considered to=
 be
>    external.
> =20
> +- nvidia,disable-gen2: A boolean property whose presence determines that=
 a port
> +  should be limited to USB 3.1 Gen 1. This properlty is only for Tegra19=
4.

s/properlty/property/

With that:

Acked-by: Thierry Reding <treding@nvidia.com>

--yudcn1FV7Hsu/q59
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2UcYUACgkQ3SOs138+
s6GoPA/+JMIwA9BAlwTjZUJ+GX5F2ueO+KNypGWxfrXY9bbnQce4zE0lBjJsFduQ
+SC45V+BO7PzxeiWbY9tabxMQSccdHIkZmg+JeKvV+WlRr+GsMh8w+EDc6uCff6F
+Uo8DWLuST621FBNAgKHHO5HUMYa+tKG0j/c5QlPC7OJJGcYX0gFiM+7UG2WFrm5
kNUOEQTQk6FqwdV7YquWeoyDAP2uPvUgkfghrfZrqpQbgA1j9Kwqrfmt3povSTSr
4ptWP5rYGR8a68t+K0KrtRUfWEo95pr2bjD55IdZIzoqy3hDuoOPPRgZE8b0ETBu
LJVMnKqAPixVZvNZXQXyLYtHQ+k0b5jHQ5f5tNvH9usdLDvnbMcOISW1kTIWtEBI
lPLuXPmThDqxtWEA7eikS8MrmHXmSLe+SMR938X0ba6fU6zGUXBxrPvLPQZXZcPB
tUp7RkAVmF0kfsFyElb1fAqpMcIWPAHeTFrp+5Tn3QOI3gMQ/N9cXLuF+KVvt+CW
PnnwDVNSWJNglB44SOo03L25SRH/n9X/QAY31ip8ddKaseFGngXLXdgN1GyXpdPb
y8Vnm8lliPhUbRAPVC/m5l9YTYKIQ3vHlLz8AZcLif04Z8+K2be9ccjHvucSYTwY
kv57JVC70eEEAlidTyGlaXTc3F2KVjV4P/Fzr2JE8stAMMz9ekE=
=HWX1
-----END PGP SIGNATURE-----

--yudcn1FV7Hsu/q59--
