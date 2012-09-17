From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [GIT PULL] ARM: tegra: switch to dmaengine
Date: Mon, 17 Sep 2012 10:02:24 -0600
Message-ID: <1347897744-8009-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The Tegra code-base has contained both a legacy DMA and a dmaengine
driver since v3.6-rcX. This series flips Tegra's defconfig to enable
dmaengine rather than the legacy driver, and removes the legacy driver
and all client code.

The branch is based on v3.6-rc6 in order to pick up a bug-fix to the
ASoC Tegra PCM driver that's required for audio to work correctly when
using dmaengine.

----------------------------------------------------------------

The following changes since commit 5698bd757d55b1bb87edd1a9744ab09c142abfc2:

  Linux 3.6-rc6

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git tegra-for-3.7-dmaengine

for you to fetch changes up to 9891e3240543c45176b1298164418b61e8909ed0:

  ASoC: tegra: remove support of legacy DMA driver based access

----------------------------------------------------------------

Laxman Dewangan (5):
      ARM: tegra: config: enable dmaengine based APB DMA driver
      ARM: tegra: dma: remove legacy APB DMA driver
      ARM: tegra: apbio: remove support of legacy DMA driver based access
      spi: tegra: remove support of legacy DMA driver based access
      ASoC: tegra: remove support of legacy DMA driver based access

 arch/arm/configs/tegra_defconfig       |    2 +
 arch/arm/mach-tegra/Kconfig            |    7 -
 arch/arm/mach-tegra/Makefile           |    1 -
 arch/arm/mach-tegra/apbio.c            |  118 +----
 arch/arm/mach-tegra/dma.c              |  823 ---------------------------
 arch/arm/mach-tegra/include/mach/dma.h |   97 ----
 drivers/spi/Kconfig                    |    2 +-
 drivers/spi/spi-tegra.c                |   55 +--
 sound/soc/tegra/Kconfig                |    2 +-
 sound/soc/tegra/tegra_pcm.c            |  232 --------
 sound/soc/tegra/tegra_pcm.h            |   14 -
 11 files changed, 6 insertions(+), 1347 deletions(-)
 delete mode 100644 arch/arm/mach-tegra/dma.c
