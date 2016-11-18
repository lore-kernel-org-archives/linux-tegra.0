From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 5/10] soc: tegra: Core SoC changes for v4.10-rc1
Date: Fri, 18 Nov 2016 17:17:14 +0100
Message-ID: <20161118161719.24153-5-thierry.reding@gmail.com>
References: <20161118161719.24153-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161118161719.24153-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.10-soc

for you to fetch changes up to 4522112069a976908e32e5dd3231c9272d19794a:

  soc/tegra: pmc: Use consistent naming for PM domains (2016-11-15 15:51:56 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc: tegra: Core SoC changes for v4.10-rc1

This contains mostly cleanup and new feature work on the power
management controller as well as the addition of a Kconfig symbol for
the new Tegra186 (Parker) SoC generation.

----------------------------------------------------------------
Jon Hunter (4):
      soc/tegra: pmc: Guard against uninitialised PMC clock
      soc/tegra: pmc: Simplify IO rail bit handling
      soc/tegra: pmc: Check return code for pm_genpd_init()
      soc/tegra: pmc: Remove genpd when adding provider fails

Joseph Lo (1):
      soc/tegra: Add Tegra186 support

Laxman Dewangan (3):
      soc/tegra: pmc: Use BIT macro for register field definition
      soc/tegra: pmc: Correct type of variable for tegra_pmc_readl()
      soc/tegra: pmc: Add I/O pad voltage support

Thierry Reding (3):
      soc/tegra: pmc: Use consistent ordering of bit definitions
      soc/tegra: pmc: Clean-up I/O rail error messages
      soc/tegra: pmc: Use consistent naming for PM domains

 drivers/soc/tegra/Kconfig |  14 ++
 drivers/soc/tegra/pmc.c   | 398 +++++++++++++++++++++++++++++++++++-----------
 include/soc/tegra/pmc.h   | 126 +++++++++++----
 3 files changed, 414 insertions(+), 124 deletions(-)
