From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/4] Introduce table driven initializations
Date: Wed, 4 Sep 2013 17:20:07 +0300
Message-ID: <1378304438-7780-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patchset introduces a table driven initialization method for the
audio, PMC and gate clocks. It's similar to the table we already have for                                                                                      
the periph clocks.                                                                                                                                             

Changes since v1:

* Use parent names directly in TEGRA_INIT_DATA_GATE()

Peter De Schrijver (4):
  clk: tegra: simplify periph clock data
  clk: tegra: convert Tegra114 gate clocks to table
  clk: tegra114: table driven audio clock init
  clk: tegra114: table driven PMC clock init

 drivers/clk/tegra/clk-tegra114.c |  892 +++++++++++++++-----------------------
 drivers/clk/tegra/clk-tegra20.c  |    4 +-
 drivers/clk/tegra/clk-tegra30.c  |    4 +-
 drivers/clk/tegra/clk.h          |   93 ++++-
 4 files changed, 436 insertions(+), 557 deletions(-)

-- 
1.7.7.rc0.72.g4b5ea.dirty
