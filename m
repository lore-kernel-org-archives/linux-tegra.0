From: Rajesh Gumasta <rgumasta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [Patch v1 0/4] Add Nvidia Tegra GPC-DMA driver
Date: Mon, 20 Jul 2020 12:04:12 +0530
Message-ID: <1595226856-19241-1-git-send-email-rgumasta@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kyarlagadda-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rgumasta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add support for Nvida Tegra general purpose DMA driver for
Tegra186 and Tegra194 platform.

Patch 1: Add dt-binding document for Tegra GPCDMA driver
Patch 2: Add Tegra GPCDMA driver
Patch 3: Enable Tegra GPCDMA as module
Patch 4: Add GPCDMA DT node for Tegra186 and Tegra194

Rajesh Gumasta (4):
  dt-bindings: dma: Add DT binding document
  dma: tegra: Adding Tegra GPC DMA controller driver
  arm64: configs: enable tegra gpc dma
  arm64: tegra: Add GPCDMA node in dt

 .../bindings/dma/nvidia,tegra-gpc-dma.yaml         |   99 ++
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     |    4 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   46 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |   44 +
 arch/arm64/configs/defconfig                       |    1 +
 drivers/dma/Kconfig                                |   12 +
 drivers/dma/Makefile                               |    1 +
 drivers/dma/tegra-gpc-dma.c                        | 1512 ++++++++++++++++++++
 8 files changed, 1719 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nvidia,tegra-gpc-dma.yaml
 create mode 100644 drivers/dma/tegra-gpc-dma.c

-- 
2.7.4
