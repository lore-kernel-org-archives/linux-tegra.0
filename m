From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 3/8] ARM: tegra: RAM code access for v4.2-rc1
Date: Wed, 13 May 2015 15:49:35 +0200
Message-ID: <1431524980-13599-4-git-send-email-thierry.reding@gmail.com>
References: <1431524980-13599-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431524980-13599-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers, Mike, Stephen,

The following changes since commit b787f68c36d49bb1d9236f403813641efa74a031:

  Linux 4.1-rc1 (2015-04-26 17:59:10 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.2-ramcode

for you to fetch changes up to 6ea2609ab386f6bfeebc39e1418b7497a9deb55c:

  soc/tegra: fuse: Add RAM code reader helper (2015-05-04 14:21:21 +0200)

Note that this is a shared dependency for the tegra-for-4.2-clk and the
tegra-for-4.2-emc pull requests and they are already based on this, so
it's sufficient if you pull those in individually.

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: RAM code access for v4.2-rc1

The RAM code is used by the memory and external memory controllers to
determine which set of timings to use for memory frequency scaling.

----------------------------------------------------------------
Mikko Perttunen (1):
      soc/tegra: fuse: Add RAM code reader helper

Tomeu Vizoso (1):
      of: Document long-ram-code property in nvidia,tegra20-apbmisc

 .../bindings/misc/nvidia,tegra20-apbmisc.txt        |  2 ++
 drivers/soc/tegra/fuse/tegra-apbmisc.c              | 21 +++++++++++++++++++++
 include/soc/tegra/fuse.h                            |  1 +
 3 files changed, 24 insertions(+)
