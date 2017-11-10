From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/4] MBIST WAR for Tegra210
Date: Fri, 10 Nov 2017 13:37:44 +0200
Message-ID: <1510313868-24810-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch series introduces the MBIST WAR needed when power ungating certain
domains. More details can be found in 'clk: tegra: MBIST WAR for Tegra210'.
I choose to implement the WAR in the Tegra210 clock driver, because most
accesses are to CAR registers and for the VENC domain, we need to make sure
the CSI clock source is not changed during the WAR execution.

Peter De Schrijver (4):
  clk: tegra: Add la clock for Tegra210
  clk: tegra: add fence_delay for clock registers
  clk: tegra: MBIST WAR for Tegra210
  soc/tegra: pmc: apply MBIST WAR for Tegra210

 drivers/clk/tegra/clk-tegra210.c         | 371 ++++++++++++++++++++++++++++++-
 drivers/clk/tegra/clk.h                  |   7 +
 drivers/soc/tegra/pmc.c                  |   5 +
 include/dt-bindings/clock/tegra210-car.h |   2 +-
 include/linux/clk/tegra.h                |   1 +
 5 files changed, 383 insertions(+), 3 deletions(-)

-- 
1.9.1
