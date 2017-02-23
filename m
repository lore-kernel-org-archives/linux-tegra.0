From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/7] Tegra210 clock bug fixes
Date: Thu, 23 Feb 2017 12:44:37 +0200
Message-ID: <1487846686-6388-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

A number of bug fixes for the Tegra210 clock implementation.

Changelog:

v2: add better description for 'remove non-existing pll_m_out1 clock'

Peter De Schrijver (7):
  clk: tegra: fix pll_a1 iddq register, add pll_a1
  clk: tegra: fix isp clock modelling
  clk: tegra: correct afi parent
  clk: tegra: remove non-existing pll_m_out1 clock
  clk: tegra: don't warn for PLL defaults unnecessarily
  clk: tegra: correct tegra210_pll_fixed_mdiv_cfg rate calculation
  clk: tegra: fix type for m field

 drivers/clk/tegra/clk-id.h               |  1 +
 drivers/clk/tegra/clk-tegra-periph.c     | 13 +++++++++---
 drivers/clk/tegra/clk-tegra210.c         | 35 ++++++++++++++++++++------------
 drivers/clk/tegra/clk.h                  |  2 +-
 include/dt-bindings/clock/tegra210-car.h |  4 ++--
 5 files changed, 36 insertions(+), 19 deletions(-)

-- 
1.9.1
