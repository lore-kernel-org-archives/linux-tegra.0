From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/4] ARM: tegra114: bring up secondary CPU for SMP
Date: Fri, 22 Feb 2013 14:44:47 +0800
Message-ID: <1361515491-16199-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This series bring up secondary CPU for Tegra114. Because we are going to
support generic power domain later, the conventional powergate driver will
be removed. So we add the CPU power on/off function in PMC driver first.

This series was dependent on the patches below.
"ARM: tegra: Fix unchecked return value"
"ARM: tegra30: fix the logical detection of power on sequence of warm boot CPUs"
"ARM: tegra: refactor tegra{20,30}_boot_secondary"

Joseph Lo (4):
  ARM: tegra: pmc: convert PMC driver to support DT only
  ARM: tegra: pmc: add power on function for secondary CPUs
  ARM: tegra30: platsmp: replace the CPU power on function in PMC driver
  ARM: tegra114: bring up secondary CPU for SMP

 arch/arm/mach-tegra/platsmp.c |  27 +++----
 arch/arm/mach-tegra/pmc.c     | 159 ++++++++++++++++++++++++++++++++++--------
 arch/arm/mach-tegra/pmc.h     |   4 ++
 3 files changed, 149 insertions(+), 41 deletions(-)

-- 
1.8.1.1
