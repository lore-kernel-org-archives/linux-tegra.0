From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V4 0/5] ARM: tegra20: cpuidle: add power-down state
Date: Wed, 16 Jan 2013 16:10:07 +0800
Message-ID: <1358323807-30157-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This adds a "powered-down" state in cpuidle for Tegra20. It requires power
gating both CPU cores. When the CPU1 requests to enter "powered-down"
state, it saves its own state and then enters WFI. When the CPU0 requests
the same state, it attempts to put the CPU1 into reset to prevent it from
waking up. Then power down both CPUs together and turn off the CPU rail.

If the CPU1 be woken up before CPU0 entering powered-down state, then it
needs to restore it's CPU state and waits for next chance.

V4:
* rebased on next-20130114 + Tegra-ccf-rework-v4

V3:
* sqash the last 2 patches in previors version to support coupled cpuidle
  directly

V2:
* add a new patch for checking if there is any pending SGI
* if there is a SGI pending for the CPU, then we will abort the
  "powered-down" idle for the both CPUs that already in coupled state

Verified on Seaboard(Tegra20) and Cardhu(Tegra30).

Joseph Lo (5):
  ARM: tegra: add pending SGI checking API
  ARM: tegra20: cpuidle: add powered-down state for secondary CPU
  clk: tegra20: Implementing CPU low-power function for
    tegra_cpu_car_ops
  ARM: tegra20: flowctrl: add support for cpu_suspend_enter/exit
  ARM: tegra20: cpuidle: apply coupled cpuidle for powered-down mode

 arch/arm/mach-tegra/Kconfig           |   1 +
 arch/arm/mach-tegra/cpuidle-tegra20.c | 197 ++++++++++++++++++++++++++++++++-
 arch/arm/mach-tegra/flowctrl.c        |  38 ++++++-
 arch/arm/mach-tegra/flowctrl.h        |   4 +
 arch/arm/mach-tegra/irq.c             |  15 +++
 arch/arm/mach-tegra/irq.h             |  22 ++++
 arch/arm/mach-tegra/pm.c              |   3 +
 arch/arm/mach-tegra/sleep-tegra20.S   | 200 ++++++++++++++++++++++++++++++++++
 arch/arm/mach-tegra/sleep.S           |  19 ++++
 arch/arm/mach-tegra/sleep.h           |  26 +++++
 drivers/clk/tegra/clk-tegra20.c       |  93 ++++++++++++++++
 11 files changed, 609 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm/mach-tegra/irq.h

-- 
1.8.0.3
