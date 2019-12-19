From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Patch V2 01/18] dt-bindings: phy: tegra-xusb: Add
 usb-role-switch
Date: Thu, 19 Dec 2019 14:05:03 +0100
Message-ID: <20191219130503.GG1440537@ulmo>
References: <1576660591-10383-1-git-send-email-nkristam@nvidia.com>
 <1576660591-10383-2-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vJguvTgX93MxBIIe"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1576660591-10383-2-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--vJguvTgX93MxBIIe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2019 at 02:46:14PM +0530, Nagarjuna Kristam wrote:
> Add usb-role-switch property for Tegra210 and Tegra186 platforms. This
> entry is used by XUSB pad controller driver to register for role changes
> for OTG/Peripheral capable USB 2 ports.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
> V2:
>  - Moved usb-role-switch to seperate Required section as suggested by Thi=
erry.
>  - Added reference to usb/usb-conn-gpio.txt for connector subnode.
> ---
>  .../devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt         | 6 =
++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-p=
adctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padc=
tl.txt
> index 9fb682e..23bf354 100644
> --- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.t=
xt
> +++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.t=
xt
> @@ -174,6 +174,12 @@ Required properties:
>    - "device": for USB device mode
>    - "otg": for USB OTG mode
> =20
> +Required properties for OTG/Peripheral capable USB2 ports:
> +- usb-role-switch: Boolean property to indicate that the port support OT=
G or

"supports", and also, why if it supports OTG *or* peripheral? Doesn't
OTG imply peripheral? OTG means it can be either peripheral or host,
right? So I think the end of that sentence can be just:

	"... the port supports OTG."

Otherwise:

Acked-by: Thierry Reding <treding@nvidia.com>

--vJguvTgX93MxBIIe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl37dX8ACgkQ3SOs138+
s6E9OA//bHh0F1BqO/aGb55yWkza+6Fr4szv7ielM9sc/RyfkwQ8jskeP5rb+7r/
IDTTzkYWxobsbwANTLhIwyEMwpuGEdIBQDe10fF6gDCHGKo2Lxkh144kAqr44SE+
6pvySmahNmCgv6tI3+CTx9aReMObvwwIwgTCqGWCxAcUHn2KhOlszma920DVcx0D
D0m+xayaAj27F3qGiHgMFkTrCFVxcDCPr7Jijhmp9jfsgnFX3olS8q8qKuiwwqHs
UkkUpwQpFgWuaoDbM10ZG6jk1rRFl005UyUxIPC9dpzZrcsF2SXcp1a+eYYK6j5I
DBOZ1Glhp2MNOU6FdrXrF/Y8bwwwMOgZvjPKoX0DUSJzrHNQ2w/ILnoRgFOifZ//
2HIx8B53g7OK/twNzRzMRsnRlrd+cMESq6KKAjQqBFhfZCIajcU/H9liwqRc2AGw
Vfo+B3VBxgpU+FNY5blJ2G8PQJtXfsZfLZbhqqBiGt+xXqoYu+gacYaBAzlj/1Zs
HPbDDD60DuivV2UXyNMi5Tzvl6LxXdtgjGWZgppPAbysmotdMq/Wn/Jkowj5jGkT
AfWdYe+Gomi7dwZHedqzRyqYNVLV9kVrkZp64I/xu8CgVvUBN4huDlUOW6PB18bv
jRecgrTUOcHWNyVoETkuggvGWuW1bywqR2dqeYimkZmQSfKf9Ro=
=F9ta
-----END PGP SIGNATURE-----

--vJguvTgX93MxBIIe--
