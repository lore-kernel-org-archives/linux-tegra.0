From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [GIT PULL 4/8] ARM: tegra: cpuidle enhancements
Date: Wed, 30 Jan 2013 14:42:35 -0700
Message-ID: <1359582159-28816-4-git-send-email-swarren@wwwdotorg.org>
References: <1359582159-28816-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1359582159-28816-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This pull request implements a new "LP2" cpuidle state for Tegra20,
which makes use of the couple cpuidle feature.

It is based on (most of) the previous pull request, with tag
tegra-for-3.9-soc-usb.

----------------------------------------------------------------

The following changes since commit 9304512151b0933c454f0842cdb19bec23422bc5:

  usb: host: tegra: don't touch EMC clock

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git tegra-for-3.9-soc-cpuidle

for you to fetch changes up to 1d328606c66b9bb1c0552f585943d596f37ae3b9:

  ARM: tegra20: cpuidle: apply coupled cpuidle for powered-down mode

----------------------------------------------------------------

Joseph Lo (5):
      ARM: tegra: add pending SGI checking API
      ARM: tegra20: cpuidle: add powered-down state for secondary CPU
      clk: tegra20: Implementing CPU low-power function for tegra_cpu_car_ops
      ARM: tegra20: flowctrl: add support for cpu_suspend_enter/exit
      ARM: tegra20: cpuidle: apply coupled cpuidle for powered-down mode

 arch/arm/mach-tegra/Kconfig           |    1 +
 arch/arm/mach-tegra/cpuidle-tegra20.c |  197 ++++++++++++++++++++++++++-
 arch/arm/mach-tegra/flowctrl.c        |   38 +++++-
 arch/arm/mach-tegra/flowctrl.h        |    4 +
 arch/arm/mach-tegra/irq.c             |   15 +++
 arch/arm/mach-tegra/irq.h             |   22 +++
 arch/arm/mach-tegra/pm.c              |    3 +
 arch/arm/mach-tegra/sleep-tegra20.S   |  200 ++++++++++++++++++++++++++++
 arch/arm/mach-tegra/sleep.S           |   19 +++
 arch/arm/mach-tegra/sleep.h           |   26 ++++
 drivers/clk/tegra/clk-tegra20.c       |   93 +++++++++++++
 11 files changed, 609 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm/mach-tegra/irq.h
