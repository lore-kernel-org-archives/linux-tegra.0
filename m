From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL v2 3/8] memory: tegra: Changes for v5.5-rc1
Date: Mon, 11 Nov 2019 15:38:36 +0100
Message-ID: <20191111143836.4027200-1-thierry.reding@gmail.com>
References: <20191102144521.3863321-3-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191102144521.3863321-3-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: soc@kernel.org, arm@kernel.org
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-memory-v2

for you to fetch changes up to 141bef44e123c101c0da0443ab6b3cfa750f251a:

  memory: tegra: Consolidate registers definition into common header (2019-11-11 14:55:27 +0100)

This is an updated pull request which now no longer pulls in the core
common clock framework change because it's not required by any of the
code in this pull request.

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Changes for v5.5-rc1

This contains a couple of fixes and adds support for EMC frequency
scaling on Tegra30.

----------------------------------------------------------------
Dmitry Osipenko (11):
      clk: tegra: Add Tegra20/30 EMC clock implementation
      memory: tegra: Don't set EMC rate to maximum on probe for Tegra20
      memory: tegra: Adapt for Tegra20 clock driver changes
      memory: tegra: Include io.h instead of iopoll.h
      memory: tegra: Pre-configure debug register on Tegra20
      memory: tegra: Print a brief info message about EMC timings
      memory: tegra: Increase handshake timeout on Tegra20
      memory: tegra: Do not handle error from wait_for_completion_timeout()
      memory: tegra: Introduce Tegra30 EMC driver
      memory: tegra: Ensure timing control debug features are disabled
      memory: tegra: Consolidate registers definition into common header

Thierry Reding (3):
      Merge branch 'for-5.5/clk' into for-5.5/memory
      memory: tegra: Set DMA mask based on supported address bits
      memory: tegra: Add gr2d and gr3d to DRM IOMMU group

 drivers/clk/tegra/Makefile          |    2 +
 drivers/clk/tegra/clk-tegra20-emc.c |  293 +++++++++
 drivers/clk/tegra/clk-tegra20.c     |   55 +-
 drivers/clk/tegra/clk-tegra30.c     |   38 +-
 drivers/clk/tegra/clk.h             |    3 +
 drivers/memory/tegra/Kconfig        |   10 +
 drivers/memory/tegra/Makefile       |    1 +
 drivers/memory/tegra/mc.c           |   52 +-
 drivers/memory/tegra/mc.h           |   74 ++-
 drivers/memory/tegra/tegra114.c     |   10 +-
 drivers/memory/tegra/tegra124.c     |   30 +-
 drivers/memory/tegra/tegra20-emc.c  |  134 ++--
 drivers/memory/tegra/tegra30-emc.c  | 1232 +++++++++++++++++++++++++++++++++++
 drivers/memory/tegra/tegra30.c      |   34 +-
 include/linux/clk/tegra.h           |   11 +
 include/soc/tegra/mc.h              |    2 +-
 16 files changed, 1779 insertions(+), 202 deletions(-)
 create mode 100644 drivers/clk/tegra/clk-tegra20-emc.c
 create mode 100644 drivers/memory/tegra/tegra30-emc.c
