From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 5/9] ARM: tegra: CPU frequency scaling for v4.3-rc1
Date: Fri, 14 Aug 2015 16:48:36 +0200
Message-ID: <1439563720-13189-6-git-send-email-thierry.reding@gmail.com>
References: <1439563720-13189-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439563720-13189-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:

  Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.3-cpufreq

for you to fetch changes up to 9eb15dbbfa1a23b5e65efaf1d5d6c47798e7264b:

  cpufreq: Add cpufreq driver for Tegra124 (2015-07-16 09:34:09 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: CPU frequency scaling for v4.3-rc1

This adds CPU frequency scaling support for Tegra124.

----------------------------------------------------------------
Tuomas Tynkkynen (3):
      cpufreq: tegra124: Add device tree bindings
      cpufreq: tegra: Rename tegra-cpufreq to tegra20-cpufreq
      cpufreq: Add cpufreq driver for Tegra124

 .../bindings/cpufreq/tegra124-cpufreq.txt          |  44 +++++
 drivers/cpufreq/Kconfig.arm                        |  13 +-
 drivers/cpufreq/Makefile                           |   3 +-
 drivers/cpufreq/tegra124-cpufreq.c                 | 214 +++++++++++++++++++++
 .../cpufreq/{tegra-cpufreq.c => tegra20-cpufreq.c} |   0
 5 files changed, 270 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/cpufreq/tegra124-cpufreq.txt
 create mode 100644 drivers/cpufreq/tegra124-cpufreq.c
 rename drivers/cpufreq/{tegra-cpufreq.c => tegra20-cpufreq.c} (100%)
