From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V3 0/2] Add support for Tegra210 ADMA
Date: Fri, 16 Oct 2015 08:35:17 +0100
Message-ID: <1444980919-20331-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add support for the Tegra210 Audio DMA (ADMA) controller. This was
originally distributed as an RFC [0] based upon the existing tegra
APB-DMA driver. Since then the driver has been significantly
re-worked to remove a lot of the unused/unnecessary functionality
that was carried over from the APB-DMA. This version is no longer
derived from the APB-DMA driver and has been updated to use the
virt-dma helpers.

V3 changes:
- Updated DT binding per feedback from Mark and Stephen
- Fixed up items mentioned by Vinod

V2 changes:
- Re-worked device-tree binding

[0] https://lkml.org/lkml/2015/8/18/237

Jon Hunter (2):
  Documentation: DT: Add binding documentation for NVIDIA ADMA
  dmaengine: tegra-adma: Add support for Tegra210 ADMA

 .../devicetree/bindings/dma/tegra210-adma.txt      |  50 ++
 drivers/dma/Kconfig                                |  13 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/tegra210-adma.c                        | 909 +++++++++++++++++++++
 4 files changed, 973 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/tegra210-adma.txt
 create mode 100644 drivers/dma/tegra210-adma.c

-- 
2.1.4
