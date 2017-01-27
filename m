From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 0/2] i2c: Add Tegra BPMP I2C proxy driver
Date: Fri, 27 Jan 2017 09:39:37 +0100
Message-ID: <20170127083939.20393-1-thierry.reding@gmail.com>
Return-path: <linux-i2c-owner@vger.kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi Wolfram,

I had originally sent these in for the last merge window but then got
bounces indicating that your email server was not accepting emails. At
the time it seemed like I wasn't the only one having these problems.

Looking at my mailbox that situation now seems to be resolved, so here's
hoping it'll work this time. Note that because of the above I've carried
this in the Tegra tree for a while now to get it more compile testing.
If you end up applying the set, please let me know so I can drop them
from the Tegra tree and avoid conflicts in linux-next.

On the bright side the dependencies for this were merged during the last
release cycle, so these should be good to go in without further
complications.

Thanks,
Thierry

Shardar Shariff Md (1):
  i2c: Add Tegra BPMP I2C proxy driver

Stephen Warren (1):
  dt-bindings: Add Tegra186 BPMP I2C binding

 .../bindings/i2c/nvidia,tegra186-bpmp-i2c.txt      |  42 +++
 drivers/i2c/busses/Kconfig                         |  11 +
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-tegra-bpmp.c                | 365 +++++++++++++++++++++
 4 files changed, 419 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
 create mode 100644 drivers/i2c/busses/i2c-tegra-bpmp.c

-- 
2.11.0
