From: Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 0/2] Make Tegra cpuidle driver PSCI compatible
Date: Wed, 23 Sep 2015 08:39:42 +0200
Message-ID: <cover.1442990383.git.jan.kiszka@siemens.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Seems those two fell under the table. So I'm resending, rebased over
current 4.3-rc2, resolving a conflict of patch 1.

Jan

Jan Kiszka (2):
  ARM: Availability of psci_smp_available depends on CONFIG_SMP
  ARM: tegra: Disable cpuidle driver if PSCI is present

 arch/arm/include/asm/psci.h | 2 +-
 arch/arm/mach-tegra/Kconfig | 1 +
 arch/arm/mach-tegra/tegra.c | 4 +++-
 3 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.1.4
