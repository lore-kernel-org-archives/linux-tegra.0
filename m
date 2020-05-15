From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 07/11] memory: tegra: Changes for v5.8-rc1
Date: Fri, 15 May 2020 16:53:07 +0200
Message-ID: <20200515145311.1580134-8-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.8-memory

for you to fetch changes up to b7d4cab0360484786b2a53b1bb603b564218112f:

  memory: tegra: Delete some dead code (2020-05-12 22:52:00 +0200)

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Changes for v5.8-rc1

Contains a few cleanup patches and an implementation to scale the EMC
frequency on Tegra210 systems.

----------------------------------------------------------------
Arnd Bergmann (1):
      memory: tegra: Avoid unused function warnings

Christophe JAILLET (1):
      memory: tegra: Fix an error handling path in tegra186_emc_probe()

Dan Carpenter (1):
      memory: tegra: Delete some dead code

Dmitry Osipenko (9):
      dt-bindings: cpufreq: Add binding for NVIDIA Tegra20/30
      clk: tegra: Add custom CCLK implementation
      clk: tegra: pll: Add pre/post rate-change hooks
      clk: tegra: cclk: Add helpers for handling PLLX rate changes
      clk: tegra20: Use custom CCLK implementation
      clk: tegra30: Use custom CCLK implementation
      memory: tegra: Make debugfs permissions human-readable
      memory: tegra20-emc: Poll EMC-CaR handshake instead of waiting for interrupt
      memory: tegra30-emc: Poll EMC-CaR handshake instead of waiting for interrupt

Geert Uytterhoeven (2):
      of: Make <linux/of_reserved_mem.h> self-contained
      memory: tegra: Drop <linux/clk-provider.h>

Joseph Lo (7):
      dt-bindings: memory: tegra: Add external memory controller binding for Tegra210
      clk: tegra: Add PLLP_UD and PLLMB_UD for Tegra210
      clk: tegra: Export functions for EMC clock scaling
      clk: tegra: Implement Tegra210 EMC clock
      clk: tegra: Remove the old emc_mux clock for Tegra210
      memory: tegra: Add EMC scaling support code for Tegra210
      memory: tegra: Add EMC scaling sequence code for Tegra210

Sowjanya Komatineni (4):
      dt-bindings: clock: tegra: Remove PMC clock IDs
      dt-bindings: clock: tegra: Add clock ID for CSI TPG clock
      dt-bindings: tegra: Add VI and CSI bindings
      clk: tegra: Add Tegra210 CSI TPG clock gate

Thierry Reding (9):
      of: reserved-memory: Support lookup of regions by name
      of: reserved-memory: Support multiple regions per device
      dt-bindings: i2c: tegra: Document Tegra210 VI I2C
      Merge branch 'for-5.8/dt-bindings' into for-5.8/clk
      clk: tegra: Rename Tegra124 EMC clock source file
      Merge branch 'for-5.8/dt-bindings' into for-5.8/memory
      Merge branch 'for-5.8/of' into for-5.8/memory
      Merge branch 'for-5.8/clk' into for-5.8/memory
      memory: tegra: Support derated timings on Tegra210

 .../bindings/cpufreq/nvidia,tegra20-cpufreq.txt    |   56 +
 .../display/tegra/nvidia,tegra20-host1x.txt        |   73 +-
 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt |    6 +
 .../memory-controllers/nvidia,tegra210-emc.yaml    |   82 +
 drivers/clk/tegra/Kconfig                          |    4 -
 drivers/clk/tegra/Makefile                         |    4 +-
 drivers/clk/tegra/clk-pll.c                        |   12 +-
 drivers/clk/tegra/clk-tegra-super-cclk.c           |  212 ++
 .../clk/tegra/{clk-emc.c => clk-tegra124-emc.c}    |    0
 drivers/clk/tegra/clk-tegra20.c                    |    7 +-
 drivers/clk/tegra/clk-tegra210-emc.c               |  369 ++++
 drivers/clk/tegra/clk-tegra210.c                   |   94 +-
 drivers/clk/tegra/clk-tegra30.c                    |    6 +-
 drivers/clk/tegra/clk.h                            |   24 +-
 drivers/memory/tegra/Kconfig                       |   14 +
 drivers/memory/tegra/Makefile                      |    4 +
 drivers/memory/tegra/mc.h                          |    1 +
 drivers/memory/tegra/tegra124-emc.c                |    6 +-
 drivers/memory/tegra/tegra186-emc.c                |   21 +-
 drivers/memory/tegra/tegra186.c                    |    4 +-
 drivers/memory/tegra/tegra20-emc.c                 |   34 +-
 drivers/memory/tegra/tegra210-emc-cc-r21021.c      | 1775 +++++++++++++++++
 drivers/memory/tegra/tegra210-emc-core.c           | 2100 ++++++++++++++++++++
 drivers/memory/tegra/tegra210-emc-table.c          |   90 +
 drivers/memory/tegra/tegra210-emc.h                | 1016 ++++++++++
 drivers/memory/tegra/tegra210-mc.h                 |   50 +
 drivers/memory/tegra/tegra30-emc.c                 |  122 +-
 drivers/of/of_reserved_mem.c                       |   41 +-
 include/dt-bindings/clock/tegra114-car.h           |   14 +-
 include/dt-bindings/clock/tegra124-car-common.h    |   14 +-
 include/dt-bindings/clock/tegra20-car.h            |    2 +-
 include/dt-bindings/clock/tegra210-car.h           |   20 +-
 include/dt-bindings/clock/tegra30-car.h            |   14 +-
 include/linux/clk/tegra.h                          |   27 +
 include/linux/of_reserved_mem.h                    |   12 +
 35 files changed, 6131 insertions(+), 199 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/cpufreq/nvidia,tegra20-cpufreq.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
 create mode 100644 drivers/clk/tegra/clk-tegra-super-cclk.c
 rename drivers/clk/tegra/{clk-emc.c => clk-tegra124-emc.c} (100%)
 create mode 100644 drivers/clk/tegra/clk-tegra210-emc.c
 create mode 100644 drivers/memory/tegra/tegra210-emc-cc-r21021.c
 create mode 100644 drivers/memory/tegra/tegra210-emc-core.c
 create mode 100644 drivers/memory/tegra/tegra210-emc-table.c
 create mode 100644 drivers/memory/tegra/tegra210-emc.h
 create mode 100644 drivers/memory/tegra/tegra210-mc.h
