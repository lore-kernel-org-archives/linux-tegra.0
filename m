From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/5] Tegra PMC Updates
Date: Sat, 22 Oct 2016 20:23:51 +0100
Message-ID: <1477164236-29351-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Some updates and clean-ups for the Tegra PMC driver.

Jon Hunter (5):
  soc/tegra: pmc: Guard against uninitialised PMC clock
  soc/tegra: pmc: Simplify IO rail bit handling
  soc/tegra: Clean-up PMC rail IO error messages
  soc/tegra: pmc: Check return code for pm_genpd_init()
  soc/tegra: pmc: Remove genpd when adding provider fails

 drivers/soc/tegra/pmc.c | 56 +++++++++++++++++++++++++++++++------------------
 1 file changed, 36 insertions(+), 20 deletions(-)

-- 
1.9.1
