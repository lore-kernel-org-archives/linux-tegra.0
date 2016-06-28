From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/6] soc/tegra: Various PMC fixes
Date: Tue, 28 Jun 2016 11:38:22 +0100
Message-ID: <1467110308-22126-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

A few fixes for the Tegra PMC driver.

Jon Hunter (6):
  soc/tegra: pmc: Ensure powergate is available when powering on
  soc/tegra: pmc: Fix early initialisation of PMC
  soc/tegra: pmc: Don't populate soc data until register space is mapped
  soc/tegra: pmc: Ensure mutex is always initialised
  soc/tegra: pmc: Add missing of_node_put
  soc/tegra: pmc: Don't probe pmc if early initialisation fails

 drivers/soc/tegra/pmc.c | 51 ++++++++++++++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 18 deletions(-)

-- 
2.1.4
