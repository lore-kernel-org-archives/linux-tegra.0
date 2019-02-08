From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 6/9] ARM: tegra: Core changes for v5.1-rc1
Date: Fri,  8 Feb 2019 16:09:32 +0100
Message-ID: <20190208150935.32108-7-thierry.reding@gmail.com>
References: <20190208150935.32108-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190208150935.32108-1-thierry.reding@gmail.com>
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

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.1-arm-core

for you to fetch changes up to 1c6279b49d3ffff38357e93d112512fecf3711a7:

  ARM: tegra: Restore memory arbitration on resume from LP1 on Tegra30+ (2019-01-16 13:22:04 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Core changes for v5.1-rc1

This contains three fixes for resume from LP1 on Tegra30.

----------------------------------------------------------------
Dmitry Osipenko (3):
      ARM: tegra: Fix missed EMC registers latching on resume from LP1 on Tegra30+
      ARM: tegra: Fix DRAM refresh-interval clobbering on resume from LP1 on Tegra30
      ARM: tegra: Restore memory arbitration on resume from LP1 on Tegra30+

 arch/arm/mach-tegra/iomap.h         |  9 +++++++++
 arch/arm/mach-tegra/sleep-tegra20.S |  2 --
 arch/arm/mach-tegra/sleep-tegra30.S | 25 +++++++++++++++++++++++--
 3 files changed, 32 insertions(+), 4 deletions(-)
