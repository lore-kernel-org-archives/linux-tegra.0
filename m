From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/8]  Various dmaengine cleanups
Date: Tue,  7 Jun 2016 18:38:33 +0100
Message-ID: <1465321121-22238-1-git-send-email-peter.griffin@linaro.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org, zw-aYo+Mbtxn2uXDw4h08c5KA@public.gmane.org, baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Vinod,

This series is a bunch of cleanup updates to various
dmaengine drivers, based on some of the review feeback to my fdma series.

regards,

Peter.

Peter Griffin (8):
  dmaengine: fsl-edma: Fix clock handling error paths
  dmaengine: fsl-edma: print error code in error messages.
  dmaengine: coh901318: Only calculate residue if txstate exists.
  dmaengine: s3c24xx: Simplify code in s3c24xx_dma_tx_status()
  dmaengine: ste_dma40: Only calculate residue if txstate exists.
  dmaengine: sun6i-dma: Only calculate residue if state exists.
  dmaengine: tegra20-apb-dma: Only calculate residue if txstate exists.
  dmaengine: Remove site specific OOM error messages on kzalloc

 drivers/dma/amba-pl08x.c        | 10 +---------
 drivers/dma/bestcomm/bestcomm.c |  2 --
 drivers/dma/coh901318.c         |  2 +-
 drivers/dma/edma.c              | 16 ++++------------
 drivers/dma/fsl-edma.c          | 25 +++++++++++++++++++------
 drivers/dma/fsldma.c            |  2 --
 drivers/dma/k3dma.c             | 10 ++++------
 drivers/dma/mmp_tdma.c          |  5 ++---
 drivers/dma/moxart-dma.c        |  4 +---
 drivers/dma/nbpfaxi.c           |  5 ++---
 drivers/dma/pl330.c             |  5 +----
 drivers/dma/ppc4xx/adma.c       |  2 --
 drivers/dma/s3c24xx-dma.c       | 11 ++---------
 drivers/dma/sh/shdmac.c         |  9 ++-------
 drivers/dma/sh/sudmac.c         |  9 ++-------
 drivers/dma/sirf-dma.c          |  5 ++---
 drivers/dma/ste_dma40.c         |  6 ++----
 drivers/dma/sun6i-dma.c         |  2 +-
 drivers/dma/tegra20-apb-dma.c   | 13 ++++---------
 drivers/dma/timb_dma.c          |  8 ++------
 20 files changed, 52 insertions(+), 99 deletions(-)

-- 
1.9.1
