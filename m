From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 0/4] host1x: mipi: Some patches to improve d-phy calibration
Date: Thu,  7 Aug 2014 02:11:43 -0400
Message-ID: <1407391907-19488-1-git-send-email-seanpaul@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

A few patches to make mipi d-phy calibration match the procedure in the TRM,
as well as adding the option to enable a parent clock during calibration.

Sean Paul (4):
  host1x: mipi: Add new parent clock for mipi calibration
  host1x: mipi: Preserve the contents of MIPI_CAL_CTRL
  host1x: mipi: Include clock lanes in mipi calibrate
  host1x: mipi: Set MIPI_CAL_BIAS_PAD_CFG1 register

 .../bindings/mipi/nvidia,tegra114-mipi.txt         |  12 ++-
 drivers/gpu/host1x/mipi.c                          | 120 +++++++++++++++++----
 2 files changed, 105 insertions(+), 27 deletions(-)

-- 
2.0.0
