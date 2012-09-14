From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [GIT PULL 06/10] ARM: tegra: implement CPU hotplug
Date: Fri, 14 Sep 2012 14:06:17 -0600
Message-ID: <1347653181-19936-6-git-send-email-swarren@wwwdotorg.org>
References: <1347653181-19936-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1347653181-19936-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This branch implements CPU hot-plugging support for both Tegra20 and
Tegra30. Portions of the implementation are contained in the clock
driver, hence this branch is based on the common clock conversion in
order to avoid duplicating work.

This branch is based on previous pull request tegra-for-3.7-common-clk.

----------------------------------------------------------------

The following changes since commit b4350f40f73b75efdceae3d9e04266979acabd8c:

  ARM: Tegra: Add smp_twd clock for Tegra20

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git tegra-for-3.7-cpu-hotplug

for you to fetch changes up to 453689e407f2b7c0a72a2e6fb2ef84c20475773b:

  ARM: tegra20: add CPU hotplug support

----------------------------------------------------------------

Joseph Lo (5):
      ARM: tegra: introduce tegra_cpu_car_ops structures
      ARM: tegra: replace the CPU CAR access code by tegra_cpu_car_ops
      ARM: tegra: clean up the common assembly macros into sleep.h
      ARM: tegra30: add CPU hotplug support
      ARM: tegra20: add CPU hotplug support

 arch/arm/mach-tegra/Makefile              |    2 +
 arch/arm/mach-tegra/clock.c               |    4 +
 arch/arm/mach-tegra/common.c              |    3 +
 arch/arm/mach-tegra/headsmp.S             |    6 +-
 arch/arm/mach-tegra/hotplug.c             |  118 +++++++-----------------
 arch/arm/mach-tegra/platsmp.c             |   29 +-----
 arch/arm/mach-tegra/sleep-t20.S           |   82 ++++++++++++++++
 arch/arm/mach-tegra/sleep-t30.S           |  107 +++++++++++++++++++++
 arch/arm/mach-tegra/sleep.S               |   33 +-------
 arch/arm/mach-tegra/sleep.h               |   85 +++++++++++++++++
 arch/arm/mach-tegra/tegra20_clocks.c      |   70 ++++++++++++++
 arch/arm/mach-tegra/tegra20_clocks_data.c |    2 +
 arch/arm/mach-tegra/tegra30_clocks.c      |   72 ++++++++++++++
 arch/arm/mach-tegra/tegra30_clocks_data.c |    3 +
 arch/arm/mach-tegra/tegra_cpu_car.h       |   87 +++++++++++++++++
 15 files changed, 556 insertions(+), 147 deletions(-)
 create mode 100644 arch/arm/mach-tegra/sleep-t20.S
 create mode 100644 arch/arm/mach-tegra/sleep-t30.S
 create mode 100644 arch/arm/mach-tegra/sleep.h
 create mode 100644 arch/arm/mach-tegra/tegra_cpu_car.h
