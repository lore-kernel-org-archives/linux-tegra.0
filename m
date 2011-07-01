From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/3] ASoC: Tegra: Fixes and SPDIF support
Date: Fri,  1 Jul 2011 13:56:12 -0600
Message-ID: <1309550175-30551-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

A couple of small bug-fixes for the existing Tegra SPDIF support, and
a new SPDIF driver.

I've tested the SPDIF driver on Harmony. However, I'm not submitting the
ASoC machine support patch for inclusion in mainline, since it relies on
the board files registering some new platform devices, and we can't
upstream any board file changes right now. Still, this may be useful for
other board vendors to start working with internally.

For people interested in testing/using this, I can push the branch I used
for testing this on Harmony publicly sometime next week, hopefully. That
branch contains the board changes to support this, and the machine driver
change.

Stephen Warren (3):
  ASoC: Tegra: I2S: Ensure clock is enabled when writing regs
  ASoC: Tegra: I2S: s/clk_get_sys/clk_get/
  ASoC: Tegra: Implement SPDIF CPU DAI

 sound/soc/tegra/Kconfig       |    9 +
 sound/soc/tegra/Makefile      |    2 +
 sound/soc/tegra/tegra_i2s.c   |   10 +-
 sound/soc/tegra/tegra_spdif.c |  371 ++++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra_spdif.h |  473 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 862 insertions(+), 3 deletions(-)
 create mode 100644 sound/soc/tegra/tegra_spdif.c
 create mode 100644 sound/soc/tegra/tegra_spdif.h
