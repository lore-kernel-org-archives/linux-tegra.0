From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 09/11] ARM: tegra: Core changes for v5.8-rc1
Date: Fri, 15 May 2020 16:53:09 +0200
Message-ID: <20200515145311.1580134-10-thierry.reding@gmail.com>
References: <20200515145311.1580134-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200515145311.1580134-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.8-arm-core

for you to fetch changes up to b9bf73aed99ed3170b37fbbf98557c70a6f19e50:

  ARM: tegra: Create tegra20-cpufreq platform device on Tegra30 (2020-05-06 19:01:17 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Core changes for v5.8-rc1

This contains core changes needed for the CPU frequency scaling and CPU
idle drivers on Tegra20 and Tegra30.

----------------------------------------------------------------
Dmitry Osipenko (7):
      firmware: tf: Different way of L2 cache enabling after LP2 suspend
      ARM: tegra: Initialize r0 register for firmware wake-up
      ARM: tegra: Do not fully reinitialize L2 on resume
      ARM: tegra: Correct PL310 Auxiliary Control Register initialization
      ARM: tegra: Switch CPU to PLLP on resume from LP1 on Tegra30/114/124
      ARM: tegra: Don't enable PLLX while resuming from LP1 on Tegra30
      ARM: tegra: Create tegra20-cpufreq platform device on Tegra30

Thierry Reding (2):
      firmware: tegra: Make BPMP a regular driver
      Merge branch 'for-5.8/firmware' into for-5.8/arm/core

 arch/arm/mach-tegra/pm.c                     |  4 ++++
 arch/arm/mach-tegra/reset-handler.S          |  7 ++++++-
 arch/arm/mach-tegra/sleep-tegra30.S          | 16 +++++++++-------
 arch/arm/mach-tegra/tegra.c                  |  8 ++++++--
 drivers/firmware/tegra/bpmp.c                |  9 +++------
 drivers/firmware/trusted_foundations.c       | 21 +++++++++++++++++++--
 include/linux/firmware/trusted_foundations.h |  1 +
 7 files changed, 48 insertions(+), 18 deletions(-)
