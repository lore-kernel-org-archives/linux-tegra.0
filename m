From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/6] Some Tegra I2C Updates
Date: Thu, 11 Aug 2016 11:16:54 +0100
Message-ID: <1470910620-9898-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add runtime-pm and pinctrl support for Tegra I2C driver.

The first 4 patches are trivial clean-up/simplification changes.

Jon Hunter (6):
  i2c: tegra: Add missing new line characters
  i2c: tegra: Remove non device-tree support
  i2c: tegra: Use device name for adapter name
  i2c: tegra: Simplify I2C resume
  i2c: tegra: Add runtime power-management support
  i2c: tegra: Add pinctrl support

 drivers/i2c/busses/i2c-tegra.c | 97 +++++++++++++++++++++++++++---------------
 1 file changed, 63 insertions(+), 34 deletions(-)

-- 
2.1.4
