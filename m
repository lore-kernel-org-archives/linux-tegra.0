From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V4 0/3] Add support for Tegra210 ADMA
Date: Tue, 15 Mar 2016 15:56:27 +0000
Message-ID: <1458057390-20756-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add support for the Tegra210 Audio DMA (ADMA) controller which is part
of the Audio Processing Engine and used for transferring audio data.

V4 changes:
- Updated DT binding to include 'power-domains' entry for handling
  the APE power domain inconjunction with runtime-pm.
- Added missing clocks to the DT binding that were being handled by
  the bootloader.
- Added support for PM_CLK to simplify clock handling

V3 changes:
- Updated DT binding per feedback from Mark and Stephen
- Fixed up items mentioned by Vinod

V2 changes:
- Re-worked device-tree binding

Jon Hunter (3):
  Documentation: DT: Add binding documentation for NVIDIA ADMA
  dmaengine: tegra-adma: Add support for Tegra210 ADMA
  MAINTAINERS: Update Tegra DMA maintainers

 .../devicetree/bindings/dma/tegra210-adma.txt      |  61 ++
 MAINTAINERS                                        |   5 +-
 drivers/dma/Kconfig                                |  14 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/tegra210-adma.c                        | 869 +++++++++++++++++++++
 5 files changed, 948 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/tegra210-adma.txt
 create mode 100644 drivers/dma/tegra210-adma.c

-- 
2.1.4
