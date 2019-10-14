From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Patch V10 0/8] Tegra XUSB gadget driver support
Date: Mon, 14 Oct 2019 12:02:57 +0200
Message-ID: <20191014100257.GB419598@ulmo>
References: <1569227152-3030-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="v9Ux+11Zm5mwPlX6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1569227152-3030-1-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nagarjuna Kristam <nkristam@nvidia.com>, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--v9Ux+11Zm5mwPlX6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2019 at 01:55:44PM +0530, Nagarjuna Kristam wrote:
> Patches 1-3 are phy driver changes to add support for device
> mode.
> Patches 4-7 are changes related to XUSB device mode
> controller driver.
> Patch 8 is to enable drivers for XUDC support in defconfig
>=20
> Test Steps(USB 2.0):
> - Enable "USB Gadget precomposed configurations" in defconfig
> - Build, flash and boot Jetson TX1
> - Connect Jetson TX1 and Ubuntu device using USB A to Micro B
>   cable
> - After boot on Jetson TX1 terminal usb0 network device should be
>   enumerated
> - Assign static ip to usb0 on Jetson TX1 and corresponding net
>   device on ubuntu
> - Run ping test and transfer test(used scp) to check data transfer
>   communication

Hi Felipe, Kishon, Greg,

Patches 1-3 provide new API that is required by patch 7, so I think
patches 1, 2, 3, 4 and 7 should probably all go through a single tree to
avoid having to model the dependencies using stable branches.

Kishon, patches 1-3 have gone through several rounds of review already,
but do you have any remaining concerns on them? If not, it'd be great if
you could ack them. Felipe and Greg could then pick them up along with
patches 4 and 7 into the USB tree.

Felipe, Greg, does that sound like a reasonable plan?

I should also mention that while waiting for review, Nagarjuna has been
able to extend support for the XUDC driver to Tegra186 but has so far
been holding back on sending them out so as to not needlessly hold up
progress on this series. However, given the interdependencies, I've come
to think that it may be preferable to merge everything in one go instead
of revisiting this in a couple of weeks.

If you guys prefer, Nagarjuna could send out v11 of the series and
integrate Tegra186 support.

Thanks,
Thierry


> SS mode is verified by enabling Type A port as peripheral
> ---
> v10:
> * Patches 1,2,4,5,7,8 - No changes.
> * Patch 3 has braces added to one single line else condition.
> * Patch 6 has update on compatible string as per suggestion from Chunfeng.
> ---
> v9:
> * Patches 1,2,3,4,5 - No changes.
> * Patch 6 has update on compatible string as per suggestion from Chunfeng.
> * Patch 7 has comment fixes as suggested by Chunfeng.
> * Patch 8 has CONFIG_USB_GPIO enabled as module additionally.
> ---
> v8:
> * Patches 1,2,3,4,5,8 - No changes.
> * Patch 6 has update on compatible string as per change done in [1].
> * Patch 7 has issue fix, where device mode didnot got enabled after resume
>   from suspend.
> ---
> v7:
> * Patches 1,2,3,4,5,6,8 - No changes.
> * Patch 7 - Comments from Balbi and Chunfun adrresed.
>   Added COMPILE_TEST in Kconfig and updated dependencies.
> ---
> v6:
> * Patches 1,2,3,7,8 - No changes.
> * Patch 4,5,6 - Comments from Rob addressed, updated usb connector driver
>   compatibility string.
> ---
> v5:
> * Patches 1-3 - Commit subject updated as per inputs from Thierry.
> * Patch 4 - Added reg-names used on Tegra210 in the bindings doc
> * Enabled xudc driver as module instead of part of kernel in patch 8.
> * Patched 5-8 - No changes.
> ---
> v4:
> * patch 1 - no changes.
> * corrected companion device search based on inputs from Thierry in patch=
 2.
> * removed unneeded dev variable and corrected value read in
>   tegra210_utmi_port_reset function in patch 3.
> * dt binding doc and dtb files are corrected for alignments.
>   Replaced extcon-usb-gpio with usb role switch.
> * Added support for USB role switch instead of extcon-usb-gpio and other =
minor
>   comments as suggested by Chunfeng.
> * Enabled xudc driver as module instead of part of kernel in patch 8.
> ---
> V3:
> * Rebased patch 1 to top of tree.
> * Fixed bug in patch 2, where xudc interrupts dont get generated if USB h=
ost
>   mode fails to probe. Moved fake port detection logic to generic xusb.c.=
 fake
>   usb port data is updated based on soc flag need_fake_usb3_port.
> * Added extra lines whereever necessary to make code more readable in pat=
ch 3
>   and 7.
> * dt binding doc is corrected for typos and extcon references. Also added
>   details for clocks and removed xusb_ references to clock and power-doma=
in
>   names and accordingly patch 5 is updated.
> * removed avdd-pll-utmip-supply in patch 6, as its now part of padctl dri=
ver.
> * Patch 8 has no changes.
> ---
> V2:
> * Patches 1-3 are new patches in this series, which splits unified featur=
es
>   patch to speprated features and removes need of port-fake entry in DT.
> * Patch 4 is re-arragend dt-bindings patch which incorporates previous
>   patch comments to sort DT entries alphabetically, addresses name changes
>   and PM domain details added.
> * Patch 5-6 are re-arranged DT patches with major changes - sort entries
>   alphabetically, and adds clock names.
> * Patch 7 is UDC driver tegra XUSB device mode controller with major
>   changes - remove un-used module params, lockinng for device_mode flag,
>   moving un-needed info logs to debug level, making changes feature flag
>   dependent rather than SOC based macros and other error handling in prob=
e.
> * Patch 8 has no changes.
>=20
> Nagarjuna Kristam (8):
>   phy: tegra: xusb: Add XUSB dual mode support on Tegra210
>   phy: tegra: xusb: Add usb3 port fake support on Tegra210
>   phy: tegra: xusb: Add vbus override support on Tegra210
>   dt-bindings: usb: Add NVIDIA Tegra XUSB device mode controller binding
>   arm64: tegra: Add xudc node for Tegra210
>   arm64: tegra: Enable xudc on Jetson TX1
>   usb: gadget: Add UDC driver for tegra XUSB device mode controller
>   arm64: defconfig: Enable tegra XUDC support
>=20
>  .../devicetree/bindings/usb/nvidia,tegra-xudc.txt  |  110 +
>  arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |   31 +-
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   19 +
>  arch/arm64/configs/defconfig                       |    2 +
>  drivers/phy/tegra/xusb-tegra210.c                  |  134 +-
>  drivers/phy/tegra/xusb.c                           |   87 +
>  drivers/phy/tegra/xusb.h                           |    4 +
>  drivers/usb/gadget/udc/Kconfig                     |   11 +
>  drivers/usb/gadget/udc/Makefile                    |    1 +
>  drivers/usb/gadget/udc/tegra-xudc.c                | 3787 ++++++++++++++=
++++++
>  include/linux/phy/tegra/xusb.h                     |    4 +-
>  11 files changed, 4186 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xu=
dc.txt
>  create mode 100644 drivers/usb/gadget/udc/tegra-xudc.c
>=20
> --=20
> 2.7.4
>=20

--v9Ux+11Zm5mwPlX6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2kR88ACgkQ3SOs138+
s6HcqBAAi6UX8jUkVwpS+m7EFLB8/o3WWuKoXwy4KUgj8b/RxjJJY1McNFuBE+b7
1bZYWwORUA1v1fttqvXb6IbyMU5pyX9szaIlUw89B/p8hN0zXNdSsXi+d+Zq1mKo
13zp6K4cel9FgTJZFWCRgP8ZfOplg6u3nNwP5JmPo/y8I9/iG4b5y01dsUpUJu5Q
eniPgOflNqULclwdL0wcHRfVO2c3IyEE9U/qN+HDpxIY5/S1y9xDpwzjQikQSykN
cOl/p2q00+EG/0onZcBGhuzGy9S8I9mHLGQhksmvcZDOIGMGotcwaur5xFGAv4IB
7Ji548LYVfBT2P3vGkwnHJPm849jUHmoogEisHZZopqS3tQEUArIeTV//KQmKQdt
XVyYcyq0nzw5KdF0Su+FCmDZUIaXJf1NVy+hsjhk9CyXbTWlEabUV6B5blafpqNF
iAcBvToW8OndAMmLXkgkXpcct2QmgA9ic0JQbNtbxw5UQ7MwU5Tj30M+7f86q2K+
z5LyNeIf+X2xsztv+FgeNNNQbtfp0NlpBxRPQ5qFaykgjOzzg1FvljxQpfQ29UCu
4QvfBe2wIClKTwcO8o3wQ+JURKnt5YRXyzljYEkbPSu7MgnB86jsxHueGDm1j1AA
kf6rTlSilLLaPMuSFh2vjb3GR/rDEsZEkYmBDhDSIh2dce/DHEg=
=CTFt
-----END PGP SIGNATURE-----

--v9Ux+11Zm5mwPlX6--
