From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [GIT PULL 3/7] ARM: tegra: for-3.6/soc branch
Date: Fri,  6 Jul 2012 10:46:44 -0600
Message-ID: <1341593208-17914-3-git-send-email-swarren@wwwdotorg.org>
References: <1341593208-17914-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1341593208-17914-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This branch contains changes to Tegra SoC-specific code in the mach-tegra
directory; only 1 patch this time around.

This branch is based on Tegra's for-3.6/fixes branch from the previous pull
request.

This branch is not included in any later pull requests.

----------------------------------------------------------------

The following changes since commit 8994c34c194d5f59f014d3c3b90eb677672ddb03:

  ARM: tegra: apbio access using dma for tegra20 only

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git for-3.6/soc

for you to fetch changes up to b55a55ca96e5ab22893f01b450f8dbe4972e58e6:

  ARM: tegra: apbio: use dmaengine based dma driver

----------------------------------------------------------------

Laxman Dewangan (1):
      ARM: tegra: apbio: use dmaengine based dma driver

 arch/arm/mach-tegra/apbio.c |  139 ++++++++++++++++++++++++++++++++++++-
 1 files changed, 135 insertions(+), 4 deletions(-)
