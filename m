From: Dmitry Osipenko <digetx@gmail.com>
Subject: [RFC PATCH v1 0/6] Introduce machine-specific regulators coupling API
Date: Sun, 14 Apr 2019 20:59:33 +0300
Message-ID: <20190414175939.12368-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

I was looking into how to properly implement regulators coupling for
NVIDIA Tegra SoC's and ended up with this patchset that introduces
machine-specific regulators coupling. Upstream kernel now has support
for a simple variants of regulators coupling in a form of limiting
maximum voltage spreading between two regulators, but that's not enough
for the case of Tegra SoC's. It's a bit difficult to support universally
all possible coupling restrictions in a form of device-tree description,
so here comes the machine-specific coupling API which allow platforms
to customize coupling algorithms.

Dmitry Osipenko (6):
  regulator: core: Introduce API for machine-specific regulators
    coupling
  regulator: core: Parse max-spread value per regulator couple
  regulator: core: Expose some of core functions
  regulator: core Bump MAX_COUPLED to 3
  soc/tegra: regulators: Add regulators coupler for Tegra20
  soc/tegra: regulators: Add regulators coupler for Tegra30

 drivers/regulator/core.c               |  89 +++++---
 drivers/regulator/of_regulator.c       |  49 ++--
 drivers/soc/tegra/Kconfig              |  12 +
 drivers/soc/tegra/Makefile             |   2 +
 drivers/soc/tegra/regulators-tegra20.c | 304 +++++++++++++++++++++++++
 drivers/soc/tegra/regulators-tegra30.c | 256 +++++++++++++++++++++
 include/linux/regulator/driver.h       |  14 +-
 include/linux/regulator/machine.h      |  22 +-
 8 files changed, 694 insertions(+), 54 deletions(-)
 create mode 100644 drivers/soc/tegra/regulators-tegra20.c
 create mode 100644 drivers/soc/tegra/regulators-tegra30.c

-- 
2.21.0
