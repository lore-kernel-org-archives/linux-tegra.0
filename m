From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Patch V2 02/18] dt-bindings: usb: Add NVIDIA Tegra XUSB device
 mode controller binding
Date: Thu, 19 Dec 2019 14:10:20 +0100
Message-ID: <20191219131020.GH1440537@ulmo>
References: <1576660591-10383-1-git-send-email-nkristam@nvidia.com>
 <1576660591-10383-3-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xHbokkKX1kTiQeDC"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1576660591-10383-3-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--xHbokkKX1kTiQeDC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2019 at 02:46:15PM +0530, Nagarjuna Kristam wrote:
> Add device-tree binding documentation for the XUSB device mode controller
> present on Tegra210 and Tegra186 SoC. This controller supports the USB 3.0
> specification.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
> V2:
>  - used enum instead of oneOf and const.
>  - Moved reg, reg-names, clocks, clock-names to property section from all=
Of.
>  - Limited allOf to min and max items based on soc.
>  - Updated description for power-domains.
>  - Added V1 reference
> ---
> V1
>  - This document is yaml version of [1], with difference of usb-role-swit=
ch
>    removal.
> [1] https://patchwork.kernel.org/patch/11156253/=20
> ---
>  .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml | 190 +++++++++++++++=
++++++
>  1 file changed, 190 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xu=
dc.yaml

Acked-by: Thierry Reding <treding@nvidia.com>

--xHbokkKX1kTiQeDC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl37drwACgkQ3SOs138+
s6FUQQ/+OrJZ0hWoS78OvNSUKU7kj5/4HMxKtRlJYDRrzGmyKWyIWZYEqVDysdia
j4v1eFU5qv4WaMLtfM+S9lgRgK5lOJq0rmYll+dhyYdeemeIkg3rSYIOzvSLUONV
5mKh6rke3+0LgVXL5Vw3iZxBp47n5rlUVKDsRGgUzPF5VgF5VsCRO9Pl0qIi+q3l
e9TqdpDTY6AKTYzIL1Gg3nty+gURZ1t1wUYXDJq9GSzUBYu2fNG4F9NmI3XmcKzu
19g6rC39FV1aqyjqVJ2pSDNhjI8zBXNNVvTl7RFLo7EyVoECnsVYwYp30gQzNrmm
NJfNinkKZBXx5jGlGsGK/HuRal5umvY/2Hvz6CmFpT2NwI249kAb06xG0KfOK1h+
q5IgZiSE+60cEXHPEcqz209306XjLELsYrlAP6IcI+3nBAZq+y8s5fgs35wJ5PfH
3cjQvS1IZiDH9P5pqE8zq61/jhLgGgPEpAixEr0twvZ9UPhw0yDr6K5YN1tAgQaG
TYdl47GxYlDMHUOOq+6T8yUlqhcOqmNhyV0aVHDao9LLSBNOs7AxiLSFC1a2Ef+O
FQWcikXoLaPW7o5y1Qp7VRMEvHVWGLYBPdO/pfTnlKDdW1WQ9qPfY10RSociPJTw
+2bHzACFUla3quMKz+NruDHjDxcSug+qq/OfTVXG6yMviOYX/zY=
=tlfO
-----END PGP SIGNATURE-----

--xHbokkKX1kTiQeDC--
