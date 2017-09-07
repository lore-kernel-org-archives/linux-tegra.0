From: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/4] firmware: tegra: add checks for BPMP error return code
Date: Thu, 7 Sep 2017 12:31:00 +0300
Message-ID: <cover.1504776489.git.talho@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

There is a bug in the BPMP driver as error code in response message is
not being checked.

Patch 1 adds the error code as part of tegra_bpmp_message struct and
propagates that code to callers

Patches 2 through 4 add code to client drivers to check the error code
appropriately

BR,
Timo

Timo Alho (4):
  firmware: tegra: propagate error code to caller
  clk: tegra: check BPMP response return code
  reset: tegra: check BPMP response return code
  soc/tegra: bpmp: check BPMP response return code

 drivers/clk/tegra/clk-bpmp.c       | 15 ++++++++++-----
 drivers/firmware/tegra/bpmp.c      | 22 ++++++++++++++++------
 drivers/reset/tegra/reset-bpmp.c   |  9 ++++++++-
 drivers/soc/tegra/powergate-bpmp.c | 15 +++++++++++++--
 include/soc/tegra/bpmp.h           |  1 +
 5 files changed, 48 insertions(+), 14 deletions(-)

-- 
2.7.4
