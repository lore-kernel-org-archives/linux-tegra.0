From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 2/4] soc/tegra: Changes for v4.9-rc1
Date: Fri,  9 Sep 2016 17:20:30 +0200
Message-ID: <20160909152032.9550-2-thierry.reding@gmail.com>
References: <20160909152032.9550-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160909152032.9550-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.9-soc

for you to fetch changes up to a9ccc123a8e05365f7515dcd023b01100809a6fa:

  soc/tegra: pmc: Fix incorrect DPD request (2016-08-16 12:30:52 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v4.9-rc1

This contains a single patch to fix an issue with setting the deep power
down mode of I/O rails.

----------------------------------------------------------------
Vince Hsu (1):
      soc/tegra: pmc: Fix incorrect DPD request

 drivers/soc/tegra/pmc.c | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)
