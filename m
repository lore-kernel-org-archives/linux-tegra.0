From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 0/7] DMA: Add support for Tegra210 ADMA
Date: Tue, 18 Aug 2015 14:49:08 +0100
Message-ID: <1439905755-25150-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add support for Tegra210 Audio DMA (ADMA) controller. This driver is based
upon the existing Tegra20-APB DMA driver and a lot of the core code has
been re-used.

This is currently being distributed as an RFC to get feedback on the
approach and although this has been compile and boot tested, it still
needs further functional testing to ensure it is working well.

This series is based upon the Tegra-APB clean-up series [0].

[0] https://lkml.org/lkml/2015/8/6/315

Jon Hunter (7):
  DMA: tegra-apb: Correct runtime-pm usage
  DMA: tegra-apb: Move code dealing with h/w registers into separate
    functions
  DMA: tegra-apb: Clean-up and simplify setting up of transfer
    parameters
  DMA: tegra-apb: Add a function table for functions dealing with
    registers
  DMA: tegra-apb: Move common code into separate source files
  Documentation: DT: Add binding documentation for NVIDIA ADMA
  DMA: tegra-adma: Add support for Tegra210 ADMA

 .../devicetree/bindings/dma/tegra210-adma.txt      |   49 +
 drivers/dma/Kconfig                                |   16 +
 drivers/dma/Makefile                               |    2 +
 drivers/dma/tegra-common.c                         |  734 +++++++++++++
 drivers/dma/tegra-common.h                         |  260 +++++
 drivers/dma/tegra20-apb-dma.c                      | 1121 +++-----------------
 drivers/dma/tegra210-adma.c                        |  710 +++++++++++++
 7 files changed, 1928 insertions(+), 964 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/tegra210-adma.txt
 create mode 100644 drivers/dma/tegra-common.c
 create mode 100644 drivers/dma/tegra-common.h
 create mode 100644 drivers/dma/tegra210-adma.c

-- 
2.1.4
