From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 3/8] memory: tegra: Changes for v5.6-rc1
Date: Sat, 11 Jan 2020 01:35:48 +0100
Message-ID: <20200111003553.2411874-3-thierry.reding@gmail.com>
References: <20200111003553.2411874-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
In-Reply-To: <20200111003553.2411874-1-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: arm@kernel.org, soc@kernel.org
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.6-memory

for you to fetch changes up to 5e5eca6644873da93f5a32904f43220380f34e88:

  memory: tegra30-emc: Correct error message for timed out auto calibration (2020-01-10 15:48:48 +0100)

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Changes for v5.6-rc1

This adds a couple of fixes for the Tegra30 EMC frequency scaling code
and adds support for EMC frequency scaling on Tegra186 and later.

----------------------------------------------------------------
Dmitry Osipenko (3):
      memory: tegra30-emc: Firm up suspend/resume sequence
      memory: tegra30-emc: Firm up hardware programming sequence
      memory: tegra30-emc: Correct error message for timed out auto calibration

Nicolin Chen (1):
      memory: tegra: Correct reset value of xusb_hostr

Thierry Reding (10):
      memory: tegra: Refashion EMC debugfs interface on Tegra124
      memory: tegra: Implement EMC debugfs interface on Tegra20
      memory: tegra: Implement EMC debugfs interface on Tegra30
      memory: tegra: Rename tegra_mc to tegra186_mc on Tegra186
      memory: tegra: Add per-SoC data for Tegra186
      memory: tegra: Extract memory client SID programming
      memory: tegra: Add system sleep support
      memory: tegra: Support DVFS on Tegra186 and later
      memory: tegra: Only include support for enabled SoCs
      memory: tegra: Add support for the Tegra194 memory controller

 drivers/memory/tegra/Makefile       |    3 +-
 drivers/memory/tegra/tegra124-emc.c |  185 ++++--
 drivers/memory/tegra/tegra186-emc.c |  293 ++++++++++
 drivers/memory/tegra/tegra186.c     | 1067 ++++++++++++++++++++++++++++++++++-
 drivers/memory/tegra/tegra20-emc.c  |  175 ++++++
 drivers/memory/tegra/tegra210.c     |    2 +-
 drivers/memory/tegra/tegra30-emc.c  |  352 +++++++++---
 7 files changed, 1928 insertions(+), 149 deletions(-)
 create mode 100644 drivers/memory/tegra/tegra186-emc.c
