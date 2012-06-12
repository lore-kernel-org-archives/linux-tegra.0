From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/4]  i2c: tegra: Bug fixes, cleanups and M_NOSTART support
Date: Tue, 12 Jun 2012 16:07:27 +0530
Message-ID: <1339497451-26260-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch series having the:
- Handling of late register write due to Tegra PPSB design.
- support for I2C_M_NOSTART
- Use devm_* for all allocation.

Changes from V1:
Taking care of review comment from Wolfram in patch 1/4.

Laxman Dewangan (4):
  i2c: tegra: make sure register writes completes
  i2c: tegra: add PROTOCOL_MANGLING as supported functionality.
  i2c: tegra: support for I2C_M_NOSTART functionality
  i2c: tegra: make all resource allocation through devm_*

 drivers/i2c/busses/i2c-tegra.c |  110 ++++++++++++++++++++++------------------
 1 files changed, 60 insertions(+), 50 deletions(-)
