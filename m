From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 4/6] soc/tegra: Changes for v4.8-rc1
Date: Fri,  1 Jul 2016 16:50:24 +0200
Message-ID: <20160701145026.25760-4-thierry.reding@gmail.com>
References: <20160701145026.25760-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160701145026.25760-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.8-soc

for you to fetch changes up to 8582f6d158c8824042432f581d49ef478d5cb238:

  soc/tegra: Stub out PCIe IRQ workaround on 64-bit ARM (2016-06-30 13:54:17 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v4.8-rc1

Contains fixes and cleanups to the PMC driver, as well as some fixes for
the generic PM domain support and some prep work to support PCIe on 64-
bit ARM.

----------------------------------------------------------------
Jon Hunter (10):
      soc/tegra: pmc: Initialise resets associated with a power partition
      soc/tegra: pmc: Ensure powergate is available when powering on
      soc/tegra: pmc: Fix early initialisation of PMC
      soc/tegra: pmc: Don't populate SoC data until register space is mapped
      soc/tegra: pmc: Ensure mutex is always initialised
      soc/tegra: pmc: Add missing of_node_put()
      soc/tegra: pmc: Don't probe PMC if early initialisation fails
      soc/tegra: pmc: Add specific error messages
      soc/tegra: pmc: Initialise power partitions early
      soc/tegra: pmc: Enable XUSB partitions on boot

Thierry Reding (3):
      soc/tegra: pmc: Use register definitions instead of magic values
      soc/tegra: pmc: Use whitespace more consistently
      soc/tegra: Stub out PCIe IRQ workaround on 64-bit ARM

 drivers/soc/tegra/pmc.c     | 149 +++++++++++++++++++++++++++++++++-----------
 include/soc/tegra/cpuidle.h |   2 +-
 2 files changed, 113 insertions(+), 38 deletions(-)
