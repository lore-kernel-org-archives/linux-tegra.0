From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Patch V2 00/18] Tegra XUSB OTG support
Date: Thu, 19 Dec 2019 14:13:49 +0100
Message-ID: <20191219131349.GI1440537@ulmo>
References: <1576660591-10383-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cf0hFtnykp6aONGL"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1576660591-10383-1-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--cf0hFtnykp6aONGL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2019 at 02:46:13PM +0530, Nagarjuna Kristam wrote:
> This patch series adds OTG support on XUSB hardware used in Tegra210 and
> Tegra186 SoCs.
>=20
> This patchset is composed with :
>  - dt bindings of XUSB Pad Controller
>  - dt bindings for XUSB device Driver
>  - Tegra PHY driver for usb-role-switch and usb-phy
>  - Tegra XUSB host mode driver to support OTG mode
>  - Tegra XUSB device mode driver to use usb-phy and multi device mode
>  - dts for XUSB pad controller
>  - dts for xudc
>=20
> Tegra Pad controller driver register for role switch updates for
> OTG/peripheral capable USB ports and adds usb-phy for that corresponding
> USB ports.
>=20
> Host and Device mode drivers gets usb-phy from USB2's phy and registers
> notifier for role changes to perform corresponding role tasks.
>=20
> Tests done:
>  - device mode support using micro-B USB cable connection between ubuntu
>    host and DUT on micro-B port
>  - host mode support by connecting pen-drive to micro USB port on DUT
>    using micro-B OTG cable.
>  - toggling between these 2 modes by hot plugging corresponding cables.

Are there any tests we can run without manual intervention? Can we force
the device into peripheral mode and then setup a configuration using
configfs? I'm not sure how useful that would be since it doesn't really
exercise the driver code very much and doesn't tell whether it's
actually working.

Any other way how we can test this?

Thierry

>=20
> DUT: Jetson-tx1, Jetson tx2.
>=20
> V2:
>  - Updated usb-role-switch documentation for Padctl driver.
>  - Update XUDC bindings doc as suggested by Rob.
>  - Used standard error codes for error return.
>  - Added of_platform_depopulate during error and driver removal.
>  - Updated error variable during phy initialization in XUDC driver.
>  - Updated Tegra210 soc dtb file as per changes to binding doc.
>=20
> Nagarjuna Kristam (18):
>   dt-bindings: phy: tegra-xusb: Add usb-role-switch
>   dt-bindings: usb: Add NVIDIA Tegra XUSB device mode controller binding
>   phy: tegra: xusb: Add usb-role-switch support
>   phy: tegra: xusb: Add usb-phy support
>   phy: tegra: xusb: Add support to get companion USB 3 port
>   phy: tegra: xusb: Add set_mode support for USB 2 phy on Tegra210
>   phy: tegra: xusb: Add set_mode support for utmi phy on Tegra186
>   usb: xhci-tegra: Add OTG support
>   usb: gadget: tegra-xudc: Remove usb-role-switch support
>   usb: gadget: tegra-xudc: Add usb-phy support
>   usb: gadget: tegra-xudc: use phy_set_mode to set/unset device mode
>   usb: gadget: tegra-xudc: support multiple device modes
>   arm64: tegra: update OTG port entries for jetson-tx1
>   arm64: tegra: update OTG port entries for jetson-tx2
>   arm64: tegra: Add xudc node for Tegra210
>   arm64: tegra: Enable xudc on Jetson TX1
>   arm64: tegra: Add xudc node for Tegra186
>   arm64: tegra: Enable xudc node on Jetson TX2
>=20
>  .../bindings/phy/nvidia,tegra124-xusb-padctl.txt   |   6 +
>  .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml | 190 ++++++++++++++
>  arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |  23 +-
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  19 ++
>  arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |  34 ++-
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  19 ++
>  drivers/phy/tegra/Kconfig                          |   1 +
>  drivers/phy/tegra/xusb-tegra186.c                  | 109 ++++++--
>  drivers/phy/tegra/xusb-tegra210.c                  | 126 ++++++++--
>  drivers/phy/tegra/xusb.c                           | 134 ++++++++++
>  drivers/phy/tegra/xusb.h                           |   5 +
>  drivers/usb/gadget/udc/tegra-xudc.c                | 276 ++++++++++++++-=
------
>  drivers/usb/host/xhci-tegra.c                      | 225 +++++++++++++++=
+-
>  include/linux/phy/tegra/xusb.h                     |   2 +
>  14 files changed, 1031 insertions(+), 138 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xu=
dc.yaml
>=20
> --=20
> 2.7.4
>=20

--cf0hFtnykp6aONGL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl37d40ACgkQ3SOs138+
s6GmMQ//UeIXKC8LonKqcjeF4FAXBH0H7fV5IRwdnm8zsRqWRZ18gzLd4ewLz6p3
ETMQBEkzqmxtPsRsWnreMp1lSG8afpBTSjmfRKLqO56+Ch6LB2NRJWU8W+VzHi/m
dMswAhZtjs++/jAPZX/EeME8EBEK60LoSk0XXLCZP51X20OJyJ49IN3SjZUrURP3
DDR2ZGJzL+1gg6PZVRoGFW0qgXyfbK85X189EKCKkG3YnBpXEVOE00HvCOupMdkM
9b8C8JvLP5kDpIVQafyrEphVMdleHNSkXkEYZgyE/TDUG6ypTgUebDxuHLaQu8sq
iZy0bRS3P/uKBHZPxTeURW/EQURY8hBZf8j45Jqq/Qp7LXS6KXaFRFC28d9FealH
bSTUIC2ji+QYuPqyZUj8KwtNXL3pcvOLvUeU7HesM1JRVtA91Qmgy/x1qFqseDGu
fHawy4TE6CFdnaMK+SnmlYgEqH6DtyWCEDq7X8n0RC+IfBd3jTz4JfOKGt2VwLQW
y6t5vP/TSC2eaKRdJIBjEERiqzPEkHGO4Q/7Qm7jrgMx8Uwq8QafMx9Qu5CvSFsV
KZP6nGzhIA32VJAOfn9RdzYpVn7LYvQEZWZ5/vruMvlzJyEbg0vKTtx78akBR73q
6bOLf2kCC3LeSUn/9oTGF63t59L1+9fN7s49eGt/ku91XTG/aN4=
=9laO
-----END PGP SIGNATURE-----

--cf0hFtnykp6aONGL--
