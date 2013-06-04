From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 0/4] ARM: tegra: cpuidle: some clean up for CPUidle driver
Date: Tue, 4 Jun 2013 18:47:31 +0800
Message-ID: <1370342855-32705-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This series has some clean ups for Tegra CPUidle drivers. Also make it
more gereric.

V2:
* fix some coding style and commit message

Tested on Seaboard, Cardhu and Dalmore.

Joseph Lo (4):
  ARM: tegra: cpuidle: move the init function behind the suspend init
    function
  ARM: tegra: hook tegra_tear_down_cpu function in the PM suspend init
    function
  ARM: tegra: cpuidle: using IS_ENABLED for multi SoCs management in
    init func
  ARM: tegra: don't pass CPU ID to tegra_{set,clear}_cpu_in_lp2

 arch/arm/mach-tegra/common.c          |  2 ++
 arch/arm/mach-tegra/cpuidle-tegra20.c | 10 +++-------
 arch/arm/mach-tegra/cpuidle-tegra30.c | 10 +++-------
 arch/arm/mach-tegra/cpuidle.c         | 19 +++++++------------
 arch/arm/mach-tegra/cpuidle.h         | 15 +++------------
 arch/arm/mach-tegra/pm.c              | 25 +++++++++++++++++++++----
 arch/arm/mach-tegra/pm.h              |  4 ++--
 7 files changed, 41 insertions(+), 44 deletions(-)

-- 
1.8.3
