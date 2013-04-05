From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [GIT PULL 7/8] ARM: tegra: multi-platform conversion
Date: Fri,  5 Apr 2013 11:03:45 -0600
Message-ID: <1365181426-11547-7-git-send-email-swarren@wwwdotorg.org>
References: <1365181426-11547-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1365181426-11547-1-git-send-email-swarren@wwwdotorg.org>
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
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org

This branch converts Tegra to support multi-platform/single-zImage.

One header is made accessible to drivers. The earlyprintk implementation
is moved to the multi-platform location. Some Kconfig changes are made
to enable multi-platform. Some dead files are deleted.

The APIs exposed in the now-global tegra-powergate.h should be replaced
with standard reset and power domain APIs in the future.

This branch is based on (part of) the previous soc pull request.

----------------------------------------------------------------

The following changes since commit 7495b2eb0770b85e58af98b99faaf853e9563784:

  ARM: tegra: add speedo-based process id for Tegra114

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git tegra-for-3.10-multiplatform

for you to fetch changes up to 9002722560ba86a2f59811e3d11a2575bf47e1f6:

  ARM: tegra: convert to multi-platform

----------------------------------------------------------------

Stephen Warren (2):
      ARM: tegra: move <mach/powergate.h> to <linux/tegra-powergate.h>
      ARM: tegra: convert to multi-platform

 arch/arm/Kconfig                                |   19 --
 arch/arm/mach-tegra/Kconfig                     |   27 ++-
 arch/arm/mach-tegra/Makefile.boot               |    3 -
 arch/arm/mach-tegra/board.h                     |    1 +
 arch/arm/mach-tegra/common.c                    |    2 -
 arch/arm/mach-tegra/include/mach/timex.h        |   26 ---
 arch/arm/mach-tegra/include/mach/uncompress.h   |  175 ------------------
 arch/arm/mach-tegra/pcie.c                      |    3 +-
 arch/arm/mach-tegra/powergate.c                 |    3 +-
 drivers/clk/tegra/clk-tegra30.c                 |    3 +-
 .../linux/tegra-powergate.h                     |    5 -
 11 files changed, 24 insertions(+), 243 deletions(-)
 delete mode 100644 arch/arm/mach-tegra/Makefile.boot
 delete mode 100644 arch/arm/mach-tegra/include/mach/timex.h
 delete mode 100644 arch/arm/mach-tegra/include/mach/uncompress.h
 rename arch/arm/mach-tegra/include/mach/powergate.h => include/linux/tegra-powergate.h (92%)
