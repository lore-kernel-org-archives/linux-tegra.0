From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 0/7] Add cros_ec changes for newer boards
Date: Wed, 23 Apr 2014 13:32:40 +0100
Message-ID: <20140423123240.GA640@lee--X1>
References: <1398185154-19404-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1398185154-19404-1-git-send-email-dianders@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: swarren@nvidia.com, wsa@the-dreams.de, abrestic@chromium.org, dgreid@chromium.org, olof@lixom.net, sjg@chromium.org, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, mark.rutland@arm.com, andrew@lunn.ch, swarren@wwwdotorg.org, thierry.reding@gmail.com, linux-i2c@vger.kernel.org, matt.porter@linaro.org, jdelvare@suse.de, laurent.pinchart+renesas@ideasonboard.com, vpalatin@chromium.org, sameo@linux.intel.com, linux-doc@vger.kernel.org, bjorn.andersson@sonymobile.com, u.kleine-koenig@pengutronix.de, kevin.strasser@linux.intel.com, devicetree@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, linux@arm.linux.org.uk, andriy.shevchenko@linux.intel.com, ch.naveen@samsung.com, linux-arm-kernel@lists.infradead.org, shane.huang@amd.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org, linux@prisktech.co.nz, galak@codeaurora
List-Id: linux-tegra@vger.kernel.org

On Tue, 22 Apr 2014, Doug Anderson wrote:

> This series adds the most critical cros_ec changes for newer boards
> using cros_ec.  Specifically:
> * Fixes timing/locking issues with the previously upstreamed (but
>   never used upstream) cros_ec_spi driver.
> * Updates the cros_ec header file to the latest version which allows
>   us to use newer EC features like i2c tunneling.
> * Adds an i2c tunnel driver to allow communication to the EC's i2c
>   devices.
>=20
> This _doesn't_ get the EC driver fully up to speed with what's in the
> current Chromium OS trees.  There are a whole slew of cleanup patches
> there, an addition of an LPC transport mode, and exports of functions
> to userspace.  Once these patches land and we have functionality we
> can continue to pick more cleanup patches.
>=20
> Changes in v2:
> - Update tunnel binding as per swarren
> - Removed i2c20 alias for i2c tunnel
>=20
> Bill Richardson (1):
>   mfd: cros_ec: Sync to the latest cros_ec_commands.h from EC sources
>=20
> David Hendricks (1):
>   mfd: cros_ec: spi: calculate delay between transfers correctly
>=20
> Doug Anderson (5):
>   mfd: cros_ec: spi: Add mutex to cros_ec_spi
>   mfd: cros_ec: spi: Make the cros_ec_spi timeout more reliable
>   mfd: cros_ec: spi: Increase cros_ec_spi deadline from 5ms to 100ms
>   i2c: ChromeOS EC tunnel driver
>   ARM: tegra: Add the EC i2c tunnel to tegra124-venice2
>=20
>  .../devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt |   39 +
>  arch/arm/boot/dts/tegra124-venice2.dts             |   26 +
>  drivers/i2c/busses/Kconfig                         |    9 +
>  drivers/i2c/busses/Makefile                        |    1 +
>  drivers/i2c/busses/i2c-cros-ec-tunnel.c            |  304 ++++++
>  drivers/mfd/cros_ec.c                              |    7 +-
>  drivers/mfd/cros_ec_spi.c                          |   67 +-
>  include/linux/mfd/cros_ec.h                        |    4 +-
>  include/linux/mfd/cros_ec_commands.h               | 1128 ++++++++++=
++++++++--
>  9 files changed, 1493 insertions(+), 92 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-cros-ec=
-tunnel.txt
>  create mode 100644 drivers/i2c/busses/i2c-cros-ec-tunnel.c

Need to wait for the ARM, DT and I2C guys to review, at which point
I'll be happy to take in and supply a branch for them to pull from if
required. If there are no _true_ dependencies and the MFD changes can
be added independently without fear of build breakages, let me know
and I'll apply them separately.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
