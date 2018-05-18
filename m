From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 2/5] memory: tegra: Changes for v4.18-rc1
Date: Fri, 18 May 2018 16:22:42 +0200
Message-ID: <20180518142245.20242-2-thierry.reding@gmail.com>
References: <20180518142245.20242-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180518142245.20242-1-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:

  Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.18-memory

for you to fetch changes up to bef89a8d81ca97aca864778746b110cf52847868:

  memory: tegra: Remove Tegra114 SATA and AFI reset definitions (2018-05-18 12:33:02 +0200)

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Changes for v4.18-rc1

This contains some cleanup of the memory controller driver as well as
unification work to share more code between Tegra20 and later SoC
generations. Also included are an implementation for the hot resets
functionality by the memory controller which is required to properly
reset busy hardware.

----------------------------------------------------------------
Dmitry Osipenko (14):
      dt-bindings: memory: tegra: Add hot resets definitions
      memory: tegra: Do not handle spurious interrupts
      memory: tegra: Setup interrupts mask before requesting IRQ
      memory: tegra: Apply interrupts mask per SoC
      memory: tegra: Remove unused headers inclusions
      memory: tegra: Squash tegra20-mc into common tegra-mc driver
      memory: tegra: Introduce memory client hot reset
      memory: tegra: Add Tegra20 memory controller hot resets
      memory: tegra: Add Tegra30 memory controller hot resets
      memory: tegra: Add Tegra114 memory controller hot resets
      memory: tegra: Add Tegra124 memory controller hot resets
      memory: tegra: Register SMMU after MC driver became ready
      dt-bindings: memory: tegra: Remove Tegra114 SATA and AFI reset definitions
      memory: tegra: Remove Tegra114 SATA and AFI reset definitions

Thierry Reding (1):
      memory: tegra: Add Tegra210 memory controller hot resets

 drivers/memory/Kconfig                   |  10 -
 drivers/memory/Makefile                  |   1 -
 drivers/memory/tegra/Makefile            |   1 +
 drivers/memory/tegra/mc.c                | 362 +++++++++++++++++++++++++++----
 drivers/memory/tegra/mc.h                |  22 ++
 drivers/memory/tegra/tegra114.c          |  33 +++
 drivers/memory/tegra/tegra124.c          |  48 ++++
 drivers/memory/tegra/tegra20.c           | 296 +++++++++++++++++++++++++
 drivers/memory/tegra/tegra210.c          |  53 ++++-
 drivers/memory/tegra/tegra30.c           |  35 +++
 drivers/memory/tegra20-mc.c              | 254 ----------------------
 include/dt-bindings/memory/tegra114-mc.h |  17 ++
 include/dt-bindings/memory/tegra124-mc.h |  25 +++
 include/dt-bindings/memory/tegra20-mc.h  |  21 ++
 include/dt-bindings/memory/tegra210-mc.h |  31 +++
 include/dt-bindings/memory/tegra30-mc.h  |  19 ++
 include/soc/tegra/mc.h                   |  37 +++-
 17 files changed, 956 insertions(+), 309 deletions(-)
 create mode 100644 drivers/memory/tegra/tegra20.c
 delete mode 100644 drivers/memory/tegra20-mc.c
 create mode 100644 include/dt-bindings/memory/tegra20-mc.h
