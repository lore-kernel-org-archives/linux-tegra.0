From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [GIT PULL 01/10] ARM: tegra: dependency 1 from the DMA tree
Date: Mon, 16 Dec 2013 15:10:03 -0700
Message-ID: <1387231812-5701-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This branch introduces the dma_request_slave_channel_reason() API, and
is a dependency for Tegra's conversion to use the common/standard DMA
DT bindings.

Note that Vinod didn't create a signed tag for this branch, but has
certainly given his OK in email for me to pull this branch into the
Tegra tree. Mark has also pulled it into the ASoC tree.

Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

----------------------------------------------------------------

The following changes since commit 6ce4eac1f600b34f2f7f58f9cd8f0503d79e42ae:

  Linux 3.13-rc1

are available in the git repository at:

  git://git.infradead.org/users/vkoul/slave-dma.git topic/defer_probe

or:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-3.14/deps-from-dma-defer_probe

for you to fetch changes up to 0ad7c00057dc1640647c1dc81ccbd009de17a767:

  dma: add channel request API that supports deferred probe

----------------------------------------------------------------

Stephen Warren (1):
      dma: add channel request API that supports deferred probe

 drivers/dma/dmaengine.c   | 35 +++++++++++++++++++++++++++++++----
 drivers/dma/of-dma.c      | 15 +++++++++------
 include/linux/dmaengine.h |  8 ++++++++
 3 files changed, 48 insertions(+), 10 deletions(-)
