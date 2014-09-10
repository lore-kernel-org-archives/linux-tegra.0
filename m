From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 0/4] tegra: Some patches to improve MIPI d-phy calibration
Date: Wed, 10 Sep 2014 10:52:01 -0400
Message-ID: <1410360725-4286-1-git-send-email-seanpaul@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

A few patches to make mipi d-phy calibration match the procedure in the TRM,
as well as making sure the mipi-cal clk has the correct parent.

Sean Paul (4):
  clk: tegra: Move mipi-cal initialization into clk-tegra1[12]4.c
  host1x: MIPI: Preserve the contents of MIPI_CAL_CTRL
  host1x: MIPI: Include clock lanes in MIPI calibrate
  host1x: MIPI: Set MIPI_CAL_BIAS_PAD_CFG1 register

 drivers/clk/tegra/clk-tegra-periph.c |   1 -
 drivers/clk/tegra/clk-tegra114.c     |   5 ++
 drivers/clk/tegra/clk-tegra124.c     |   5 ++
 drivers/gpu/host1x/mipi.c            | 119 ++++++++++++++++++++++++++---------
 4 files changed, 101 insertions(+), 29 deletions(-)

-- 
2.0.0
