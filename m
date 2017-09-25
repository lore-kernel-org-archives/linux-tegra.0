From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 0/5] NVIDIA Tegra AHB DMA controller driver
Date: Tue, 26 Sep 2017 02:22:01 +0300
Message-ID: <cover.1506380746.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

NVIDIA Tegra20/30 SoC's have AHB DMA controller. It has 4 DMA channels,
supports AHB <-> Memory and Memory <-> Memory transfers, slave / master
modes. This driver is primarily supposed to be used by gpu/host1x in a
master mode, performing 3D HW context stores.

Dmitry Osipenko (5):
  clk: tegra: Add AHB DMA clock entry
  clk: tegra: Bump SCLK clock rate to 216MHz on Tegra20
  dt-bindings: Add DT bindings for NVIDIA Tegra AHB DMA controller
  dmaengine: Add driver for NVIDIA Tegra AHB DMA controller
  ARM: dts: tegra: Add AHB DMA controller nodes

 .../bindings/dma/nvidia,tegra20-ahbdma.txt         |  23 +
 arch/arm/boot/dts/tegra20.dtsi                     |   9 +
 arch/arm/boot/dts/tegra30.dtsi                     |   9 +
 drivers/clk/tegra/clk-id.h                         |   1 +
 drivers/clk/tegra/clk-tegra-periph.c               |   1 +
 drivers/clk/tegra/clk-tegra20.c                    |   8 +-
 drivers/clk/tegra/clk-tegra30.c                    |   2 +
 drivers/dma/Kconfig                                |   9 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/tegra20-ahb-dma.c                      | 679 +++++++++++++++++++++
 10 files changed, 741 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt
 create mode 100644 drivers/dma/tegra20-ahb-dma.c

-- 
2.14.1
