From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 08/11] soc/tegra: Changes for v5.8-rc1
Date: Fri, 15 May 2020 16:53:08 +0200
Message-ID: <20200515145311.1580134-9-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.8-soc

for you to fetch changes up to e4cc4f54be01b91b3e1b55430709d2a113f4e08f:

  soc: tegra: Fix tegra_pmc_get_suspend_mode definition (2020-05-07 22:03:10 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v5.8-rc1

Enables Tegra186 and Tegra194 to be woken from suspend by the PMIC and
exports a bit more information about SoCs via sysfs.

----------------------------------------------------------------
Arnd Bergmann (1):
      soc: tegra: Fix tegra_pmc_get_suspend_mode definition

Corentin Labbe (1):
      soc/tegra: pmc: Select GENERIC_PINCONF

Jon Hunter (4):
      soc/tegra: fuse: Add custom SoC attributes
      soc/tegra: fuse: Trivial clean-up of tegra_init_revision()
      soc/tegra: fuse: Update the SoC revision attribute to display a name
      soc/tegra: pmc: Enable PMIC wake event on Tegra194

Thierry Reding (1):
      soc/tegra: pmc: Enable PMIC wake event on Tegra186

 drivers/soc/tegra/Kconfig              |  1 +
 drivers/soc/tegra/fuse/fuse-tegra.c    | 57 +++++++++++++++++++++++++++++++++-
 drivers/soc/tegra/fuse/fuse-tegra20.c  |  1 +
 drivers/soc/tegra/fuse/fuse-tegra30.c  |  6 ++++
 drivers/soc/tegra/fuse/fuse.h          |  8 +++++
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 32 +++++++++++--------
 drivers/soc/tegra/pmc.c                |  2 ++
 include/soc/tegra/pmc.h                | 15 +++++----
 8 files changed, 102 insertions(+), 20 deletions(-)
