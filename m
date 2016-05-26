From: Thierry Reding <thierry.reding@gmail.com>
Subject: [RFC 0/5] usb: chipidea: Add support for Tegra20 through Tegra124
Date: Thu, 26 May 2016 17:40:00 +0200
Message-ID: <20160526154005.11558-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Chen <Peter.Chen@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

All Tegra SoC generations from Tegra20 through Tegra124 have a ChipIdea
USB device controller. This set of patches adds very rudimentary support
for it to the existing ChipIdea driver and enables them on the set of
boards that I could easily test on.

I'm sending this out as RFC because I'm not sure yet how to merge this.
While the driver seems to work fine (tested by exporting a USB driver or
eMMC via the mass storage function) I don't yet understand how to make
the driver switch between host and device modes dynamically. It might be
useful to get this merged before, but I'd like to have some feedback on
this, because doing so would mean that we need to use device mode on the
devices where it's enabled and can't use the USBD port in host mode.

Thierry

Thierry Reding (5):
  usb: chipidea: Add support for Tegra20/30/114/124
  ARM: tegra: Enable UDC on TrimSlice
  ARM: tegra: Enable UDC on Beaver
  ARM: tegra: Enable UDC on Dalmore
  ARM: tegra: Enable UDC on Jetson TK1

 arch/arm/boot/dts/tegra114-dalmore.dts    |  11 +++
 arch/arm/boot/dts/tegra124-jetson-tk1.dts |  13 +++-
 arch/arm/boot/dts/tegra20-trimslice.dts   |   3 +
 arch/arm/boot/dts/tegra30-beaver.dts      |  11 +++
 drivers/usb/chipidea/Makefile             |   1 +
 drivers/usb/chipidea/ci_hdrc_tegra.c      | 109 ++++++++++++++++++++++++++++++
 6 files changed, 147 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/chipidea/ci_hdrc_tegra.c

-- 
2.8.3
