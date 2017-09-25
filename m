From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 0/2] NVIDIA Tegra20 video decoder driver
Date: Tue, 26 Sep 2017 01:15:41 +0300
Message-ID: <cover.1506377430.git.digetx@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This driver provides accelerated video decoding to NVIDIA Tegra20 SoC's,
it is a result of reverse-engineering efforts. Driver has been tested on
Toshiba AC100 and Acer A500, it should work on any Tegra20 device.

In userspace this driver is utilized by libvdpau-tegra [0] that implements
VDPAU interface, so any video player that supports VDPAU can provide
accelerated video decoding on Tegra20 on Linux.

[0] https://github.com/grate-driver/libvdpau-tegra

Dmitry Osipenko (2):
  staging: Introduce NVIDIA Tegra20 video decoder driver
  ARM: dts: tegra20: Add video decoder node

 .../bindings/arm/tegra/nvidia,tegra20-vde.txt      |  38 +
 arch/arm/boot/dts/tegra20.dtsi                     |  16 +
 drivers/staging/Kconfig                            |   2 +
 drivers/staging/Makefile                           |   1 +
 drivers/staging/tegra-vde/Kconfig                  |   6 +
 drivers/staging/tegra-vde/Makefile                 |   1 +
 drivers/staging/tegra-vde/TODO                     |   8 +
 drivers/staging/tegra-vde/uapi.h                   |  99 +++
 drivers/staging/tegra-vde/vde.c                    | 971 +++++++++++++++++++++
 9 files changed, 1142 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-vde.txt
 create mode 100644 drivers/staging/tegra-vde/Kconfig
 create mode 100644 drivers/staging/tegra-vde/Makefile
 create mode 100644 drivers/staging/tegra-vde/TODO
 create mode 100644 drivers/staging/tegra-vde/uapi.h
 create mode 100644 drivers/staging/tegra-vde/vde.c

-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
