From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V1 0/8] Tegra XUSB charger detect support
Date: Mon, 30 Mar 2020 13:07:19 +0300
Message-ID: <875zem2m20.fsf@kernel.org>
References: <1584527467-8058-1-git-send-email-nkristam@nvidia.com> <87pncve963.fsf@kernel.org> <48fde9ce-7d40-c2c3-1a9c-994654a02367@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <48fde9ce-7d40-c2c3-1a9c-994654a02367-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> writes:
> On 29-03-2020 16:10, Felipe Balbi wrote:
>>> This patch series adds charger detect support on XUSB hardware used in
>>> Tegra210 and Tegra186 SoCs.
>>>
>>> This patchset is composed with :
>>>   - dt bindings of XUSB Pad Controller
>>>   - Tegra XUSB device mode driver to add vbus_draw support
>>>   - Tegra PHY driver for charger detect support
>>>
>>> Tests done:
>>>   - Connect USB cable from ubuntu host to micro-B port of DUT to detect
>>>     SDP_TYPE charger
>>>   - Connect USB cable from external powered USB hub(which inturn connec=
ts
>>>     to ubuntu host) to micro-B port of DUT to detect CDP_TYPE charger.
>>>   - Connect USB cable from USB charger to micro-B port of DUT to detect
>>>     DCP_TYPE charger.
>>> DUT: Jetson-tx1, Jetson tx2.
>>>
>>> Nagarjuna Kristam (8):
>>>    dt-bindings: phy: tegra-xusb: Add charger-detect property
>>>    usb: gadget: tegra-xudc: Add vbus_draw support
>>>    phy: tegra: xusb: Add support for UTMI pad power control
>>>    phy: tegra: xusb: Add USB2 pad power control support for Tegra210
>>>    phy: tegra: xusb: Add soc ops API to enable UTMI PAD protection
>>>    phy: tegra: xusb: Add support for charger detect
>>>    phy: tegra: xusb: Enable charger detect for Tegra186
>>>    phy: tegra: xusb: Enable charger detect for Tegra210
>> this doesn't apply cleanly. Could you resend after -rc1 is tagged?
>>=20
>> -- balbi
>
> Sure, will send rebased patch once rc1 is available.

Thank you

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6BxNcACgkQzL64meEa
mQb6uw/+Jw0l6xhc47L2wGe3VtmVnfoW4PXuqhadHEnexsIsDoPU996tLlojuqtI
IQtQv5KKOZpMr7agoR7sDkBEr7xjxAuJKtd3tmT4Ib9qmaerUAzXUw6FLLKVPP+U
d4J0s8F2vMqnHnAUp8uWVeTliUhXykHePG1lOmAjvEIeopFHVMHBg8QJ687BFEgt
veR5rqUPJEBo05dwL/+3k1jSraWgnCPYKKPi8/G9IiomNWBu+a2/F06yj/F0ZguI
+IslMiqkb4lrqSoF5T3d9iK/5C3WZtgpiKYKdfLu7Q/5Fokbj0bCD9Jpg2sDbEYq
nEaHVEiLEYVAjHhWonAER3GGNg7cXGbNrYsVmE5sYYRWqeBZz9pgiEu0Ll7UCyRT
VjLptlJojWEiYkWmykuoB+bShWLI8L+AhNlX7h8llX8cfgNW9ZWAIIF1RrkcYM4T
pfNgFf4+Pskvm7miJ//w7pQT6F4Mrb2vdmDUDtDLm6YAEIHxl6cAUZJD60gA8ZUq
8qLA+yTfoj3QD6HUgqZhXPJ+g1KrTCufvFAaBuWGEhiN2ZoEsOVMA2qWXVXXkZb6
9sOgPlMwRgLoBUphbU8bdBXuEtj8dsvfdWKMB97+mOmbz/L3b9iC5KoI4BDQw/xl
wkvDcPeD9GjDwOECEdjjSOoxZL17UIVADvtEtNCyHuVKnQD216E=
=cObg
-----END PGP SIGNATURE-----
--=-=-=--
