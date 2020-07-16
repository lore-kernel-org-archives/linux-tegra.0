From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4 0/7] Tegra XUSB charger detect support
Date: Thu, 16 Jul 2020 14:48:09 +0200
Message-ID: <20200716124809.GC535268@ulmo>
References: <1593166742-23592-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="L6iaP+gRLNZHKoI4"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1593166742-23592-1-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--L6iaP+gRLNZHKoI4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2020 at 03:48:55PM +0530, Nagarjuna Kristam wrote:
> This patch series adds charger detect support on XUSB hardware used in
> Tegra210 and Tegra186 SoCs.
>=20
> This patchset is composed with :
>  - dt bindings of XUSB Pad Controller
>  - Tegra XUSB device mode driver to add vbus_draw support=20
>  - Tegra PHY driver for charger detect support
>=20
> Tests done:
>  - Connect USB cable from ubuntu host to micro-B port of DUT to detect
>    SDP_TYPE charger
>  - Connect USB cable from external powered USB hub(which inturn connects
>    to ubuntu host) to micro-B port of DUT to detect CDP_TYPE charger.
>  - Connect USB cable from USB charger to micro-B port of DUT to detect
>    DCP_TYPE charger.
> DUT: Jetson-tx1, Jetson tx2.
>=20
> V4:
>  - Added ACKed-by details for PHY driver.
>  - Used BIT macro instead of (1 << index) usage as suggested by Chunfeng =
Yun.
> V3:
>  - Added ACKed-by details for PHY driver and DT changes.
>  - Functions and its arguments are aligned.
>  - Tabs are used for alignment of MACRO's
>  - For vbus_draw USDC callback, usb_phy set_power error is propogated.
>  - Fixed various comments given by thierry.
> V2:
>  - Added ACKed-by details for DT patches.
>  - All patches rebased.
>=20
> Nagarjuna Kristam (7):
>   dt-bindings: phy: tegra-xusb: Add charger-detect property
>   phy: tegra: xusb: Add support for UTMI pad power control
>   phy: tegra: xusb: Add USB2 pad power control support for Tegra210
>   phy: tegra: xusb: Add soc ops API to enable UTMI PAD protection
>   phy: tegra: xusb: Add support for charger detect
>   phy: tegra: xusb: Enable charger detect for Tegra186
>   phy: tegra: xusb: Enable charger detect for Tegra210
>=20
>  .../bindings/phy/nvidia,tegra124-xusb-padctl.txt   |   4 +
>  drivers/phy/tegra/Makefile                         |   2 +-
>  drivers/phy/tegra/cd.c                             | 283 +++++++++++++++=
++++++
>  drivers/phy/tegra/xusb-tegra186.c                  |  92 +++++--
>  drivers/phy/tegra/xusb-tegra210.c                  | 223 +++++++++++-----
>  drivers/phy/tegra/xusb.c                           |  80 ++++++
>  drivers/phy/tegra/xusb.h                           |  22 ++
>  7 files changed, 621 insertions(+), 85 deletions(-)
>  create mode 100644 drivers/phy/tegra/cd.c

Hi Kishon, Vinod,

did you have any further comments on this series or is it good to go
into v5.9?

Thanks,
Thierry

--L6iaP+gRLNZHKoI4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8QTIkACgkQ3SOs138+
s6FW9RAAuZoijrJioV2HdJzgYh/9hgJR3ZM9aE8US3TQS4GJd8DgIEyQwhkA9Scs
dr2zywAL2rfbOw08v+LjYHk5wDkOmEO47+U1by0Uni2114TnsfkQRhMOyLG/rcaU
RIh5PVq2D7szCnjXm49To5kFEjtUnHlmjFiOdZAi2Y81/IygqdLzoKF1T5ZLfmBi
gK/zxuPbHaPjpzuWWldK8c3n4Yys1upiiYNXslJbUCoeKjdi3ckMVqiwtYlFV5h5
LFNuZWic1CYkhhbzbY5FEjEmI7e4TtJHgbPAhjdkQBEs88FYu787ZeO+zFLZNAAZ
SApfrcEMKSDkqboHdTPfN398qQPOUqP88JE8QaFxvaUT3QN6hmwTw2sfYkHMovlJ
qW9jzlNnQjX+oe83M/i/xZzCe39Wihp+E5jOQoJ/8tfXSocVDlPIfG+vqb4nrsz6
dSZmq2m6UFQkJlvBiMRUlHkt38f+gvhV+sM4CuTPV4iJOCCh59YZ1ykQkWncFz8H
ZI9rjD4BUwMxIgci5Fdp7v+sY3NIcdLrOzWXBeV38SkLraRheOM3QJTZzKosDxKJ
XCbgyPf9kD4vbgCNr4QXTrWElkNwyDxz4DpXxqtgJ/xCwKFMHz4uBvM0Rfh7kp9e
gSFR4ycZdy5Wsr3bOHDKoU4/PAoiDaVnJH/LEqXB+i28lP5QsAY=
=xtfh
-----END PGP SIGNATURE-----

--L6iaP+gRLNZHKoI4--
