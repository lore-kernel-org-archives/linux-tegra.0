From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/3] NVIDIA Tegra AHB DMA controller driver
Date: Wed,  4 Oct 2017 02:58:00 +0300
Message-ID: <cover.1507073384.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

NVIDIA Tegra20/30 SoC's have AHB DMA controller. It has 4 DMA channels,
supports AHB <-> Memory and Memory <-> Memory transfers, slave / master
modes. This driver is primarily supposed to be used by gpu/host1x in a
master mode, performing 3D HW context stores.

Change log:

v2:
	- Addressed v1 review comments
	- Added DT header that defines REQ_SEL / TRIG_SEL values

Dmitry Osipenko (3):
  dt-bindings: Add DT binding for NVIDIA Tegra AHB DMA controller
  dmaengine: Add driver for NVIDIA Tegra AHB DMA controller
  ARM: dts: tegra: Add AHB DMA controller nodes

 .../bindings/dma/nvidia,tegra20-ahbdma.txt         |  23 +
 arch/arm/boot/dts/tegra20.dtsi                     |   9 +
 arch/arm/boot/dts/tegra30.dtsi                     |   9 +
 drivers/dma/Kconfig                                |  10 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/tegra20-ahb-dma.c                      | 630 +++++++++++++++++++++
 include/dt-bindings/dma/tegra-ahb-dma.h            |  56 ++
 7 files changed, 738 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt
 create mode 100644 drivers/dma/tegra20-ahb-dma.c
 create mode 100644 include/dt-bindings/dma/tegra-ahb-dma.h

-- 
2.14.1
