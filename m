From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/5] i2c: tegra: Various fixes and improvements
Date: Wed,  6 May 2020 21:33:53 +0200
Message-ID: <20200506193358.2807244-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Hi Wolfram, Dmitry,

here's the full set of patches that I've been running local tests on and
which looks like it has no other issues. I'm going to run this through
our internal test system to make sure there aren't any regressions. I
can carry these in the Tegra tree for a little bit until we're
reasonable sure that these patches are all safe to apply and then send a
pull request sometime next week.

I've also included a patch as suggested by Dmitry to keep I2C interrupts
enabled during suspend/resume and I'm currently checking if that may be
a fix for a suspend/resume issue that I've seen on Jetson Nano where we
don't have working suspend/resume yet.

Thierry

Dmitry Osipenko (2):
  i2c: tegra: Better handle case where CPU0 is busy for a long time
  i2c: tegra: Synchronize DMA before termination

Thierry Reding (3):
  Revert "i2c: tegra: Fix suspending in active runtime PM state"
  i2c: tegra: Restore pinmux on system resume
  i2c: tegra: Keep IRQs enabled during suspend/resume

 drivers/i2c/busses/i2c-tegra.c | 61 +++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 26 deletions(-)

-- 
2.24.1
