From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 4/8] soc/tegra: Changes for v5.5-rc1
Date: Sat,  2 Nov 2019 15:45:17 +0100
Message-ID: <20191102144521.3863321-4-thierry.reding@gmail.com>
References: <20191102144521.3863321-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191102144521.3863321-1-thierry.reding@gmail.com>
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

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-soc

for you to fetch changes up to 69dfb3d4a89afccca1d8f282e49ad1362100cc43:

  soc/tegra: pmc: Remove unnecessary memory barrier (2019-10-29 14:36:24 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v5.5-rc1

Adds wake event support on Tegra210, implements the NVMEM API for the
Tegra FUSE block and adds coupled regulators support for Tegra20 and
Tegra30.

----------------------------------------------------------------
Dmitry Osipenko (4):
      soc/tegra: regulators: Add regulators coupler for Tegra20
      soc/tegra: regulators: Add regulators coupler for Tegra30
      soc/tegra: pmc: Query PCLK clock rate at probe time
      soc/tegra: pmc: Remove unnecessary memory barrier

Nagarjuna Kristam (1):
      soc/tegra: fuse: Add FUSE clock check in tegra_fuse_readl()

Sowjanya Komatineni (4):
      soc/tegra: pmc: Support wake events on more Tegra SoCs
      soc/tegra: pmc: Add wake event support on Tegra210
      soc/tegra: pmc: Configure core power request polarity
      soc/tegra: pmc: Configure deep sleep control settings

Thierry Reding (5):
      soc/tegra: pmc: Fix crashes for hierarchical interrupts
      soc/tegra: fuse: Restore base on sysfs failure
      soc/tegra: fuse: Implement nvmem device
      soc/tegra: fuse: Add cell information
      soc/tegra: fuse: Register cell lookups for compatibility

 drivers/soc/tegra/Kconfig              |  10 +
 drivers/soc/tegra/Makefile             |   2 +
 drivers/soc/tegra/fuse/fuse-tegra.c    | 198 +++++++++++++-----
 drivers/soc/tegra/fuse/fuse-tegra30.c  | 154 ++++++++++++++
 drivers/soc/tegra/fuse/fuse.h          |   8 +
 drivers/soc/tegra/pmc.c                | 232 +++++++++++++++++++--
 drivers/soc/tegra/regulators-tegra20.c | 365 +++++++++++++++++++++++++++++++++
 drivers/soc/tegra/regulators-tegra30.c | 317 ++++++++++++++++++++++++++++
 8 files changed, 1212 insertions(+), 74 deletions(-)
 create mode 100644 drivers/soc/tegra/regulators-tegra20.c
 create mode 100644 drivers/soc/tegra/regulators-tegra30.c
