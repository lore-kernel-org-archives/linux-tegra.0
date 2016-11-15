From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/2] i2c: Add Tegra BPMP I2C proxy driver
Date: Tue, 15 Nov 2016 17:23:48 +0100
Message-ID: <20161115162350.32405-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Hi Wolfram,

This series of patches depends on two branches in the Tegra tree, so I
think the easiest would be if you Acked-by'd this so that I can manage
the dependencies in the Tegra tree. The DT binding has already been
reviewed and I've tested the driver in my development tree for a while
and it's working great.

Thierry

Shardar Shariff Md (1):
  i2c: Add Tegra BPMP I2C proxy driver

Stephen Warren (1):
  dt-bindings: Add Tegra186 BPMP I2C binding

 .../bindings/i2c/nvidia,tegra186-bpmp-i2c.txt      |  42 +++
 drivers/i2c/busses/Kconfig                         |  13 +
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-tegra-bpmp.c                | 365 +++++++++++++++++++++
 4 files changed, 421 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
 create mode 100644 drivers/i2c/busses/i2c-tegra-bpmp.c

-- 
2.10.2
