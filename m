From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 3/7] memory: tegra: Changes for v5.9-rc1
Date: Fri, 17 Jul 2020 18:12:56 +0200
Message-ID: <20200717161300.1661002-3-thierry.reding@gmail.com>
References: <20200717161300.1661002-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200717161300.1661002-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.9-memory

for you to fetch changes up to 46c019239fb263922d2881847dd6b614c814d867:

  memory: tegra: Add Tegra132 compatible string match (2020-07-15 11:55:21 +0200)

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Changes for v5.9-rc1

This contains the Tegra210 EMC frequency scaling support that didn't
make it into v5.8. In addition there are a couple of cleanups and minor
fixes.

----------------------------------------------------------------
Arnd Bergmann (1):
      memory: tegra: Avoid unused function warnings

Christophe JAILLET (1):
      memory: tegra: Fix an error handling path in tegra186_emc_probe()

Dan Carpenter (1):
      memory: tegra: Delete some dead code

Dmitry Osipenko (3):
      memory: tegra: Make debugfs permissions human-readable
      memory: tegra20-emc: Poll EMC-CaR handshake instead of waiting for interrupt
      memory: tegra30-emc: Poll EMC-CaR handshake instead of waiting for interrupt

Geert Uytterhoeven (1):
      memory: tegra: Drop <linux/clk-provider.h>

Jon Hunter (1):
      memory: tegra: Fix KCONFIG variables for Tegra186 and Tegra194

Joseph Lo (2):
      memory: tegra: Add EMC scaling support code for Tegra210
      memory: tegra: Add EMC scaling sequence code for Tegra210

Thierry Reding (2):
      memory: tegra: Support derated timings on Tegra210
      memory: tegra: Add Tegra132 compatible string match

 drivers/memory/tegra/Kconfig                  |   14 +
 drivers/memory/tegra/Makefile                 |    4 +
 drivers/memory/tegra/mc.h                     |    1 +
 drivers/memory/tegra/tegra124-emc.c           |    7 +-
 drivers/memory/tegra/tegra186-emc.c           |   25 +-
 drivers/memory/tegra/tegra186.c               |    4 +-
 drivers/memory/tegra/tegra20-emc.c            |   34 +-
 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 1775 +++++++++++++++++++++
 drivers/memory/tegra/tegra210-emc-core.c      | 2100 +++++++++++++++++++++++++
 drivers/memory/tegra/tegra210-emc-table.c     |   90 ++
 drivers/memory/tegra/tegra210-emc.h           | 1016 ++++++++++++
 drivers/memory/tegra/tegra210-mc.h            |   50 +
 drivers/memory/tegra/tegra30-emc.c            |  122 +-
 13 files changed, 5130 insertions(+), 112 deletions(-)
 create mode 100644 drivers/memory/tegra/tegra210-emc-cc-r21021.c
 create mode 100644 drivers/memory/tegra/tegra210-emc-core.c
 create mode 100644 drivers/memory/tegra/tegra210-emc-table.c
 create mode 100644 drivers/memory/tegra/tegra210-emc.h
 create mode 100644 drivers/memory/tegra/tegra210-mc.h
