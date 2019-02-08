From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 1/9] clk: tegra: Changes for v5.1-rc1
Date: Fri,  8 Feb 2019 16:09:27 +0100
Message-ID: <20190208150935.32108-2-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.1-clk

for you to fetch changes up to 8bf9437a4e7f7c97909c6ace50cdd1177b907853:

  clk: tegra: dfll: build clk-dfll.c for Tegra124 and Tegra210 (2019-02-06 14:29:37 +0100)

Thanks,
Thierry

----------------------------------------------------------------
clk: tegra: Changes for v5.1-rc1

This contains a couple of prerequisite patches to enable CPU frequency
scaling on Tegra210.

----------------------------------------------------------------
Joseph Lo (4):
      clk: tegra: dfll: CVB calculation alignment with the regulator
      clk: tegra: dfll: support PWM regulator control
      clk: tegra: dfll: round down voltages based on alignment
      clk: tegra: dfll: add CVB tables for Tegra210

Peter De Schrijver (2):
      clk: tegra: dfll: registration for multiple SoCs
      clk: tegra: dfll: build clk-dfll.c for Tegra124 and Tegra210

 drivers/clk/tegra/Kconfig                  |   5 +
 drivers/clk/tegra/Makefile                 |   2 +-
 drivers/clk/tegra/clk-dfll.c               | 459 +++++++++++++++++++++----
 drivers/clk/tegra/clk-dfll.h               |   6 +-
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 520 ++++++++++++++++++++++++++++-
 drivers/clk/tegra/cvb.c                    |  12 +-
 drivers/clk/tegra/cvb.h                    |   7 +-
 7 files changed, 913 insertions(+), 98 deletions(-)
