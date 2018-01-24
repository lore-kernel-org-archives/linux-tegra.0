From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/6] Tegra210 DFLL implementation
Date: Wed, 24 Jan 2018 14:45:31 +0200
Message-ID: <1516797938-32044-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This series introduces support for the DFLL as a CPU clock source
on Tegra210. As Jetson TX2 uses a PWM controlled regulator IC which
is driven directly by the DFLLs PWM output, we also introduce support
for PWM regulators next to I2C controlled regulators. The DFLL output
frequency is directly controlled by the regulator voltage. The registers
for controlling the PWM are part of the DFLL IP block, so there's no
separate linux regulator object involved because the regulator IC only
supplies the rail powering the DFLL and the CPUs. It doesn't have any
other controls.

Changes since v1:
* improved commit messages
* some style cleanups

Peter De Schrijver (6):
  clk: tegra: dfll registration for multiple SoCs
  clk: tegra: DT align parameter for CVB calculation
  clk: tegra: add CVB tables for Tegra210 CPU DFLL
  clk: tegra: dfll: support PWM regulator control
  clk: tegra: build clk-dfll.c for Tegra124 and Tegra210
  cpufreq: tegra124-cpufreq: extend to support Tegra210

 drivers/clk/tegra/Kconfig                  |   5 +
 drivers/clk/tegra/Makefile                 |   2 +-
 drivers/clk/tegra/clk-dfll.c               | 481 +++++++++++++++++++++++-----
 drivers/clk/tegra/clk-dfll.h               |   7 +
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 492 ++++++++++++++++++++++++++++-
 drivers/clk/tegra/cvb.c                    |  18 +-
 drivers/clk/tegra/cvb.h                    |   6 +-
 drivers/cpufreq/tegra124-cpufreq.c         |  13 +-
 8 files changed, 920 insertions(+), 104 deletions(-)

-- 
1.9.1
