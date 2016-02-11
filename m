From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/8] soc: tegra: pmc: Various fixes
Date: Thu, 11 Feb 2016 18:03:18 +0000
Message-ID: <1455213806-21871-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This series contains a few fixes on the Tegra PMC driver. Some of these
patches were original included as part of the series to add generic PM
domain support for Tegra [0]. However, to keep these patch series a
manageable size, I have separate them in to this series and I have added
a couple more fixes as well.

[0] http://marc.info/?l=linux-tegra&m=145399885003830&w=2

Jon Hunter (8):
  soc: tegra: pmc: Remove non-existing L2 partition for Tegra124
  soc: tegra: pmc: Restore base address on probe failure
  soc: tegra: pmc: Protect public functions from potential race
    conditions
  soc: tegra: pmc: Change powergate and rail IDs to be an unsigned type
  soc: tegra: pmc: Fix testing of powergate state
  soc: tegra: pmc: Fix verification of valid partitions
  soc: tegra: pmc: Remove additional check for a valid partition
  soc: tegra: pmc: Ensure GPU partition can be toggled on/off by PMC

 drivers/gpu/drm/tegra/drm.h |   2 +-
 drivers/soc/tegra/pmc.c     | 131 +++++++++++++++++++++++++++++---------------
 include/soc/tegra/pmc.h     |  35 ++++++------
 3 files changed, 105 insertions(+), 63 deletions(-)

-- 
2.1.4
