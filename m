From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/5] i2c: tegra: Code cleanups and suspend/resume related changes
Date: Tue, 10 Jul 2012 16:50:39 +0530
Message-ID: <1341919244-23327-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch series does:
- Code cleanups like removing unused variables, using already define function
- Use clock_disable_unprepare in place of clock_disable()
- Use dev_pm_ops for suspend/resume inplace of legacy suspend/resume callbacks.
- Convert suspend/resume to _noirq version to support late suspend/early resume.

Laxman Dewangan (5):
  i2c: tegra: remove unused member variable
  i2c: tegra: use clk_disable_unprepare in place of clk_disable
  i2c: tegra: use of_match_ptr() for match_table initialization
  i2c: tegra: Use struct dev_pm_ops for power management
  i2c: tegra: convert normal suspend/resume to *_noirq

 drivers/i2c/busses/i2c-tegra.c |   27 +++++++++++++++------------
 1 files changed, 15 insertions(+), 12 deletions(-)
