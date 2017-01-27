From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 1/4] memory: tegra: Changes for v4.11-rc1
Date: Fri, 27 Jan 2017 10:21:18 +0100
Message-ID: <20170127092121.21570-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 0c744ea4f77d72b3dcebb7a8f2684633ec79be88:

  Linux 4.10-rc2 (2017-01-01 14:31:53 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.11-memory

for you to fetch changes up to b92f4380a1c7eb3ed19d6f68ad7b66c66d8102b4:

  memory: tegra: Add a missing 'of_node_put()' call (2017-01-25 07:57:13 +0100)

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Changes for v4.11-rc1

This contains a single commit that plugs a potential device node leak in
error handling code.

----------------------------------------------------------------
Christophe Jaillet (1):
      memory: tegra: Add a missing 'of_node_put()' call

 drivers/memory/tegra/tegra124-emc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
