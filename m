From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 4/8] soc: tegra: Changes for v5.6-rc1
Date: Sat, 11 Jan 2020 01:35:49 +0100
Message-ID: <20200111003553.2411874-4-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.6-soc

for you to fetch changes up to 02676345e9b31ad8907af3755960e3cfef575f8d:

  soc/tegra: fuse: Unmap registers once they are not needed anymore (2020-01-10 15:59:43 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc: tegra: Changes for v5.6-rc1

This adds a couple of optimizations to how the chip ID and straps are
read and adds support for the FUSE block on Tegra194. Included is also a
small optimization for the coupled regulator driver to abort early if no
voltage change has occurred.

----------------------------------------------------------------
Dmitry Osipenko (6):
      soc/tegra: fuse: Add APB DMA dependency for Tegra20
      soc/tegra: regulators: Do nothing if voltage is unchanged
      soc/tegra: fuse: Cache values of straps and Chip ID registers
      soc/tegra: fuse: Warn if straps are not ready
      soc/tegra: fuse: Correct straps' address for older Tegra124 device trees
      soc/tegra: fuse: Unmap registers once they are not needed anymore

JC Kuo (1):
      soc/tegra: fuse: Add Tegra194 support

 drivers/soc/tegra/Kconfig              |  1 +
 drivers/soc/tegra/fuse/fuse-tegra.c    |  3 +++
 drivers/soc/tegra/fuse/fuse-tegra30.c  | 29 +++++++++++++++++++++++++++++
 drivers/soc/tegra/fuse/fuse.h          |  4 ++++
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 34 ++++++++++++++++++++--------------
 drivers/soc/tegra/regulators-tegra20.c |  8 +++++++-
 drivers/soc/tegra/regulators-tegra30.c |  6 ++++++
 7 files changed, 70 insertions(+), 15 deletions(-)
