From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 01/18] dt-bindings: phy: tegra-xusb: Add usb-role-switch
Date: Fri, 6 Dec 2019 15:49:05 +0100
Message-ID: <20191206144905.GC2085684@ulmo>
References: <1575629421-7039-1-git-send-email-nkristam@nvidia.com>
 <1575629421-7039-2-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5QAgd0e35j3NYeGe"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1575629421-7039-2-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--5QAgd0e35j3NYeGe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2019 at 04:20:04PM +0530, Nagarjuna Kristam wrote:
> Add usb-role-switch property for Tegra210 and Tegra186 platforms. This
> entry is used by XUSB pad controller driver to register for role changes
> for OTG/Peripheral capable USB 2 ports.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt | =
4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-p=
adctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padc=
tl.txt
> index 9fb682e..0f19ed6 100644
> --- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.t=
xt
> +++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.t=
xt
> @@ -179,6 +179,10 @@ Optional properties:
>    is internal. In the absence of this property the port is considered to=
 be
>    external.
>  - vbus-supply: phandle to a regulator supplying the VBUS voltage.
> +- usb-role-switch: boolean property to indicate use of USB Role Switch.

That first sentence here seems a bit useless and vague. It doesn't
really convey anything other than the name already does. Perhaps
something like:

	Boolean property to indicate that the port support OTG. If
	present, the port supports switching between USB host and
	peripheral roles.

> +  This property is MUST for OTG,Peripheral capable USB 2 ports. Connector

If this is mandatory, why not add it to the list of required properties?
I guess since it's only mandatory for ports that support OTG, perhaps we
could add a section "Required properties for OTG capable ports:" or
something like that? Then you can also omit the second sentence in the
description.

> +  should be added as subnode, see connector.txt. vbus-gpio in connector =
is

There's no file called "connector.txt". Are you referring to

	Documentation/devicetree/bindings/connector/usb-connector.txt

? Also, that file calls the property "vbus-gpios" and lists it as
optional. What would happen if we don't specify it? Doesn't that just
mean that we can't support role detection?

> +  Mandatory.

"mandatory"

Thierry

> =20
>  ULPI ports:
>  -----------
> --=20
> 2.7.4
>=20

--5QAgd0e35j3NYeGe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3qal8ACgkQ3SOs138+
s6FCvw//W+tif2kSJJtiPRCRw6jpSoXUwVAjU7ZwbXXADIhJu5fnxdzio29NFIsp
BAe7QcXP8emgeUdOvZuRedDX5RX1KZkSz8i3JV2o6kMHa1u2Jnu+pQFv1nQz2HnE
ATTUej+WAX8pPy/EVkW3UX0dqUWw8/agZzJckfuoQpXhjgZB5to7ZAAb0eN8Oxwb
uNqYVxunX+A4mRcyHNCZlAsdH5K8qv4ueZezgChS5zmK9nou7pV3vjS5SK2KPrZp
aHwXhtM98CcLto2nOs4S84GDMUMgECxIM9LCLETt6oLNjs+J6UVmJrh2yJ+xqQTG
BKp6mwp53p3KMMT+7nUG7WsRElFP/w9QPcLbxBXCfqUzlA57/yj/DVWqitJbaSkS
U+bEAhxg/n7NJVDFF0JR06YABn/fYE2uRX8otXE18DtrVFaQgRV9jx2sFWrOh1gv
6a5Je+nXSQvx4j3/0otBIuoPqDli85rDHwpWamqW3PmBCyqJF3eg1kepOcwFnB1V
lZ4Y9bsGy/yKsQjrfLpe0AEC3Jo+OxIBrwrSz3VATz0LLnXUH+tbt7bTrJetE29a
qiXlTtdWLsnYMGvnmYts+bKw7FaEuKqz9b/Yd/iw4LO47xo4r/Pfx5tXMng+KiG0
Ve+Bp9KBju8Llg/5nojd9FVQtlV4n+uY+XnibgICSsjJdhMyQfQ=
=Ud+/
-----END PGP SIGNATURE-----

--5QAgd0e35j3NYeGe--
