From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 5/8] ARM: tegra: Core changes for v5.5-rc1
Date: Sat,  2 Nov 2019 15:45:18 +0100
Message-ID: <20191102144521.3863321-5-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-arm-core

for you to fetch changes up to 91d7ff5aa7e3edd9ab99a424099476ed5667b152:

  ARM: tegra: Use WFE for power-gating on Tegra30 (2019-10-29 14:32:01 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Core changes for v5.5-rc1

Contains two fixes for CPU idle and suspend/resume on early Tegra SoCs.

----------------------------------------------------------------
Dmitry Osipenko (2):
      ARM: tegra: Fix FLOW_CTLR_HALT register clobbering by tegra_resume()
      ARM: tegra: Use WFE for power-gating on Tegra30

 arch/arm/mach-tegra/reset-handler.S |  6 +++---
 arch/arm/mach-tegra/sleep-tegra30.S |  4 +++-
 drivers/soc/tegra/flowctrl.c        | 19 +++++++++++++++++--
 3 files changed, 23 insertions(+), 6 deletions(-)
