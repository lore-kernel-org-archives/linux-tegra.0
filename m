From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [GIT PULL V2 3/7] ARM: tegra: for-3.6/soc branch
Date: Fri,  6 Jul 2012 12:47:58 -0600
Message-ID: <1341600482-11020-4-git-send-email-swarren@wwwdotorg.org>
References: <1341600482-11020-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1341600482-11020-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This branch contains changes to Tegra SoC-specific code in the mach-tegra
directory; only APBIO/DMA-related patches this time around.

This branch is based on Tegra's for-3.6/cleanup branch from a previous pull
request.

This branch is not included in any later pull requests.

Note that there will be a merge conflict between for-3.6/{fixes,soc}. The
expected resolution may be found in branch for-3.6/merged-fixes-soc.

----------------------------------------------------------------

The following changes since commit 702b0e4f2f2782962aab7d9a0a40ad68770bb1f6:

  ARM: dt: tegra: rename board files to match SoC

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git for-3.6/soc

for you to fetch changes up to 5b39fc0bf17028a6b18e57d33f0dcf71f28a8223:

  ARM: tegra: apbio: use dmaengine based dma driver

----------------------------------------------------------------

Laxman Dewangan (2):
      ARM: tegra: apbio access using dma for tegra20 only
      ARM: tegra: apbio: use dmaengine based dma driver

 arch/arm/mach-tegra/Makefile |    3 +-
 arch/arm/mach-tegra/apbio.c  |  194 +++++++++++++++++++++++++++++++++++--
 arch/arm/mach-tegra/apbio.h  |   19 +----
 arch/arm/mach-tegra/common.c |    3 +
 4 files changed, 193 insertions(+), 26 deletions(-)
