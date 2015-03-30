From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 00/11] clk/tegra: Changes for v4.1-rc1
Date: Mon, 30 Mar 2015 14:31:02 +0200
Message-ID: <1427718673-32011-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Hi everyone,

This series of patches is an accumulation of cleanups and fixes I have
been carrying around in my local tree for a while now. If there aren't
any objections I'll send this out as a pull-request to Mike sometime
soon.

Thierry

Dylan Reid (1):
  clk: tegra: Enable HDA to HDMI clocks on Tegra124

Thierry Reding (10):
  clk: tegra: Fix typo tabel -> table
  clk: tegra: Fix a bunch of sparse warnings
  clk: tegra: Various whitespace cleanups
  clk: tegra: Use consistent indentation
  clk: tegra: Remove needless initializations
  clk: tegra: Register the proper number of resets
  clk: tegra: Add peripheral registers for bank Y
  clk: tegra: Model oscillator as clock
  clk: tegra: Use generic tegra_osc_clk_init() on Tegra114
  clk: tegra: Use the proper parent for plld_dsi

 drivers/clk/tegra/clk-pll.c                     |  7 ++---
 drivers/clk/tegra/clk-tegra-fixed.c             | 24 +++++++++--------
 drivers/clk/tegra/clk-tegra-periph.c            |  2 +-
 drivers/clk/tegra/clk-tegra114.c                | 36 +++----------------------
 drivers/clk/tegra/clk-tegra124.c                | 22 ++++++++++-----
 drivers/clk/tegra/clk-tegra30.c                 | 23 ++++++++--------
 drivers/clk/tegra/clk.c                         | 16 ++++++++++-
 drivers/clk/tegra/clk.h                         | 10 +++----
 include/dt-bindings/clock/tegra124-car-common.h |  2 +-
 9 files changed, 70 insertions(+), 72 deletions(-)

-- 
2.3.2
