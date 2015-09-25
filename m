From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/3] Add support for Tegra210 ADMA
Date: Fri, 25 Sep 2015 15:56:37 +0100
Message-ID: <1443193000-457-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add support for the Tegra210 Audio DMA (ADMA) controller. This was
originally distributed as an RFC [0] based upon the existing tegra
APB-DMA driver. Since then the driver has been significantly
re-worked to remove a lot of the unused/unnecessary functionality
that was carried over from the APB-DMA. This version is no longer
derived from the APB-DMA driver and has been updated to use the
virt-dma helpers.

[0] https://lkml.org/lkml/2015/8/18/237

Jon Hunter (3):
  dmaengine: of: Allow #dma-cells to be zero
  Documentation: DT: Add binding documentation for NVIDIA ADMA
  dmaengine: tegra-adma: Add support for Tegra210 ADMA

 Documentation/devicetree/bindings/dma/dma.txt      |  12 +-
 .../devicetree/bindings/dma/tegra210-adma.txt      |  47 ++
 drivers/dma/Kconfig                                |  13 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/of-dma.c                               |  23 +-
 drivers/dma/tegra210-adma.c                        | 820 +++++++++++++++++++++
 6 files changed, 904 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/tegra210-adma.txt
 create mode 100644 drivers/dma/tegra210-adma.c

-- 
2.1.4
