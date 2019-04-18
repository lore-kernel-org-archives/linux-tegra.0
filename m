From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 4/9] memory: tegra: Changes for v5.2-rc1
Date: Thu, 18 Apr 2019 17:07:15 +0200
Message-ID: <20190418150721.8828-4-thierry.reding@gmail.com>
References: <20190418150721.8828-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190418150721.8828-1-thierry.reding@gmail.com>
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

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.2-memory

for you to fetch changes up to 67a8d5b0fadfd931f7e6a78e9ee7b2792a7114aa:

  memory: tegra: Fix a typos for "fdcdwr2" mc client (2019-04-18 11:51:17 +0200)

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Changes for v5.2-rc1

These are a set of fixes for various issues related to the Tegra memory
controller.

----------------------------------------------------------------
Dmitry Osipenko (4):
      memory: tegra: Fix missed registers values latching
      memory: tegra: Fix integer overflow on tick value calculation
      memory: tegra: Replace readl-writel with mc_readl-mc_writel
      Revert "ARM: tegra: Restore memory arbitration on resume from LP1 on Tegra30+"

Edward Cragg (1):
      memory: tegra: Fix a typos for "fdcdwr2" mc client

Thierry Reding (1):
      memory: tegra: Properly spell "tegra"

Yue Haibing (1):
      memory: tegra: Make terga20_mc_reset_ops static

 arch/arm/mach-tegra/iomap.h         |  9 ---------
 arch/arm/mach-tegra/sleep-tegra30.S | 21 ---------------------
 drivers/memory/tegra/mc.c           | 34 ++++++++++++++++++++--------------
 drivers/memory/tegra/mc.h           |  2 +-
 drivers/memory/tegra/tegra114.c     |  4 ++--
 drivers/memory/tegra/tegra124.c     |  4 ++--
 drivers/memory/tegra/tegra20.c      | 28 ++++++++++++++--------------
 drivers/memory/tegra/tegra210.c     |  2 +-
 drivers/memory/tegra/tegra30.c      |  4 ++--
 9 files changed, 42 insertions(+), 66 deletions(-)
