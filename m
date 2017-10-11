From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 0/2] NVIDIA Tegra20 video decoder driver
Date: Wed, 11 Oct 2017 23:08:10 +0300
Message-ID: <cover.1507752381.git.digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Stephen Warren <swarren@wwwdotorg.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This driver provides accelerated video decoding to NVIDIA Tegra20 SoC's,
it is a result of reverse-engineering efforts. Driver has been tested on
Toshiba AC100 and Acer A500, it should work on any Tegra20 device.

In userspace this driver is utilized by libvdpau-tegra [0] that implements
VDPAU interface, so any video player that supports VDPAU can provide
accelerated video decoding on Tegra20 on Linux.

[0] https://github.com/grate-driver/libvdpau-tegra

Change log:
v3:
	- Suppressed compilation warnings reported by 'kbuild test robot'

v2:
	- Addressed v1 review comments from Stephen Warren and Dan Carpenter
	- Implemented runtime PM
	- Miscellaneous code cleanups
	- Changed 'TODO'
	- CC'd media maintainers for the review as per Greg K-H request,
	  v1 can be viewed at https://lkml.org/lkml/2017/9/25/606

Dmitry Osipenko (2):
  staging: Introduce NVIDIA Tegra20 video decoder driver
  ARM: dts: tegra20: Add video decoder node

 .../bindings/arm/tegra/nvidia,tegra20-vde.txt      |   44 +
 arch/arm/boot/dts/tegra20.dtsi                     |   17 +
 drivers/staging/Kconfig                            |    2 +
 drivers/staging/Makefile                           |    1 +
 drivers/staging/tegra-vde/Kconfig                  |    6 +
 drivers/staging/tegra-vde/Makefile                 |    1 +
 drivers/staging/tegra-vde/TODO                     |    5 +
 drivers/staging/tegra-vde/uapi.h                   |  101 ++
 drivers/staging/tegra-vde/vde.c                    | 1109 ++++++++++++++++++++
 9 files changed, 1286 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-vde.txt
 create mode 100644 drivers/staging/tegra-vde/Kconfig
 create mode 100644 drivers/staging/tegra-vde/Makefile
 create mode 100644 drivers/staging/tegra-vde/TODO
 create mode 100644 drivers/staging/tegra-vde/uapi.h
 create mode 100644 drivers/staging/tegra-vde/vde.c

-- 
2.14.2
